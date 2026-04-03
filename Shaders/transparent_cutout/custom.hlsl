//----------------------------------------------------------------------------------------------------------------------
// Macro

// Custom variables
#define LIL_CUSTOM_PROPERTIES \
    /* Decal Slot 1 */ \
    float  _DecalSlot1_Enable; \
    float  _DecalSlot1_DisableBackface; \
    float  _DecalSlot1_OffsetX; \
    float  _DecalSlot1_OffsetY; \
    float  _DecalSlot1_ScaleX; \
    float  _DecalSlot1_ScaleY; \
    float  _DecalSlot1_Angle; \
    float4 _DecalSlot1_Color; \
    int    _DecalSlot1_Blend; \
    float  _DecalSlot1_Alpha; \
    float  _DecalSlot1_UseMask; \
    float4 _DecalSlot1_Tex_ST; \
    float4 _DecalSlot1_Mask_ST; \
    float  _DecalSlot1_MatCap_Enable; \
    float4 _DecalSlot1_MatCap_Color; \
    int    _DecalSlot1_MatCap_Blend; \
    float  _DecalSlot1_MatCap_Alpha; \
    float  _DecalSlot1_MatCap_MainColorPower; \
    float  _DecalSlot1_MatCap_BumpScale; \
    float  _DecalSlot1_MatCap_UseReflection; \
    float  _DecalSlot1_MatCap_EnableLighting; \
    float  _DecalSlot1_MatCap_ShadowStrength; \
    float  _DecalSlot1_MatCap_Blur; \
\
    float4 _DecalSlot1_MatCap_Tex_ST; \
    float  _DecalSlot1_NormalMap_Enable; \
    float  _DecalSlot1_NormalMap_Scale; \
    float  _DecalSlot1_LilToon_NormalMap_Scale; \
    float4 _DecalSlot1_NormalMap_Tex_ST; \
    float  _DecalSlot1_Emission_Enable; \
    float4 _DecalSlot1_Emission_Color; \
    float  _DecalSlot1_Emission_Strength; \
    float  _DecalSlot1_Emission_Opacity; \
    float  _DecalSlot1_Emission_UseTex; \
    float4 _DecalSlot1_Emission_Tex_ST; \
    float  _DecalSlot1_Emission_SinEnable; \
    float  _DecalSlot1_Emission_SinSpeed; \
    float  _DecalSlot1_Emission_SinMin; \
    float  _DecalSlot1_Emission_SinMax; \
    float  _DecalSlot1_Emission_PulseEnable; \
    float  _DecalSlot1_Emission_PulseProbability1; \
    float  _DecalSlot1_Emission_PulseDuration1; \
    float  _DecalSlot1_Emission_PulseProbability2; \
    float  _DecalSlot1_Emission_PulseDuration2; \
    float  _DecalSlot1_Emission_ScrollEnable; \
    float  _DecalSlot1_Emission_ScrollX; \
    float  _DecalSlot1_Emission_ScrollY; \
    float4 _DecalSlot1_Emission_ScrollMask_ST; \
    float  _DecalSlot1_Emission_ALEnable; \
    float  _DecalSlot1_Emission_ALBass; \
    float  _DecalSlot1_Emission_ALLowMid; \
    float  _DecalSlot1_Emission_ALHighMid; \
    float  _DecalSlot1_Emission_ALTreble; \
    float  _DecalSlot1_Emission_ALWaveEnable; \
    float  _DecalSlot1_Emission_ALWaveAxis; \
    /* Decal Slot 2 */ \
    float  _DecalSlot2_Enable; \
    float  _DecalSlot2_DisableBackface; \
    float  _DecalSlot2_OffsetX; \
    float  _DecalSlot2_OffsetY; \
    float  _DecalSlot2_ScaleX; \
    float  _DecalSlot2_ScaleY; \
    float  _DecalSlot2_Angle; \
    float4 _DecalSlot2_Color; \
    int    _DecalSlot2_Blend; \
    float  _DecalSlot2_Alpha; \
    float  _DecalSlot2_UseMask; \
    float4 _DecalSlot2_Tex_ST; \
    float4 _DecalSlot2_Mask_ST; \
    float  _DecalSlot2_MatCap_Enable; \
    float4 _DecalSlot2_MatCap_Color; \
    int    _DecalSlot2_MatCap_Blend; \
    float  _DecalSlot2_MatCap_Alpha; \
    float  _DecalSlot2_MatCap_MainColorPower; \
    float  _DecalSlot2_MatCap_BumpScale; \
    float  _DecalSlot2_MatCap_UseReflection; \
    float  _DecalSlot2_MatCap_EnableLighting; \
    float  _DecalSlot2_MatCap_ShadowStrength; \
    float  _DecalSlot2_MatCap_Blur; \
\
    float4 _DecalSlot2_MatCap_Tex_ST; \
    float  _DecalSlot2_NormalMap_Enable; \
    float  _DecalSlot2_NormalMap_Scale; \
    float  _DecalSlot2_LilToon_NormalMap_Scale; \
    float4 _DecalSlot2_NormalMap_Tex_ST;

// Custom textures
#define LIL_CUSTOM_TEXTURES \
    TEXTURE2D(_DecalSlot1_Tex); \
    TEXTURE2D(_DecalSlot1_Mask); \
    TEXTURE2D(_DecalSlot1_MatCap_Tex); \
    TEXTURE2D(_DecalSlot1_Emission_Tex); \
    TEXTURE2D(_DecalSlot1_NormalMap_Tex); \
    TEXTURE2D(_DecalSlot2_Tex); \
    TEXTURE2D(_DecalSlot2_Mask); \
    TEXTURE2D(_DecalSlot2_MatCap_Tex); \
    TEXTURE2D(_DecalSlot2_NormalMap_Tex); \
    TEXTURE2D(_DecalSlot1_Emission_ScrollMask);

