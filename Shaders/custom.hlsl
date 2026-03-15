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
    float  _DecalSlot1_MatCap_ZRollCancel; \
    float  _DecalSlot1_MatCap_EnableLighting; \
    float  _DecalSlot1_MatCap_ShadowStrength; \
    float  _DecalSlot1_MatCap_Blur; \
    float  _DecalSlot1_MatCap_RimPower; \
    float  _DecalSlot1_MatCap_EmissionAdd; \
    float4 _DecalSlot1_MatCap_Tex_ST; \
    float  _DecalSlot1_NormalMap_Enable; \
    float  _DecalSlot1_NormalMap_Scale; \
    float4 _DecalSlot1_NormalMap_Tex_ST; \
    float  _DecalSlot1_Emission_Enable; \
    float4 _DecalSlot1_Emission_Color; \
    float  _DecalSlot1_Emission_Strength; \
    float4 _DecalSlot1_Emission_Tex_ST; \
    float  _DecalSlot1_Emission_SinEnable; \
    float  _DecalSlot1_Emission_SinSpeed; \
    float  _DecalSlot1_Emission_SinMin; \
    float  _DecalSlot1_Emission_SinMax; \
    float  _DecalSlot1_Emission_PulseEnable; \
    float  _DecalSlot1_Emission_PulseSpeed; \
    float  _DecalSlot1_Emission_PulseMin; \
    float  _DecalSlot1_Emission_ScrollEnable; \
    float  _DecalSlot1_Emission_ScrollX; \
    float  _DecalSlot1_Emission_ScrollY; \
    float4 _DecalSlot1_Emission_ScrollMask_ST; \
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
    float  _DecalSlot2_MatCap_ZRollCancel; \
    float  _DecalSlot2_MatCap_EnableLighting; \
    float  _DecalSlot2_MatCap_ShadowStrength; \
    float  _DecalSlot2_MatCap_Blur; \
    float  _DecalSlot2_MatCap_RimPower; \
    float  _DecalSlot2_MatCap_EmissionAdd; \
    float4 _DecalSlot2_MatCap_Tex_ST; \
    float  _DecalSlot2_NormalMap_Enable; \
    float  _DecalSlot2_NormalMap_Scale; \
    float4 _DecalSlot2_NormalMap_Tex_ST; \
    float  _DecalSlot2_Emission_Enable; \
    float4 _DecalSlot2_Emission_Color; \
    float  _DecalSlot2_Emission_Strength; \
    float4 _DecalSlot2_Emission_Tex_ST; \
    float  _DecalSlot2_Emission_SinEnable; \
    float  _DecalSlot2_Emission_SinSpeed; \
    float  _DecalSlot2_Emission_SinMin; \
    float  _DecalSlot2_Emission_SinMax; \
    float  _DecalSlot2_Emission_PulseEnable; \
    float  _DecalSlot2_Emission_PulseSpeed; \
    float  _DecalSlot2_Emission_PulseMin; \
    float  _DecalSlot2_Emission_ScrollEnable; \
    float  _DecalSlot2_Emission_ScrollX; \
    float  _DecalSlot2_Emission_ScrollY; \
    float4 _DecalSlot2_Emission_ScrollMask_ST;

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
    TEXTURE2D(_DecalSlot2_Emission_Tex); \
    TEXTURE2D(_DecalSlot2_NormalMap_Tex); \
    TEXTURE2D(_DecalSlot1_Emission_ScrollMask); \
    TEXTURE2D(_DecalSlot2_Emission_ScrollMask);

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
float2 DNKW_DecalMaskUV(float2 uv, float2 offset, float2 scale, float angle)
{
    // Rotate around UV center (0.5, 0.5) first - matching lilToon's lilCalcDecalUV behavior
    float rad = angle * 0.01745329252f; // degrees to radians
    float s, c;
    sincos(rad, s, c);
    float2 d = uv - 0.5;
    d = float2(d.x * c - d.y * s, d.x * s + d.y * c);
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
    else if (mode == 3) {
        float3 r;
        r.r = (base.r < 0.5) ? (2.0*base.r*overlay.r) : (1.0-2.0*(1.0-base.r)*(1.0-overlay.r));
        r.g = (base.g < 0.5) ? (2.0*base.g*overlay.g) : (1.0-2.0*(1.0-base.g)*(1.0-overlay.g));
        r.b = (base.b < 0.5) ? (2.0*base.b*overlay.b) : (1.0-2.0*(1.0-base.b)*(1.0-overlay.b));
        return r;
    }
    else if (mode == 4) return (1.0-2.0*overlay)*base*base + 2.0*overlay*base;
    else if (mode == 5) return overlay;
    else if (mode == 6) return base - overlay;
    else if (mode == 7) return max(base, overlay);
    else                return min(base, overlay);
}
#endif

