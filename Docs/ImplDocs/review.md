# DecalEx Performance Review

Date: 2026-03-15
Scope: `Shaders/custom.hlsl` (runtime pixel shader path), static code review only (no GPU profiler capture)

## Executive Summary

The current implementation is functionally rich and well-structured, but the fragment path can become expensive when multiple features are enabled at once.

Most impactful opportunities are:

1. Reduce per-pixel trig / basis recomputation for rotated UV and Z-roll cancellation.
2. Avoid unnecessary texture fetches outside decal bounds.
3. Replace runtime blend-mode branching with keyworded variants where practical.

In worst-case settings (all modules active), this extension can reach roughly 14 texture samples per pixel in `BEFORE_MATCAP`, plus many ALU-heavy branches and `pow()` calls.

---

## Findings (by severity)

### [High] Per-pixel trigonometric cost is repeated across multiple modules

- Evidence:
  - `DNKW_DecalMaskUV` performs `sincos()` per call: `Shaders/custom.hlsl:169`, `Shaders/custom.hlsl:174`
  - Called in multiple paths: `Shaders/custom.hlsl:222`, `Shaders/custom.hlsl:280`, `Shaders/custom.hlsl:291`, `Shaders/custom.hlsl:386`
- Impact:
  - `sincos` is not free; calling it per pixel and per active module increases ALU pressure significantly.
  - With several features active, the same angle-based transform pattern is repeated many times per fragment.
- Recommendation:
  - Precompute `sin/cos` on CPU (or in CBUFFER as packed rotation params) when angle properties change.
  - Replace runtime trig with a direct 2x2 rotation multiply using precomputed values.
  - If visual requirements allow, quantize angle updates to reduce parameter churn.

### [High] Z-roll cancellation basis is reconstructed per pixel in each MatCap path

- Evidence:
  - Base MatCap Z-roll path: `Shaders/custom.hlsl:197`-`Shaders/custom.hlsl:207`
  - Slot1 MatCap Z-roll path: `Shaders/custom.hlsl:329`-`Shaders/custom.hlsl:335`
  - Slot2 MatCap Z-roll path: `Shaders/custom.hlsl:424`-`Shaders/custom.hlsl:430`
  - Uses repeated `cross`, `length`, normalize-style work on camera-derived vectors.
- Impact:
  - Camera basis is frame-level data, but currently rebuilt per pixel and per active MatCap block.
  - Creates avoidable ALU cost in the hottest path.
- Recommendation:
  - Precompute roll-cancel basis once per frame (global shader params) or once per vertex (if precision is acceptable).
  - Reuse shared basis across all MatCap blocks in the fragment stage.

### [High] Outside-decal pixels still execute expensive sampling in Slot1/Slot2

- Evidence:
  - Bounds computed: `Shaders/custom.hlsl:292`, `Shaders/custom.hlsl:387`
  - But texture fetches are still unconditional after that:
    - Slot1 normal/decal fetch: `Shaders/custom.hlsl:299`, `Shaders/custom.hlsl:304`
    - Slot2 normal/decal fetch: `Shaders/custom.hlsl:394`, `Shaders/custom.hlsl:399`
- Impact:
  - Pixels outside projected decal area can still pay for normal/decal sampling (and subsequent blend math), especially costly on large meshes with small decals.
- Recommendation:
  - Add an early gate before expensive work, for example only evaluate slot shading when shared mask is above a tiny threshold.
  - Keep branch coherence in mind; this usually helps when decal coverage is sparse.

### [Medium] Runtime blend-mode chains create long dynamic branches in fragment path

- Evidence:
  - MatCap blend chain: `Shaders/custom.hlsl:251`-`Shaders/custom.hlsl:266`
  - Slot1 decal blend chain begins: `Shaders/custom.hlsl:308`-`Shaders/custom.hlsl:309`
  - Slot2 decal blend chain begins: `Shaders/custom.hlsl:403`-`Shaders/custom.hlsl:404`
  - Similar chains also exist for Slot1/Slot2 MatCap blending.
- Impact:
  - Blend mode is material-constant but chosen via runtime `if/else` trees per fragment.
  - Increased instruction footprint and potential branch overhead.
- Recommendation:
  - Prefer `shader_feature_local` / multi-compile style specialization for blend modes that are heavily used.
  - If variant count must stay low, at least reduce branch depth for common blend presets.

### [Medium] Feature-gating is purely runtime, so disabled modules still cost branch checks every pixel

- Evidence:
  - All module macros are always present in `BEFORE_MATCAP`: `Shaders/custom.hlsl:481`-`Shaders/custom.hlsl:486`
- Impact:
  - Even when most features are disabled, each pixel still executes multiple enable-condition branches.
  - Cost is small individually but accumulates across large avatar surfaces.
- Recommendation:
  - Add keyword-driven compilation for top-level module enables where possible (MatCap/Emission/Slot1/Slot2).
  - This enables stripping unused paths from generated shader variants.

### [Low] Potentially high sample count in fully enabled configuration

- Evidence:
  - MatCap block can sample up to 2 textures (`MatCap + mask`): `Shaders/custom.hlsl:217`, `Shaders/custom.hlsl:224`
  - Emission block can sample up to 2 (`emission + mask`): `Shaders/custom.hlsl:276`, `Shaders/custom.hlsl:282`
  - Each slot can sample up to 5 (`mask + normal + decal + matcap + emission`): Slot1 around `Shaders/custom.hlsl:295`, `Shaders/custom.hlsl:299`, `Shaders/custom.hlsl:304`, `Shaders/custom.hlsl:340`, `Shaders/custom.hlsl:376`; Slot2 around `Shaders/custom.hlsl:390`, `Shaders/custom.hlsl:394`, `Shaders/custom.hlsl:399`, `Shaders/custom.hlsl:435`, `Shaders/custom.hlsl:471`
- Impact:
  - Worst-case is roughly 14 texture samples/pixel before base lilToon costs.
- Recommendation:
  - Define quality tiers (mobile/desktop) and hard-cap simultaneous features per material profile.

---

## Suggested Optimization Order

1. Move angle trig and Z-roll basis work out of per-pixel paths.
2. Add early-out/gating for out-of-bounds slot pixels before expensive fetches.
3. Introduce compile-time specialization for major module toggles and common blend modes.
4. Validate with Unity Frame Debugger + RenderDoc/PIX timing capture on representative avatars.

---

## Notes

- This review is static-analysis based; final priority should be confirmed with GPU profiling on target hardware (Quest/PCVR separately).
- No behavioral regressions were introduced, since this review did not modify runtime shader code.