// Add vertex shader input
//#define LIL_REQUIRE_APP_POSITION
//#define LIL_REQUIRE_APP_TEXCOORD0
//#define LIL_REQUIRE_APP_TEXCOORD1
//#define LIL_REQUIRE_APP_TEXCOORD2
//#define LIL_REQUIRE_APP_TEXCOORD3
//#define LIL_REQUIRE_APP_TEXCOORD4
//#define LIL_REQUIRE_APP_TEXCOORD5
//#define LIL_REQUIRE_APP_TEXCOORD6
//#define LIL_REQUIRE_APP_TEXCOORD7
//#define LIL_REQUIRE_APP_COLOR
//#define LIL_REQUIRE_APP_NORMAL
//#define LIL_REQUIRE_APP_TANGENT
//#define LIL_REQUIRE_APP_VERTEXID

// Add vertex shader output
//#define LIL_V2F_FORCE_TEXCOORD0
//#define LIL_V2F_FORCE_TEXCOORD1
//#define LIL_V2F_FORCE_POSITION_OS
//#define LIL_V2F_FORCE_POSITION_WS
//#define LIL_V2F_FORCE_POSITION_SS
//#define LIL_V2F_FORCE_NORMAL
//#define LIL_V2F_FORCE_TANGENT
//#define LIL_V2F_FORCE_BITANGENT
//#define LIL_CUSTOM_V2F_MEMBER(id0,id1,id2,id3,id4,id5,id6,id7)

// Add vertex copy
#define LIL_CUSTOM_VERT_COPY

// Inserting a process into the vertex shader
//#define LIL_CUSTOM_VERTEX_OS
//#define LIL_CUSTOM_VERTEX_WS

//----------------------------------------------------------------------------------------------------------------------
// Helper: Positioned Mask UV
// offset : mask center in UV space  (default 0.5,0.5 = UV center)
// scale  : mask size in UV units    (default 1.0,1.0 = full UV)
// angle  : rotation in degrees
#ifndef DNKW_DECAL_MASK_UV_DEFINED
#define DNKW_DECAL_MASK_UV_DEFINED
float2 DNKW_DecalMaskUV(float2 uv, float2 offset, float2 scale, float sinA, float cosA)
{
    // Rotate around UV center (0.5, 0.5) first - matching lilToon's lilCalcDecalUV behavior
    // sinA/cosA are precomputed by the caller to avoid duplicate sincos calls
    float2 d = uv - 0.5;
    d = float2(d.x * cosA - d.y * sinA, d.x * sinA + d.y * cosA);
    d += 0.5;
    // Then apply position offset and scale
    return (d - offset) / max(scale, 0.0001) + 0.5;
}
#endif

//----------------------------------------------------------------------------------------------------------------------
// Helper: Blend mode calculation (shared across all slots to reduce code duplication)
#ifndef DNKW_BLEND_COLORS_DEFINED
#define DNKW_BLEND_COLORS_DEFINED
float3 DNKW_BlendColors(float3 base, float3 overlay, int mode)
{
    if      (mode == 0) return base + overlay;
    else if (mode == 1) return 1.0 - (1.0 - base) * (1.0 - overlay);
    else if (mode == 2) return base * overlay;
    else if (mode == 3) return (1.0-2.0*overlay)*base*base + 2.0*overlay*base;
    else                return overlay;
}
#endif

// AudioLink emission helper macros (no-op: AudioLink removed from this branch)
#define DNKW_AL_EMISSION_S1_LOGIC
#define DNKW_AL_EMISSION_S2_LOGIC

// Note: the MatCap camera basis (_dnkw_wvd/vrt/vup) is computed once in BEFORE_MATCAP
// rather than as a helper function, because HLSLINCLUDE is compiled before Unity's built-in
// cbuffer declarations (UNITY_MATRIX_V is undefined at HLSLINCLUDE scope).
// The basis is shared across both slot macros to avoid duplicate computation.

//----------------------------------------------------------------------------------------------------------------------
// Normal Map Logic — placed in BEFORE_NORMAL_2ND so it blends into lilToon's tangent-space
// normalmap accumulator after the 1st normal pass. fd.N is then set from the final normalmap,
// so shadows, reflections, and all subsequent lighting correctly use the decal normal.
// NOTE: this hook only runs when LIL_FEATURE_NORMAL_1ST or LIL_FEATURE_NORMAL_2ND is enabled.
// UV/mask computation is repeated here (instead of sharing with the main slot logic) because
// these two hooks expand into different locations in the fragment shader.