// Note: DNKW_MatCapUV is NOT defined as a function here because HLSLINCLUDE is compiled
// before Unity's built-in cbuffer declarations (UNITY_MATRIX_V is undefined at this scope).
// MatCap UV computation is inlined directly inside each slot's macro instead,
// where it is expanded at shader-body compile time with UNITY_MATRIX_V in scope.

//----------------------------------------------------------------------------------------------------------------------
// Helper: Fresnel rim factor (shared across all slots)
#ifndef DNKW_FRES_RIM_DEFINED
#define DNKW_FRES_RIM_DEFINED
float DNKW_FresRim(float NdotV, float rimPower)
{
    if (abs(rimPower) < 0.01) return 1.0;
    if (rimPower > 0.0) return pow(1.0 - NdotV, rimPower);
    return 1.0 - pow(1.0 - NdotV, -rimPower);
}
#endif

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 1 Logic
#define DNKW_DECAL_SLOT1_LOGIC \
    if (_DecalSlot1_Enable > 0.5) { \
        float2 slotUV_s1 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot1_OffsetX, _DecalSlot1_OffsetY), float2(_DecalSlot1_ScaleX, _DecalSlot1_ScaleY), _DecalSlot1_Angle); \
        float inBounds_s1 = step(0.0, slotUV_s1.x) * step(slotUV_s1.x, 1.0) * step(0.0, slotUV_s1.y) * step(slotUV_s1.y, 1.0); \
        float sharedMask_s1 = inBounds_s1; \
        if (_DecalSlot1_UseMask > 0.5) { \
            sharedMask_s1 = LIL_SAMPLE_2D(_DecalSlot1_Mask, sampler_linear_clamp, slotUV_s1).r * inBounds_s1; \
        } \
        if (_DecalSlot1_DisableBackface > 0.5 && fd.facing < 0) sharedMask_s1 = 0.0; \
        if (_DecalSlot1_NormalMap_Enable > 0.5) { \
            float4 nmTex_s1 = LIL_SAMPLE_2D(_DecalSlot1_NormalMap_Tex, sampler_linear_clamp, slotUV_s1); \
            float3 nmWS_s1  = normalize(mul(lilUnpackNormalScale(nmTex_s1, _DecalSlot1_NormalMap_Scale), fd.TBN)); \
            fd.N = normalize(lerp(fd.N, nmWS_s1, sharedMask_s1)); \
        } \
        float4 decalTex_s1   = LIL_SAMPLE_2D(_DecalSlot1_Tex, sampler_linear_clamp, slotUV_s1); \
        float3 decalColor_s1 = decalTex_s1.rgb * _DecalSlot1_Color.rgb; \
        float  decalW_s1     = decalTex_s1.a * saturate(_DecalSlot1_Alpha) * sharedMask_s1; \
        fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, decalColor_s1, _DecalSlot1_Blend), decalW_s1); \
        if (_DecalSlot1_MatCap_Enable > 0.5) { \
            float3 Nmc_s1 = normalize(lerp(fd.origN, fd.N, _DecalSlot1_MatCap_BumpScale)); \
            if (_DecalSlot1_MatCap_UseReflection > 0.5) Nmc_s1 = reflect(-fd.V, Nmc_s1); \
            float3 Nvs_s1; \
            if (_DecalSlot1_MatCap_ZRollCancel > 0.5) { \
                float3 wvd_s1 = -UNITY_MATRIX_V[2].xyz; \
                float3 vup_s1 = float3(0, 1, 0); \
                float3 vrt_s1 = cross(vup_s1, wvd_s1); \
                vrt_s1 = (length(vrt_s1) < 0.001) ? float3(1, 0, 0) : normalize(vrt_s1); \
                vup_s1 = cross(wvd_s1, vrt_s1); \
                Nvs_s1 = float3(dot(vrt_s1, Nmc_s1), dot(vup_s1, Nmc_s1), dot(wvd_s1, Nmc_s1)); \
            } else { \
                Nvs_s1 = mul((float3x3)UNITY_MATRIX_V, Nmc_s1); \
            } \
            Nvs_s1.z *= -1.0; \
            float2 uvmc_s1  = Nvs_s1.xy * 0.5 + 0.5; \
            float4 mcTex_s1 = LIL_SAMPLE_2D_LOD(_DecalSlot1_MatCap_Tex, sampler_linear_clamp, uvmc_s1, _DecalSlot1_MatCap_Blur * 8.0); \
            float3 mcCol_s1 = mcTex_s1.rgb * _DecalSlot1_MatCap_Color.rgb * lerp(1.0, fd.albedo, _DecalSlot1_MatCap_MainColorPower); \
            float  mcMask_s1 = sharedMask_s1 * saturate(_DecalSlot1_MatCap_Alpha) * DNKW_FresRim(saturate(dot(fd.N, fd.V)), _DecalSlot1_MatCap_RimPower); \
            mcCol_s1 *= lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot1_MatCap_ShadowStrength) * lerp(float3(1,1,1), fd.lightColor, _DecalSlot1_MatCap_EnableLighting); \
            fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, mcCol_s1, _DecalSlot1_MatCap_Blend), mcMask_s1); \
            fd.emissionColor += mcCol_s1 * mcMask_s1 * _DecalSlot1_MatCap_EmissionAdd; \
        } \
        if (_DecalSlot1_Emission_Enable > 0.5) { \
            float emStrFactor_s1 = 1.0; \
            if (_DecalSlot1_Emission_SinEnable > 0.5) { \
                emStrFactor_s1 *= lerp(_DecalSlot1_Emission_SinMin, _DecalSlot1_Emission_SinMax, 0.5 + 0.5 * sin(_Time.y * _DecalSlot1_Emission_SinSpeed)); \
            } \
            if (_DecalSlot1_Emission_PulseEnable > 0.5) { \
                float pt_s1  = _Time.y * _DecalSlot1_Emission_PulseSpeed; \
                float ph0_s1 = frac(sin(floor(pt_s1)       * 78.233) * 43758.5453); \
                float ph1_s1 = frac(sin((floor(pt_s1)+1.0) * 78.233) * 43758.5453); \
                emStrFactor_s1 *= lerp(_DecalSlot1_Emission_PulseMin, 1.0, lerp(ph0_s1, ph1_s1, smoothstep(0.0, 1.0, frac(pt_s1)))); \
            } \
            float2 emUV_s1        = slotUV_s1; \
            float  emScrollMask_s1 = 1.0; \
            if (_DecalSlot1_Emission_ScrollEnable > 0.5) { \
                emUV_s1        += float2(_DecalSlot1_Emission_ScrollX, _DecalSlot1_Emission_ScrollY) * _Time.y; \
                emScrollMask_s1 = LIL_SAMPLE_2D(_DecalSlot1_Emission_ScrollMask, sampler_linear_clamp, slotUV_s1).r; \
            } \
            float4 emTex_s1 = LIL_SAMPLE_2D(_DecalSlot1_Emission_Tex, sampler_linear_repeat, emUV_s1); \
            fd.emissionColor += emTex_s1.rgb * _DecalSlot1_Emission_Color.rgb * _DecalSlot1_Emission_Strength * emStrFactor_s1 * sharedMask_s1 * emScrollMask_s1; \
        } \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Slot 2 Logic