#define DNKW_DECAL_SLOT1_NORMAL_LOGIC \
    if (_DecalSlot1_Enable > 0.5 && _DecalSlot1_NormalMap_Enable > 0.5) { \
        float2 ddxUV_nm1 = ddx(fd.uv0); \
        float2 ddyUV_nm1 = ddy(fd.uv0); \
        float rad_nm1 = _DecalSlot1_Angle * 0.01745329252f; \
        float sinA_nm1, cosA_nm1; \
        sincos(rad_nm1, sinA_nm1, cosA_nm1); \
        float2 slotUV_nm1 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot1_OffsetX, _DecalSlot1_OffsetY), float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), sinA_nm1, cosA_nm1); \
        float inBounds_nm1 = step(0.0, slotUV_nm1.x) * step(slotUV_nm1.x, 1.0) * step(0.0, slotUV_nm1.y) * step(slotUV_nm1.y, 1.0); \
        float2 dxR_nm1 = float2(ddxUV_nm1.x*cosA_nm1 - ddxUV_nm1.y*sinA_nm1, ddxUV_nm1.x*sinA_nm1 + ddxUV_nm1.y*cosA_nm1); \
        float2 dyR_nm1 = float2(ddyUV_nm1.x*cosA_nm1 - ddyUV_nm1.y*sinA_nm1, ddyUV_nm1.x*sinA_nm1 + ddyUV_nm1.y*cosA_nm1); \
        float2 safeScale_nm1 = max(float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_nm1 = dxR_nm1 / safeScale_nm1; \
        float2 dySlot_nm1 = dyR_nm1 / safeScale_nm1; \
        float sharedMask_nm1 = inBounds_nm1; \
        if (_DecalSlot1_UseMask > 0.5) { \
            sharedMask_nm1 = _DecalSlot1_Mask.SampleGrad(sampler_linear_clamp, slotUV_nm1, dxSlot_nm1, dySlot_nm1).r * inBounds_nm1; \
        } \
        if (_DecalSlot1_DisableBackface > 0.5 && fd.facing < 0) sharedMask_nm1 = 0.0; \
        float2 nmUV_nm1 = slotUV_nm1 * _DecalSlot1_NormalMap_Tex_ST.xy + _DecalSlot1_NormalMap_Tex_ST.zw; \
        float2 nmDx_nm1 = dxSlot_nm1 * _DecalSlot1_NormalMap_Tex_ST.xy; \
        float2 nmDy_nm1 = dySlot_nm1 * _DecalSlot1_NormalMap_Tex_ST.xy; \
        float4 nmTex_nm1 = _DecalSlot1_NormalMap_Tex.SampleGrad(sampler_linear_repeat, nmUV_nm1, nmDx_nm1, nmDy_nm1); \
        float3 nmTS_nm1 = lilUnpackNormalScale(nmTex_nm1, _DecalSlot1_NormalMap_Scale); \
        normalmap = normalize(lerp(normalmap, nmTS_nm1, sharedMask_nm1)); \
    }

#define DNKW_DECAL_SLOT2_NORMAL_LOGIC \
    if (_DecalSlot2_Enable > 0.5 && _DecalSlot2_NormalMap_Enable > 0.5) { \
        float2 ddxUV_nm2 = ddx(fd.uv0); \
        float2 ddyUV_nm2 = ddy(fd.uv0); \
        float rad_nm2 = _DecalSlot2_Angle * 0.01745329252f; \
        float sinA_nm2, cosA_nm2; \
        sincos(rad_nm2, sinA_nm2, cosA_nm2); \
        float2 slotUV_nm2 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot2_OffsetX, _DecalSlot2_OffsetY), float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), sinA_nm2, cosA_nm2); \
        float inBounds_nm2 = step(0.0, slotUV_nm2.x) * step(slotUV_nm2.x, 1.0) * step(0.0, slotUV_nm2.y) * step(slotUV_nm2.y, 1.0); \
        float2 dxR_nm2 = float2(ddxUV_nm2.x*cosA_nm2 - ddxUV_nm2.y*sinA_nm2, ddxUV_nm2.x*sinA_nm2 + ddxUV_nm2.y*cosA_nm2); \
        float2 dyR_nm2 = float2(ddyUV_nm2.x*cosA_nm2 - ddyUV_nm2.y*sinA_nm2, ddyUV_nm2.x*sinA_nm2 + ddyUV_nm2.y*cosA_nm2); \
        float2 safeScale_nm2 = max(float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_nm2 = dxR_nm2 / safeScale_nm2; \
        float2 dySlot_nm2 = dyR_nm2 / safeScale_nm2; \
        float sharedMask_nm2 = inBounds_nm2; \
        if (_DecalSlot2_UseMask > 0.5) { \
            sharedMask_nm2 = _DecalSlot2_Mask.SampleGrad(sampler_linear_clamp, slotUV_nm2, dxSlot_nm2, dySlot_nm2).r * inBounds_nm2; \
        } \
        if (_DecalSlot2_DisableBackface > 0.5 && fd.facing < 0) sharedMask_nm2 = 0.0; \
        float2 nmUV_nm2 = slotUV_nm2 * _DecalSlot2_NormalMap_Tex_ST.xy + _DecalSlot2_NormalMap_Tex_ST.zw; \
        float2 nmDx_nm2 = dxSlot_nm2 * _DecalSlot2_NormalMap_Tex_ST.xy; \
        float2 nmDy_nm2 = dySlot_nm2 * _DecalSlot2_NormalMap_Tex_ST.xy; \
        float4 nmTex_nm2 = _DecalSlot2_NormalMap_Tex.SampleGrad(sampler_linear_repeat, nmUV_nm2, nmDx_nm2, nmDy_nm2); \
        float3 nmTS_nm2 = lilUnpackNormalScale(nmTex_nm2, _DecalSlot2_NormalMap_Scale); \
        normalmap = normalize(lerp(normalmap, nmTS_nm2, sharedMask_nm2)); \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 1 Logic
#define DNKW_DECAL_SLOT1_LOGIC \
    float2 ddxUV_s1 = ddx(fd.uv0); \
    float2 ddyUV_s1 = ddy(fd.uv0); \
    if (_DecalSlot1_Enable > 0.5) { \
        float rad_s1  = _DecalSlot1_Angle * 0.01745329252f; \
        float sinA_s1, cosA_s1; \
        sincos(rad_s1, sinA_s1, cosA_s1); \
        float2 slotUV_s1 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot1_OffsetX, _DecalSlot1_OffsetY), float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), sinA_s1, cosA_s1); \
        float inBounds_s1 = step(0.0, slotUV_s1.x) * step(slotUV_s1.x, 1.0) * step(0.0, slotUV_s1.y) * step(slotUV_s1.y, 1.0); \
        float sharedMask_s1 = inBounds_s1; \
        float2 dxR_s1    = float2(ddxUV_s1.x*cosA_s1 - ddxUV_s1.y*sinA_s1, ddxUV_s1.x*sinA_s1 + ddxUV_s1.y*cosA_s1); \
        float2 dyR_s1    = float2(ddyUV_s1.x*cosA_s1 - ddyUV_s1.y*sinA_s1, ddyUV_s1.x*sinA_s1 + ddyUV_s1.y*cosA_s1); \
        float2 safeScale_s1 = max(float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_s1 = dxR_s1 / safeScale_s1; \
        float2 dySlot_s1 = dyR_s1 / safeScale_s1; \
        if (_DecalSlot1_UseMask > 0.5) { \
            sharedMask_s1 = _DecalSlot1_Mask.SampleGrad(sampler_linear_clamp, slotUV_s1, dxSlot_s1, dySlot_s1).r * inBounds_s1; \
        } \
        if (_DecalSlot1_DisableBackface > 0.5 && fd.facing < 0) sharedMask_s1 = 0.0; \
        float3 scaledN_s1 = normalize(lerp(fd.origN, fd.N, _DecalSlot1_LilToon_NormalMap_Scale)); \
        fd.N = normalize(lerp(fd.N, scaledN_s1, sharedMask_s1)); \
        if (_DecalSlot1_NormalMap_Enable > 0.5) { \
            float2 nmUV_s1  = slotUV_s1 * _DecalSlot1_NormalMap_Tex_ST.xy + _DecalSlot1_NormalMap_Tex_ST.zw; \
            float2 nmDx_s1  = dxSlot_s1 * _DecalSlot1_NormalMap_Tex_ST.xy; \
            float2 nmDy_s1  = dySlot_s1 * _DecalSlot1_NormalMap_Tex_ST.xy; \
            float4 nmTex_s1 = _DecalSlot1_NormalMap_Tex.SampleGrad(sampler_linear_repeat, nmUV_s1, nmDx_s1, nmDy_s1); \
            float3 decalNM_ts_s1 = lilUnpackNormalScale(nmTex_s1, _DecalSlot1_NormalMap_Scale); \
            float3 decalN_ws_s1  = normalize(mul(decalNM_ts_s1, fd.TBN)); \
            fd.N = normalize(lerp(fd.N, decalN_ws_s1, sharedMask_s1)); \
        } \
        float4 decalTex_s1   = _DecalSlot1_Tex.SampleGrad(sampler_linear_clamp, slotUV_s1, dxSlot_s1, dySlot_s1); \
        float3 decalColor_s1 = decalTex_s1.rgb * _DecalSlot1_Color.rgb; \
        float  decalW_s1     = decalTex_s1.a * saturate(_DecalSlot1_Alpha) * sharedMask_s1; \
        fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, decalColor_s1, _DecalSlot1_Blend), decalW_s1); \
        if (_DecalSlot1_MatCap_Enable > 0.5) { \
            float3 Nmc_s1 = normalize(lerp(fd.origN, fd.N, _DecalSlot1_MatCap_BumpScale)); \
            if (_DecalSlot1_MatCap_UseReflection > 0.5) Nmc_s1 = reflect(-fd.V, Nmc_s1); \
            float3 Nvs_s1 = float3(dot(_dnkw_vrt, Nmc_s1), dot(_dnkw_vup, Nmc_s1), dot(_dnkw_wvd, Nmc_s1)); \
            Nvs_s1.z *= -1.0; \
            float2 uvmc_s1  = Nvs_s1.xy * 0.5 + 0.5; \
            float4 mcTex_s1 = LIL_SAMPLE_2D_LOD(_DecalSlot1_MatCap_Tex, sampler_linear_clamp, uvmc_s1, _DecalSlot1_MatCap_Blur * 8.0); \
            float3 mcCol_s1 = mcTex_s1.rgb * _DecalSlot1_MatCap_Color.rgb * lerp(1.0, fd.albedo, _DecalSlot1_MatCap_MainColorPower); \
            float  mcMask_s1 = sharedMask_s1 * saturate(_DecalSlot1_MatCap_Alpha); \
            mcCol_s1 *= lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot1_MatCap_ShadowStrength) * lerp(float3(1,1,1), fd.lightColor, _DecalSlot1_MatCap_EnableLighting); \
            fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, mcCol_s1, _DecalSlot1_MatCap_Blend), mcMask_s1); \
        } \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 2 Logic