#define DNKW_DECAL_SLOT2_LOGIC \
    if (_DecalSlot2_Enable > 0.5) { \
        float2 slotUV_s2 = DNKW_DecalMaskUV(fd.uv0, float2(_DecalSlot2_OffsetX, _DecalSlot2_OffsetY), float2(_DecalSlot2_ScaleX, _DecalSlot2_ScaleY), _DecalSlot2_Angle); \
        float inBounds_s2 = step(0.0, slotUV_s2.x) * step(slotUV_s2.x, 1.0) * step(0.0, slotUV_s2.y) * step(slotUV_s2.y, 1.0); \
        float sharedMask_s2 = inBounds_s2; \
        if (_DecalSlot2_UseMask > 0.5) { \
            sharedMask_s2 = LIL_SAMPLE_2D(_DecalSlot2_Mask, sampler_linear_clamp, slotUV_s2).r * inBounds_s2; \
        } \
        if (_DecalSlot2_DisableBackface > 0.5 && fd.facing < 0) sharedMask_s2 = 0.0; \
        if (_DecalSlot2_NormalMap_Enable > 0.5) { \
            float4 nmTex_s2 = LIL_SAMPLE_2D(_DecalSlot2_NormalMap_Tex, sampler_linear_clamp, slotUV_s2); \
            float3 nmWS_s2  = normalize(mul(lilUnpackNormalScale(nmTex_s2, _DecalSlot2_NormalMap_Scale), fd.TBN)); \
            fd.N = normalize(lerp(fd.N, nmWS_s2, sharedMask_s2)); \
        } \
        float4 decalTex_s2   = LIL_SAMPLE_2D(_DecalSlot2_Tex, sampler_linear_clamp, slotUV_s2); \
        float3 decalColor_s2 = decalTex_s2.rgb * _DecalSlot2_Color.rgb; \
        float  decalW_s2     = decalTex_s2.a * saturate(_DecalSlot2_Alpha) * sharedMask_s2; \
        fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, decalColor_s2, _DecalSlot2_Blend), decalW_s2); \
        if (_DecalSlot2_MatCap_Enable > 0.5) { \
            float3 Nmc_s2 = normalize(lerp(fd.origN, fd.N, _DecalSlot2_MatCap_BumpScale)); \
            if (_DecalSlot2_MatCap_UseReflection > 0.5) Nmc_s2 = reflect(-fd.V, Nmc_s2); \
            float3 Nvs_s2; \
            if (_DecalSlot2_MatCap_ZRollCancel > 0.5) { \
                float3 wvd_s2 = -UNITY_MATRIX_V[2].xyz; \
                float3 vup_s2 = float3(0, 1, 0); \
                float3 vrt_s2 = cross(vup_s2, wvd_s2); \
                vrt_s2 = (length(vrt_s2) < 0.001) ? float3(1, 0, 0) : normalize(vrt_s2); \
                vup_s2 = cross(wvd_s2, vrt_s2); \
                Nvs_s2 = float3(dot(vrt_s2, Nmc_s2), dot(vup_s2, Nmc_s2), dot(wvd_s2, Nmc_s2)); \
            } else { \
                Nvs_s2 = mul((float3x3)UNITY_MATRIX_V, Nmc_s2); \
            } \
            Nvs_s2.z *= -1.0; \
            float2 uvmc_s2  = Nvs_s2.xy * 0.5 + 0.5; \
            float4 mcTex_s2 = LIL_SAMPLE_2D_LOD(_DecalSlot2_MatCap_Tex, sampler_linear_clamp, uvmc_s2, _DecalSlot2_MatCap_Blur * 8.0); \
            float3 mcCol_s2 = mcTex_s2.rgb * _DecalSlot2_MatCap_Color.rgb * lerp(1.0, fd.albedo, _DecalSlot2_MatCap_MainColorPower); \
            float  mcMask_s2 = sharedMask_s2 * saturate(_DecalSlot2_MatCap_Alpha) * DNKW_FresRim(saturate(dot(fd.N, fd.V)), _DecalSlot2_MatCap_RimPower); \
            mcCol_s2 *= lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot2_MatCap_ShadowStrength) * lerp(float3(1,1,1), fd.lightColor, _DecalSlot2_MatCap_EnableLighting); \
            fd.col.rgb = lerp(fd.col.rgb, DNKW_BlendColors(fd.col.rgb, mcCol_s2, _DecalSlot2_MatCap_Blend), mcMask_s2); \
            fd.emissionColor += mcCol_s2 * mcMask_s2 * _DecalSlot2_MatCap_EmissionAdd; \
        } \
        if (_DecalSlot2_Emission_Enable > 0.5) { \
            float emStrFactor_s2 = 1.0; \
            if (_DecalSlot2_Emission_SinEnable > 0.5) { \
                emStrFactor_s2 *= lerp(_DecalSlot2_Emission_SinMin, _DecalSlot2_Emission_SinMax, 0.5 + 0.5 * sin(_Time.y * _DecalSlot2_Emission_SinSpeed)); \
            } \
            if (_DecalSlot2_Emission_PulseEnable > 0.5) { \
                float pt_s2  = _Time.y * _DecalSlot2_Emission_PulseSpeed; \
                float ph0_s2 = frac(sin(floor(pt_s2)       * 78.233) * 43758.5453); \
                float ph1_s2 = frac(sin((floor(pt_s2)+1.0) * 78.233) * 43758.5453); \
                emStrFactor_s2 *= lerp(_DecalSlot2_Emission_PulseMin, 1.0, lerp(ph0_s2, ph1_s2, smoothstep(0.0, 1.0, frac(pt_s2)))); \
            } \
            float2 emUV_s2        = slotUV_s2; \
            float  emScrollMask_s2 = 1.0; \
            if (_DecalSlot2_Emission_ScrollEnable > 0.5) { \
                emUV_s2        += float2(_DecalSlot2_Emission_ScrollX, _DecalSlot2_Emission_ScrollY) * _Time.y; \
                emScrollMask_s2 = LIL_SAMPLE_2D(_DecalSlot2_Emission_ScrollMask, sampler_linear_clamp, slotUV_s2).r; \
            } \
            float4 emTex_s2 = LIL_SAMPLE_2D(_DecalSlot2_Emission_Tex, sampler_linear_repeat, emUV_s2); \
            fd.emissionColor += emTex_s2.rgb * _DecalSlot2_Emission_Color.rgb * _DecalSlot2_Emission_Strength * emStrFactor_s2 * sharedMask_s2 * emScrollMask_s2; \
        } \
    }

//----------------------------------------------------------------------------------------------------------------------
// Entry point

#if !defined(UNITY_PASS_SHADOWCASTER)
#define BEFORE_MATCAP \
{ \
    DNKW_DECAL_SLOT1_LOGIC \
    DNKW_DECAL_SLOT2_LOGIC \
}
#else
#define BEFORE_MATCAP
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