#define DNKW_DECAL_SLOT2_LOGIC \
    float2 ddxUV_s2 = ddx(fd.uv0); \
    float2 ddyUV_s2 = ddy(fd.uv0); \
    if (_DecalSlot2_Enable > 0.5) { \
        float rad_s2  = _DecalSlot2_Angle * 0.01745329252f; \
        float sinA_s2, cosA_s2; \
        sincos(rad_s2, sinA_s2, cosA_s2); \
        float2 slotUV_s2 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot2_OffsetX, _DecalSlot2_OffsetY), float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), sinA_s2, cosA_s2); \
        float inBounds_s2 = step(0.0, slotUV_s2.x) * step(slotUV_s2.x, 1.0) * step(0.0, slotUV_s2.y) * step(slotUV_s2.y, 1.0); \
        float sharedMask_s2 = inBounds_s2; \
        float2 dxR_s2    = float2(ddxUV_s2.x*cosA_s2 - ddxUV_s2.y*sinA_s2, ddxUV_s2.x*sinA_s2 + ddxUV_s2.y*cosA_s2); \
        float2 dyR_s2    = float2(ddyUV_s2.x*cosA_s2 - ddyUV_s2.y*sinA_s2, ddyUV_s2.x*sinA_s2 + ddyUV_s2.y*cosA_s2); \
        float2 safeScale_s2 = max(float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_s2 = dxR_s2 / safeScale_s2; \
        float2 dySlot_s2 = dyR_s2 / safeScale_s2; \
        if (_DecalSlot2_UseMask > 0.5) { \
            sharedMask_s2 = _DecalSlot2_Mask.SampleGrad(sampler_linear_clamp, slotUV_s2, dxSlot_s2, dySlot_s2).r * inBounds_s2; \
        } \
        if (_DecalSlot2_DisableBackface > 0.5 && fd.facing < 0) sharedMask_s2 = 0.0; \
        float3 scaledN_s2 = normalize(lerp(fd.origN, fd.N, _DecalSlot2_LilToon_NormalMap_Scale)); \
        fd.N = normalize(lerp(fd.N, scaledN_s2, sharedMask_s2)); \
        if (_DecalSlot2_NormalMap_Enable > 0.5) { \
            float2 nmUV_s2  = slotUV_s2 * _DecalSlot2_NormalMap_Tex_ST.xy + _DecalSlot2_NormalMap_Tex_ST.zw; \
            float2 nmDx_s2  = dxSlot_s2 * _DecalSlot2_NormalMap_Tex_ST.xy; \
            float2 nmDy_s2  = dySlot_s2 * _DecalSlot2_NormalMap_Tex_ST.xy; \
            float4 nmTex_s2 = _DecalSlot2_NormalMap_Tex.SampleGrad(sampler_linear_repeat, nmUV_s2, nmDx_s2, nmDy_s2); \
            float3 decalNM_ts_s2 = lilUnpackNormalScale(nmTex_s2, _DecalSlot2_NormalMap_Scale); \
            float3 decalN_ws_s2  = normalize(mul(decalNM_ts_s2, fd.TBN)); \
            fd.N = normalize(lerp(fd.N, decalN_ws_s2, sharedMask_s2)); \
        } \
        float4 decalTex_s2   = _DecalSlot2_Tex.SampleGrad(sampler_linear_clamp, slotUV_s2, dxSlot_s2, dySlot_s2); \
        float3 decalColor_s2 = decalTex_s2.rgb * _DecalSlot2_Color.rgb; \
        float  decalW_s2     = decalTex_s2.a * saturate(_DecalSlot2_Alpha) * sharedMask_s2; \
        fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, decalColor_s2, _DecalSlot2_Blend), decalW_s2); \
        if (_DecalSlot2_MatCap_Enable > 0.5) { \
            float3 Nmc_s2 = normalize(lerp(fd.origN, fd.N, _DecalSlot2_MatCap_BumpScale)); \
            if (_DecalSlot2_MatCap_UseReflection > 0.5) Nmc_s2 = reflect(-fd.V, Nmc_s2); \
            float3 Nvs_s2 = float3(dot(_dnkw_vrt, Nmc_s2), dot(_dnkw_vup, Nmc_s2), dot(_dnkw_wvd, Nmc_s2)); \
            Nvs_s2.z *= -1.0; \
            float2 uvmc_s2  = Nvs_s2.xy * 0.5 + 0.5; \
            float4 mcTex_s2 = LIL_SAMPLE_2D_LOD(_DecalSlot2_MatCap_Tex, sampler_linear_clamp, uvmc_s2, _DecalSlot2_MatCap_Blur * 8.0); \
            float3 mcCol_s2 = mcTex_s2.rgb * _DecalSlot2_MatCap_Color.rgb * lerp(1.0, fd.albedo, _DecalSlot2_MatCap_MainColorPower); \
            float  mcMask_s2 = sharedMask_s2 * saturate(_DecalSlot2_MatCap_Alpha); \
            mcCol_s2 *= lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot2_MatCap_ShadowStrength) * lerp(float3(1,1,1), fd.lightColor, _DecalSlot2_MatCap_EnableLighting); \
            fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, mcCol_s2, _DecalSlot2_MatCap_Blend), mcMask_s2); \
        } \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 1 Emission Logic
#define DNKW_DECAL_SLOT1_EMISSION_LOGIC \
    float2 ddxUV_em1 = ddx(fd.uv0); \
    float2 ddyUV_em1 = ddy(fd.uv0); \
    if (_DecalSlot1_Enable > 0.5 && _DecalSlot1_Emission_Enable > 0.5) { \
        float rad_em1 = _DecalSlot1_Angle * 0.01745329252f; \
        float sinA_em1, cosA_em1; \
        sincos(rad_em1, sinA_em1, cosA_em1); \
        float2 slotUV_em1 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot1_OffsetX, _DecalSlot1_OffsetY), float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), sinA_em1, cosA_em1); \
        float inBounds_em1 = step(0.0, slotUV_em1.x) * step(slotUV_em1.x, 1.0) * step(0.0, slotUV_em1.y) * step(slotUV_em1.y, 1.0); \
        float sharedMask_em1 = inBounds_em1; \
        float2 dxR_em1 = float2(ddxUV_em1.x*cosA_em1 - ddxUV_em1.y*sinA_em1, ddxUV_em1.x*sinA_em1 + ddxUV_em1.y*cosA_em1); \
        float2 dyR_em1 = float2(ddyUV_em1.x*cosA_em1 - ddyUV_em1.y*sinA_em1, ddyUV_em1.x*sinA_em1 + ddyUV_em1.y*cosA_em1); \
        float2 safeScale_em1 = max(float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_em1 = dxR_em1 / safeScale_em1; \
        float2 dySlot_em1 = dyR_em1 / safeScale_em1; \
        if (_DecalSlot1_UseMask > 0.5) { \
            sharedMask_em1 = _DecalSlot1_Mask.SampleGrad(sampler_linear_clamp, slotUV_em1, dxSlot_em1, dySlot_em1).r * inBounds_em1; \
        } \
        if (_DecalSlot1_DisableBackface > 0.5 && fd.facing < 0) sharedMask_em1 = 0.0; \
        float emStrFactor_em1 = 1.0; \
        if (_DecalSlot1_Emission_SinEnable > 0.5) { \
            emStrFactor_em1 *= lerp(_DecalSlot1_Emission_SinMin, _DecalSlot1_Emission_SinMax, 0.5 + 0.5 * sin(_Time.y * _DecalSlot1_Emission_SinSpeed)); \
        } \
        if (_DecalSlot1_Emission_PulseEnable > 0.5) { \
            float pulseDuration1_em1 = max(_DecalSlot1_Emission_PulseDuration1, 0.001); \
            float pulseDuration2_em1 = max(_DecalSlot1_Emission_PulseDuration2, 0.001); \
            float pulseIndex1_em1 = floor(_Time.y / pulseDuration1_em1); \
            float pulseIndex2_em1 = floor(_Time.y / pulseDuration2_em1); \
            float pulseRand1_em1 = frac(sin((pulseIndex1_em1 + 11.17) * 78.233) * 43758.5453); \
            float pulseRand2_em1 = frac(sin((pulseIndex2_em1 + 47.29) * 37.719) * 24634.6345); \
            float pulseOn1_em1 = step(pulseRand1_em1, saturate(_DecalSlot1_Emission_PulseProbability1)); \
            float pulseOn2_em1 = step(pulseRand2_em1, saturate(_DecalSlot1_Emission_PulseProbability2)); \
            float pulseOn_em1 = max(pulseOn1_em1, pulseOn2_em1); \
            emStrFactor_em1 *= pulseOn_em1; \
        } \
        DNKW_AL_EMISSION_S1_LOGIC \
        float2 emUV_em1 = slotUV_em1 * _DecalSlot1_Emission_Tex_ST.xy + _DecalSlot1_Emission_Tex_ST.zw; \
        float emScrollMask_em1 = 1.0; \
        if (_DecalSlot1_Emission_ScrollEnable > 0.5) { \
            float2 scrollDelta_em1 = float2(_DecalSlot1_Emission_ScrollX, _DecalSlot1_Emission_ScrollY) * _Time.y; \
            emUV_em1 += scrollDelta_em1; \
            float2 scrollMaskBaseUV_em1 = slotUV_em1 + scrollDelta_em1; \
            float2 scrollMaskUV_em1 = scrollMaskBaseUV_em1 * _DecalSlot1_Emission_ScrollMask_ST.xy + _DecalSlot1_Emission_ScrollMask_ST.zw; \
            float2 scrollMaskDx_em1 = dxSlot_em1 * _DecalSlot1_Emission_ScrollMask_ST.xy; \
            float2 scrollMaskDy_em1 = dySlot_em1 * _DecalSlot1_Emission_ScrollMask_ST.xy; \
            emScrollMask_em1 = _DecalSlot1_Emission_ScrollMask.SampleGrad(sampler_linear_repeat, scrollMaskUV_em1, scrollMaskDx_em1, scrollMaskDy_em1).r; \
        } \
        float3 emTexCol_em1 = (_DecalSlot1_Emission_UseTex > 0.5) \
            ? _DecalSlot1_Emission_Tex.SampleGrad(sampler_linear_repeat, emUV_em1, dxSlot_em1, dySlot_em1).rgb \
            : float3(1.0, 1.0, 1.0); \
        float3 emCol_em1 = emTexCol_em1 * _DecalSlot1_Emission_Color.rgb * _DecalSlot1_Emission_Strength * emStrFactor_em1 * sharedMask_em1 * emScrollMask_em1; \
        fd.emissionColor += emCol_em1; \
        float emLum_em1 = dot(emCol_em1, float3(0.2126, 0.7152, 0.0722)); \
        float emAlpha_em1 = saturate(_DecalSlot1_Emission_Opacity) * saturate(emLum_em1); \
        fd.col.rgb += emCol_em1 * emAlpha_em1; \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 2 Emission Logic
#ifndef DNKW_DECAL_SLOT2_EMISSION_LOGIC
#define DNKW_DECAL_SLOT2_EMISSION_LOGIC \
    float2 ddxUV_em2 = ddx(fd.uv0); \
    float2 ddyUV_em2 = ddy(fd.uv0); \
    if (_DecalSlot2_Enable > 0.5 && _DecalSlot2_Emission_Enable > 0.5) { \
        float rad_em2 = _DecalSlot2_Angle * 0.01745329252f; \
        float sinA_em2, cosA_em2; \
        sincos(rad_em2, sinA_em2, cosA_em2); \
        float2 slotUV_em2 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot2_OffsetX, _DecalSlot2_OffsetY), float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), sinA_em2, cosA_em2); \
        float inBounds_em2 = step(0.0, slotUV_em2.x) * step(slotUV_em2.x, 1.0) * step(0.0, slotUV_em2.y) * step(slotUV_em2.y, 1.0); \
        float sharedMask_em2 = inBounds_em2; \
        float2 dxR_em2 = float2(ddxUV_em2.x*cosA_em2 - ddxUV_em2.y*sinA_em2, ddxUV_em2.x*sinA_em2 + ddxUV_em2.y*cosA_em2); \
        float2 dyR_em2 = float2(ddyUV_em2.x*cosA_em2 - ddyUV_em2.y*sinA_em2, ddyUV_em2.x*sinA_em2 + ddyUV_em2.y*cosA_em2); \
        float2 safeScale_em2 = max(float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), 0.0001) * 10.0; \
        float2 dxSlot_em2 = dxR_em2 / safeScale_em2; \
        float2 dySlot_em2 = dyR_em2 / safeScale_em2; \
        if (_DecalSlot2_UseMask > 0.5) { \
            sharedMask_em2 = _DecalSlot2_Mask.SampleGrad(sampler_linear_clamp, slotUV_em2, dxSlot_em2, dySlot_em2).r * inBounds_em2; \
        } \
        if (_DecalSlot2_DisableBackface > 0.5 && fd.facing < 0) sharedMask_em2 = 0.0; \
        float emStrFactor_em2 = 1.0; \
        if (_DecalSlot2_Emission_SinEnable > 0.5) { \
            emStrFactor_em2 *= lerp(_DecalSlot2_Emission_SinMin, _DecalSlot2_Emission_SinMax, 0.5 + 0.5 * sin(_Time.y * _DecalSlot2_Emission_SinSpeed)); \
        } \
        if (_DecalSlot2_Emission_PulseEnable > 0.5) { \
            float pulseDuration1_em2 = max(_DecalSlot2_Emission_PulseDuration1, 0.001); \
            float pulseDuration2_em2 = max(_DecalSlot2_Emission_PulseDuration2, 0.001); \
            float pulseIndex1_em2 = floor(_Time.y / pulseDuration1_em2); \
            float pulseIndex2_em2 = floor(_Time.y / pulseDuration2_em2); \
            float pulseRand1_em2 = frac(sin((pulseIndex1_em2 + 11.17) * 78.233) * 43758.5453); \
            float pulseRand2_em2 = frac(sin((pulseIndex2_em2 + 47.29) * 37.719) * 24634.6345); \
            float pulseOn1_em2 = step(pulseRand1_em2, saturate(_DecalSlot2_Emission_PulseProbability1)); \
            float pulseOn2_em2 = step(pulseRand2_em2, saturate(_DecalSlot2_Emission_PulseProbability2)); \
            float pulseOn_em2 = max(pulseOn1_em2, pulseOn2_em2); \
            emStrFactor_em2 *= pulseOn_em2; \
        } \
        DNKW_AL_EMISSION_S2_LOGIC \
        float2 emUV_em2 = slotUV_em2 * _DecalSlot2_Emission_Tex_ST.xy + _DecalSlot2_Emission_Tex_ST.zw; \
        float emScrollMask_em2 = 1.0; \
        if (_DecalSlot2_Emission_ScrollEnable > 0.5) { \
            float2 scrollDelta_em2 = float2(_DecalSlot2_Emission_ScrollX, _DecalSlot2_Emission_ScrollY) * _Time.y; \
            emUV_em2 += scrollDelta_em2; \
            float2 scrollMaskBaseUV_em2 = slotUV_em2 + scrollDelta_em2; \
            float2 scrollMaskUV_em2 = scrollMaskBaseUV_em2 * _DecalSlot2_Emission_ScrollMask_ST.xy + _DecalSlot2_Emission_ScrollMask_ST.zw; \
            float2 scrollMaskDx_em2 = dxSlot_em2 * _DecalSlot2_Emission_ScrollMask_ST.xy; \
            float2 scrollMaskDy_em2 = dySlot_em2 * _DecalSlot2_Emission_ScrollMask_ST.xy; \
            emScrollMask_em2 = _DecalSlot2_Emission_ScrollMask.SampleGrad(sampler_linear_repeat, scrollMaskUV_em2, scrollMaskDx_em2, scrollMaskDy_em2).r; \
        } \
        float3 emTexCol_em2 = (_DecalSlot2_Emission_UseTex > 0.5) \
            ? _DecalSlot2_Emission_Tex.SampleGrad(sampler_linear_repeat, emUV_em2, dxSlot_em2, dySlot_em2).rgb \
            : float3(1.0, 1.0, 1.0); \
        float3 emCol_em2 = emTexCol_em2 * _DecalSlot2_Emission_Color.rgb * _DecalSlot2_Emission_Strength * emStrFactor_em2 * sharedMask_em2 * emScrollMask_em2; \
        fd.emissionColor += emCol_em2; \
        float emLum_em2 = dot(emCol_em2, float3(0.2126, 0.7152, 0.0722)); \
        float emAlpha_em2 = saturate(_DecalSlot2_Emission_Opacity) * saturate(emLum_em2); \
        fd.col.rgb += emCol_em2 * emAlpha_em2; \
    }
#endif

//----------------------------------------------------------------------------------------------------------------------
// Entry point

#if !defined(UNITY_PASS_SHADOWCASTER)
// Blend decal normals into the tangent-space normalmap accumulator after lilToon's 1st normal pass.
// fd.N is assigned from normalmap on the very next line, so shadows/reflections see the result.
#define BEFORE_NORMAL_2ND \
{ \
    DNKW_DECAL_SLOT1_NORMAL_LOGIC \
    DNKW_DECAL_SLOT2_NORMAL_LOGIC \
}

#define BEFORE_MATCAP \
{ \
    float3 _dnkw_wvd = -UNITY_MATRIX_V[2].xyz; \
    float3 _dnkw_vrt = cross(float3(0,1,0), _dnkw_wvd); \
    _dnkw_vrt = (dot(_dnkw_vrt, _dnkw_vrt) < 0.000001) ? float3(1,0,0) : normalize(_dnkw_vrt); \
    float3 _dnkw_vup = cross(_dnkw_wvd, _dnkw_vrt); \
    DNKW_DECAL_SLOT1_LOGIC \
    DNKW_DECAL_SLOT2_LOGIC \
}

#define BEFORE_EMISSION_1ST \
{ \
    DNKW_DECAL_SLOT1_EMISSION_LOGIC \
    DNKW_DECAL_SLOT2_EMISSION_LOGIC \
}
#else
#define BEFORE_NORMAL_2ND
#define BEFORE_MATCAP
#define BEFORE_EMISSION_1ST
#endif

//----------------------------------------------------------------------------------------------------------------------
// Information about variables
//----------------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------
// Vertex shader inputs (appdata structure)
//
// Type     Name                    Description
// -------- ----------------------- --------------------------------------------------------------------
// float4   input.positionOS        POSITION
// float2   input.uv0               TEXCOORD0
// float2   input.uv1               TEXCOORD1
// float2   input.uv2               TEXCOORD2
// float2   input.uv3               TEXCOORD3
// float2   input.uv4               TEXCOORD4
// float2   input.uv5               TEXCOORD5
// float2   input.uv6               TEXCOORD6
// float2   input.uv7               TEXCOORD7
// float4   input.color             COLOR
// float3   input.normalOS          NORMAL
// float4   input.tangentOS         TANGENT
// uint     vertexID                SV_VertexID

//----------------------------------------------------------------------------------------------------------------------
// Vertex shader outputs or pixel shader inputs (v2f structure)
//
// The structure depends on the pass.
// Please check lil_pass_xx.hlsl for details.
//
// Type     Name                    Description
// -------- ----------------------- --------------------------------------------------------------------
// float4   output.positionCS       SV_POSITION
// float2   output.uv01             TEXCOORD0 TEXCOORD1
// float2   output.uv23             TEXCOORD2 TEXCOORD3
// float3   output.positionOS       object space position
// float3   output.positionWS       world space position
// float3   output.normalWS         world space normal
// float4   output.tangentWS        world space tangent

//----------------------------------------------------------------------------------------------------------------------
// Variables commonly used in the forward pass
//
// These are members of `lilFragData fd`
//
// Type     Name                    Description
// -------- ----------------------- --------------------------------------------------------------------
// float4   col                     lit color
// float3   albedo                  unlit color
// float3   emissionColor           color of emission
// -------- ----------------------- --------------------------------------------------------------------
// float3   lightColor              color of light
// float3   indLightColor           color of indirectional light
// float3   addLightColor           color of additional light
// float    attenuation             attenuation of light
// float3   invLighting             saturate((1.0 - lightColor) * sqrt(lightColor));
// -------- ----------------------- --------------------------------------------------------------------
// float2   uv0                     TEXCOORD0
// float2   uv1                     TEXCOORD1
// float2   uv2                     TEXCOORD2
// float2   uv3                     TEXCOORD3
// float2   uvMain                  Main UV
// float2   uvMat                   MatCap UV
// float2   uvRim                   Rim Light UV
// float2   uvPanorama              Panorama UV
// float2   uvScn                   Screen UV
// bool     isRightHand             input.tangentWS.w > 0.0;
// -------- ----------------------- --------------------------------------------------------------------
// float3   positionOS              object space position
// float3   positionWS              world space position
// float4   positionCS              clip space position
// float4   positionSS              screen space position
// float    depth                   distance from camera
// -------- ----------------------- --------------------------------------------------------------------
// float3x3 TBN                     tangent / bitangent / normal matrix
// float3   T                       tangent direction
// float3   B                       bitangent direction
// float3   N                       normal direction
// float3   V                       view direction
// float3   L                       light direction
// float3   origN                   normal direction without normal map
// float3   origL                   light direction without sh light
// float3   headV                   middle view direction of 2 cameras
// float3   reflectionN             normal direction for reflection
// float3   matcapN                 normal direction for reflection for MatCap
// float3   matcap2ndN              normal direction for reflection for MatCap 2nd
// float    facing                  VFACE
// -------- ----------------------- --------------------------------------------------------------------
// float    vl                      dot(viewDirection, lightDirection);
// float    hl                      dot(headDirection, lightDirection);
// float    ln                      dot(lightDirection, normalDirection);
// float    nv                      saturate(dot(normalDirection, viewDirection));
// float    nvabs                   abs(dot(normalDirection, viewDirection));
// -------- ----------------------- --------------------------------------------------------------------
// float4   triMask                 TriMask (for lite version)
// float3   parallaxViewDirection   mul(tbnWS, viewDirection);
// float2   parallaxOffset          parallaxViewDirection.xy / (parallaxViewDirection.z+0.5);
// float    anisotropy              strength of anisotropy
// float    smoothness              smoothness
// float    roughness               roughness
// float    perceptualRoughness     perceptual roughness
// float    shadowmix               this variable is 0 in the shadow area
// float    audioLinkValue          volume acquired by AudioLink
// -------- ----------------------- --------------------------------------------------------------------
// uint     renderingLayers         light layer of object (for URP / HDRP)
// uint     featureFlags            feature flags (for HDRP)
// uint2    tileIndex               tile index (for HDRP)
