//----------------------------------------------------------------------------------------------------------------------
// Macro

// Custom variables
#define LIL_CUSTOM_PROPERTIES \
    /* Decal MatCap */ \
    float  _DecalMatCap_Enable; \
    float4 _DecalMatCap_Color; \
    int    _DecalMatCap_Blend; \
    float  _DecalMatCap_BumpScale; \
    int    _DecalMatCap_UseReflection; \
    int    _DecalMatCap_DisableBackface; \
    float  _DecalMatCap_EnableLighting; \
    float  _DecalMatCap_ShadowStrength; \
    float  _DecalMatCap_Blur; \
    float  _DecalMatCap_Alpha; \
    float  _DecalMatCap_MainColorPower; \
    float  _DecalMatCap_RimPower; \
    int    _DecalMatCap_ZRollCancel; \
    int    _DecalMatCap_UseMask; \
    float  _DecalMatCap_EmissionAdd; \
    float4 _DecalMatCap_Tex_ST; \
    float4 _DecalMatCap_Mask_ST; \
    float  _DecalMatCap_MaskOffsetX; \
    float  _DecalMatCap_MaskOffsetY; \
    float  _DecalMatCap_MaskScaleX; \
    float  _DecalMatCap_MaskScaleY; \
    float  _DecalMatCap_MaskAngle; \
    /* Decal Emission */ \
    float  _DecalEmission_Enable; \
    float4 _DecalEmission_Color; \
    float  _DecalEmission_Strength; \
    int    _DecalEmission_UseMask; \
    float4 _DecalEmission_Tex_ST; \
    float4 _DecalEmission_Mask_ST; \
    float  _DecalEmission_MaskOffsetX; \
    float  _DecalEmission_MaskOffsetY; \
    float  _DecalEmission_MaskScaleX; \
    float  _DecalEmission_MaskScaleY; \
    float  _DecalEmission_MaskAngle; \
    /* Decal Slot 1 */ \
    float  _DecalSlot1_Enable; \
    int    _DecalSlot1_DisableBackface; \
    float  _DecalSlot1_OffsetX; \
    float  _DecalSlot1_OffsetY; \
    float  _DecalSlot1_ScaleX; \
    float  _DecalSlot1_ScaleY; \
    float  _DecalSlot1_Angle; \
    float4 _DecalSlot1_Color; \
    int    _DecalSlot1_Blend; \
    float  _DecalSlot1_Alpha; \
    int    _DecalSlot1_UseMask; \
    float4 _DecalSlot1_Tex_ST; \
    float4 _DecalSlot1_Mask_ST; \
    float  _DecalSlot1_MatCap_Enable; \
    float4 _DecalSlot1_MatCap_Color; \
    int    _DecalSlot1_MatCap_Blend; \
    float  _DecalSlot1_MatCap_Alpha; \
    float  _DecalSlot1_MatCap_MainColorPower; \
    float  _DecalSlot1_MatCap_BumpScale; \
    int    _DecalSlot1_MatCap_UseReflection; \
    int    _DecalSlot1_MatCap_ZRollCancel; \
    float  _DecalSlot1_MatCap_EnableLighting; \
    float  _DecalSlot1_MatCap_ShadowStrength; \
    float  _DecalSlot1_MatCap_Blur; \
    float  _DecalSlot1_MatCap_RimPower; \
    float  _DecalSlot1_MatCap_EmissionAdd; \
    float4 _DecalSlot1_MatCap_Tex_ST; \
    float  _DecalSlot1_Emission_Enable; \
    float4 _DecalSlot1_Emission_Color; \
    float  _DecalSlot1_Emission_Strength; \
    float4 _DecalSlot1_Emission_Tex_ST; \
    /* Decal Slot 2 */ \
    float  _DecalSlot2_Enable; \
    int    _DecalSlot2_DisableBackface; \
    float  _DecalSlot2_OffsetX; \
    float  _DecalSlot2_OffsetY; \
    float  _DecalSlot2_ScaleX; \
    float  _DecalSlot2_ScaleY; \
    float  _DecalSlot2_Angle; \
    float4 _DecalSlot2_Color; \
    int    _DecalSlot2_Blend; \
    float  _DecalSlot2_Alpha; \
    int    _DecalSlot2_UseMask; \
    float4 _DecalSlot2_Tex_ST; \
    float4 _DecalSlot2_Mask_ST; \
    float  _DecalSlot2_MatCap_Enable; \
    float4 _DecalSlot2_MatCap_Color; \
    int    _DecalSlot2_MatCap_Blend; \
    float  _DecalSlot2_MatCap_Alpha; \
    float  _DecalSlot2_MatCap_MainColorPower; \
    float  _DecalSlot2_MatCap_BumpScale; \
    int    _DecalSlot2_MatCap_UseReflection; \
    int    _DecalSlot2_MatCap_ZRollCancel; \
    float  _DecalSlot2_MatCap_EnableLighting; \
    float  _DecalSlot2_MatCap_ShadowStrength; \
    float  _DecalSlot2_MatCap_Blur; \
    float  _DecalSlot2_MatCap_RimPower; \
    float  _DecalSlot2_MatCap_EmissionAdd; \
    float4 _DecalSlot2_MatCap_Tex_ST; \
    float  _DecalSlot2_Emission_Enable; \
    float4 _DecalSlot2_Emission_Color; \
    float  _DecalSlot2_Emission_Strength; \
    float4 _DecalSlot2_Emission_Tex_ST;

// Custom textures
#define LIL_CUSTOM_TEXTURES \
    TEXTURE2D(_DecalMatCap_Tex); \
    TEXTURE2D(_DecalMatCap_Mask); \
    TEXTURE2D(_DecalEmission_Tex); \
    TEXTURE2D(_DecalEmission_Mask); \
    TEXTURE2D(_DecalSlot1_Tex); \
    TEXTURE2D(_DecalSlot1_Mask); \
    TEXTURE2D(_DecalSlot1_MatCap_Tex); \
    TEXTURE2D(_DecalSlot1_Emission_Tex); \
    TEXTURE2D(_DecalSlot2_Tex); \
    TEXTURE2D(_DecalSlot2_Mask); \
    TEXTURE2D(_DecalSlot2_MatCap_Tex); \
    TEXTURE2D(_DecalSlot2_Emission_Tex);

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
// Decal MatCap Logic
#define DNKW_DECAL_MATCAP_LOGIC \
    if (_DecalMatCap_Enable > 0.5) { \
        /* Normal Calculation */ \
        float3 N_mc = normalize(lerp(fd.origN, fd.N, _DecalMatCap_BumpScale)); \
        \
        /* Reflection Mode */ \
        if (_DecalMatCap_UseReflection > 0.5) { \
            N_mc = reflect(-fd.V, N_mc); \
        } \
        \
        /* View Space Conversion */ \
        float3 N_vs; \
        if (_DecalMatCap_ZRollCancel > 0.5) { \
            float3 worldViewDir = -UNITY_MATRIX_V[2].xyz; \
            float3 viewUp = float3(0, 1, 0); \
            float3 viewRight = cross(viewUp, worldViewDir); \
            if (length(viewRight) < 0.001) { \
                viewRight = float3(1, 0, 0); \
            } else { \
                viewRight = normalize(viewRight); \
            } \
            viewUp = cross(worldViewDir, viewRight); \
            N_vs = float3(dot(viewRight, N_mc), dot(viewUp, N_mc), dot(worldViewDir, N_mc)); \
        } else { \
            N_vs = mul((float3x3)UNITY_MATRIX_V, N_mc); \
        } \
        N_vs.z *= -1.0; \
        float2 uv_mc = N_vs.xy * 0.5 + 0.5; \
        \
        /* Sampling */ \
        float4 mcTex = LIL_SAMPLE_2D_LOD(_DecalMatCap_Tex, sampler_linear_clamp, uv_mc, _DecalMatCap_Blur * 8.0); \
        float3 mcColor = mcTex.rgb * _DecalMatCap_Color.rgb; \
        mcColor *= lerp(1.0, fd.albedo, _DecalMatCap_MainColorPower); \
        \
        /* Positioned Mask */ \
        float maskDMC = 1.0; \
        if (_DecalMatCap_UseMask > 0.5) { \
            float2 maskUV_dmc = DNKW_DecalMaskUV(fd.uv0, float2(_DecalMatCap_MaskOffsetX, _DecalMatCap_MaskOffsetY), float2(_DecalMatCap_MaskScaleX, _DecalMatCap_MaskScaleY), _DecalMatCap_MaskAngle); \
            float inBounds_dmc = step(0.0, maskUV_dmc.x) * step(maskUV_dmc.x, 1.0) * step(0.0, maskUV_dmc.y) * step(maskUV_dmc.y, 1.0); \
            maskDMC = LIL_SAMPLE_2D(_DecalMatCap_Mask, sampler_linear_clamp, maskUV_dmc).r * inBounds_dmc; \
        } \
        \
        /* Backface Disable */ \
        if (_DecalMatCap_DisableBackface > 0.5 && fd.facing < 0) maskDMC = 0.0; \
        maskDMC *= saturate(_DecalMatCap_Alpha); \
        \
        /* Rim Mask (Fresnel) */ \
        float rimPwr = _DecalMatCap_RimPower; \
        if (abs(rimPwr) > 0.01) { \
            float NdotV_dmc = saturate(dot(fd.N, fd.V)); \
            float fresnel_dmc; \
            if (rimPwr > 0.0) { \
                fresnel_dmc = pow(1.0 - NdotV_dmc, rimPwr); \
            } else { \
                fresnel_dmc = 1.0 - pow(1.0 - NdotV_dmc, -rimPwr); \
            } \
            maskDMC *= fresnel_dmc; \
        } \
        \
        /* Lighting Integration */ \
        float shadowFac_dmc = lerp(1.0, fd.attenuation * fd.shadowmix, _DecalMatCap_ShadowStrength); \
        float3 lightFac_dmc = lerp(float3(1,1,1), fd.lightColor, _DecalMatCap_EnableLighting); \
        mcColor *= shadowFac_dmc * lightFac_dmc; \
        \
        /* Blending */ \
        float3 targetColor_dmc = fd.col.rgb; \
        int blendMode_dmc = _DecalMatCap_Blend; \
        if (blendMode_dmc == 0) targetColor_dmc += mcColor; \
        else if (blendMode_dmc == 1) targetColor_dmc = 1.0 - (1.0 - targetColor_dmc) * (1.0 - mcColor); \
        else if (blendMode_dmc == 2) targetColor_dmc *= mcColor; \
        else if (blendMode_dmc == 3) { \
            float3 ovl_dmc; \
            ovl_dmc.r = (targetColor_dmc.r < 0.5) ? (2.0 * targetColor_dmc.r * mcColor.r) : (1.0 - 2.0 * (1.0 - targetColor_dmc.r) * (1.0 - mcColor.r)); \
            ovl_dmc.g = (targetColor_dmc.g < 0.5) ? (2.0 * targetColor_dmc.g * mcColor.g) : (1.0 - 2.0 * (1.0 - targetColor_dmc.g) * (1.0 - mcColor.g)); \
            ovl_dmc.b = (targetColor_dmc.b < 0.5) ? (2.0 * targetColor_dmc.b * mcColor.b) : (1.0 - 2.0 * (1.0 - targetColor_dmc.b) * (1.0 - mcColor.b)); \
            targetColor_dmc = ovl_dmc; \
        } \
        else if (blendMode_dmc == 4) targetColor_dmc = (1.0 - 2.0 * mcColor) * targetColor_dmc * targetColor_dmc + 2.0 * mcColor * targetColor_dmc; \
        else if (blendMode_dmc == 5) targetColor_dmc = mcColor; \
        else if (blendMode_dmc == 6) targetColor_dmc -= mcColor; \
        else if (blendMode_dmc == 7) targetColor_dmc = max(targetColor_dmc, mcColor); \
        else if (blendMode_dmc == 8) targetColor_dmc = min(targetColor_dmc, mcColor); \
        \
        fd.col.rgb = lerp(fd.col.rgb, targetColor_dmc, maskDMC); \
        fd.emissionColor += mcColor * maskDMC * _DecalMatCap_EmissionAdd; \
    }

//----------------------------------------------------------------------------------------------------------------------
// Decal Emission Logic
#define DNKW_DECAL_EMISSION_LOGIC \
    if (_DecalEmission_Enable > 0.5) { \
        float4 emTex = LIL_SAMPLE_2D(_DecalEmission_Tex, sampler_linear_repeat, fd.uv0); \
        float3 emColor = emTex.rgb * _DecalEmission_Color.rgb * _DecalEmission_Strength; \
        float emMask = 1.0; \
        if (_DecalEmission_UseMask > 0.5) { \
            float2 maskUV_dem = DNKW_DecalMaskUV(fd.uv0, float2(_DecalEmission_MaskOffsetX, _DecalEmission_MaskOffsetY), float2(_DecalEmission_MaskScaleX, _DecalEmission_MaskScaleY), _DecalEmission_MaskAngle); \
            float inBounds_dem = step(0.0, maskUV_dem.x) * step(maskUV_dem.x, 1.0) * step(0.0, maskUV_dem.y) * step(maskUV_dem.y, 1.0); \
            emMask = LIL_SAMPLE_2D(_DecalEmission_Mask, sampler_linear_clamp, maskUV_dem).r * inBounds_dem; \
        } \
        fd.emissionColor += emColor * emMask; \
    }

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
        float4 decalTex_s1    = LIL_SAMPLE_2D(_DecalSlot1_Tex, sampler_linear_clamp, slotUV_s1); \
        float3 decalColor_s1  = decalTex_s1.rgb * _DecalSlot1_Color.rgb; \
        float  decalW_s1      = decalTex_s1.a * saturate(_DecalSlot1_Alpha) * sharedMask_s1; \
        float3 decalTgt_s1    = fd.col.rgb; \
        int    decalBm_s1     = _DecalSlot1_Blend; \
        if      (decalBm_s1 == 0) decalTgt_s1 = decalTgt_s1 + decalColor_s1; \
        else if (decalBm_s1 == 1) decalTgt_s1 = 1.0 - (1.0 - decalTgt_s1) * (1.0 - decalColor_s1); \
        else if (decalBm_s1 == 2) decalTgt_s1 = decalTgt_s1 * decalColor_s1; \
        else if (decalBm_s1 == 3) { \
            float3 ovlD_s1; \
            ovlD_s1.r = (decalTgt_s1.r < 0.5) ? (2.0*decalTgt_s1.r*decalColor_s1.r) : (1.0-2.0*(1.0-decalTgt_s1.r)*(1.0-decalColor_s1.r)); \
            ovlD_s1.g = (decalTgt_s1.g < 0.5) ? (2.0*decalTgt_s1.g*decalColor_s1.g) : (1.0-2.0*(1.0-decalTgt_s1.g)*(1.0-decalColor_s1.g)); \
            ovlD_s1.b = (decalTgt_s1.b < 0.5) ? (2.0*decalTgt_s1.b*decalColor_s1.b) : (1.0-2.0*(1.0-decalTgt_s1.b)*(1.0-decalColor_s1.b)); \
            decalTgt_s1 = ovlD_s1; \
        } \
        else if (decalBm_s1 == 4) decalTgt_s1 = (1.0-2.0*decalColor_s1)*decalTgt_s1*decalTgt_s1 + 2.0*decalColor_s1*decalTgt_s1; \
        else if (decalBm_s1 == 5) decalTgt_s1 = decalColor_s1; \
        else if (decalBm_s1 == 6) decalTgt_s1 = decalTgt_s1 - decalColor_s1; \
        else if (decalBm_s1 == 7) decalTgt_s1 = max(decalTgt_s1, decalColor_s1); \
        else if (decalBm_s1 == 8) decalTgt_s1 = min(decalTgt_s1, decalColor_s1); \
        fd.col.rgb = lerp(fd.col.rgb, decalTgt_s1, decalW_s1); \
        if (_DecalSlot1_MatCap_Enable > 0.5) { \
            float3 Nmc_s1 = normalize(lerp(fd.origN, fd.N, _DecalSlot1_MatCap_BumpScale)); \
            if (_DecalSlot1_MatCap_UseReflection > 0.5) { Nmc_s1 = reflect(-fd.V, Nmc_s1); } \
            float3 Nvs_s1; \
            if (_DecalSlot1_MatCap_ZRollCancel > 0.5) { \
                float3 wvd_s1 = -UNITY_MATRIX_V[2].xyz; \
                float3 vup_s1 = float3(0, 1, 0); \
                float3 vrt_s1 = cross(vup_s1, wvd_s1); \
                if (length(vrt_s1) < 0.001) { vrt_s1 = float3(1, 0, 0); } else { vrt_s1 = normalize(vrt_s1); } \
                vup_s1 = cross(wvd_s1, vrt_s1); \
                Nvs_s1 = float3(dot(vrt_s1, Nmc_s1), dot(vup_s1, Nmc_s1), dot(wvd_s1, Nmc_s1)); \
            } else { \
                Nvs_s1 = mul((float3x3)UNITY_MATRIX_V, Nmc_s1); \
            } \
            Nvs_s1.z *= -1.0; \
            float2 uvmc_s1  = Nvs_s1.xy * 0.5 + 0.5; \
            float4 mcTex_s1 = LIL_SAMPLE_2D_LOD(_DecalSlot1_MatCap_Tex, sampler_linear_clamp, uvmc_s1, _DecalSlot1_MatCap_Blur * 8.0); \
            float3 mcCol_s1 = mcTex_s1.rgb * _DecalSlot1_MatCap_Color.rgb; \
            mcCol_s1 *= lerp(1.0, fd.albedo, _DecalSlot1_MatCap_MainColorPower); \
            float mcMask_s1 = sharedMask_s1 * saturate(_DecalSlot1_MatCap_Alpha); \
            float rimP_s1 = _DecalSlot1_MatCap_RimPower; \
            if (abs(rimP_s1) > 0.01) { \
                float NdotV_s1 = saturate(dot(fd.N, fd.V)); \
                float fres_s1; \
                if (rimP_s1 > 0.0) { fres_s1 = pow(1.0 - NdotV_s1, rimP_s1); } else { fres_s1 = 1.0 - pow(1.0 - NdotV_s1, -rimP_s1); } \
                mcMask_s1 *= fres_s1; \
            } \
            float  sfac_s1 = lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot1_MatCap_ShadowStrength); \
            float3 lfac_s1 = lerp(float3(1,1,1), fd.lightColor, _DecalSlot1_MatCap_EnableLighting); \
            mcCol_s1 *= sfac_s1 * lfac_s1; \
            float3 mcTgt_s1 = fd.col.rgb; \
            int    mcBm_s1  = _DecalSlot1_MatCap_Blend; \
            if      (mcBm_s1 == 0) mcTgt_s1 = mcTgt_s1 + mcCol_s1; \
            else if (mcBm_s1 == 1) mcTgt_s1 = 1.0 - (1.0 - mcTgt_s1) * (1.0 - mcCol_s1); \
            else if (mcBm_s1 == 2) mcTgt_s1 = mcTgt_s1 * mcCol_s1; \
            else if (mcBm_s1 == 3) { \
                float3 ovlM_s1; \
                ovlM_s1.r = (mcTgt_s1.r < 0.5) ? (2.0*mcTgt_s1.r*mcCol_s1.r) : (1.0-2.0*(1.0-mcTgt_s1.r)*(1.0-mcCol_s1.r)); \
                ovlM_s1.g = (mcTgt_s1.g < 0.5) ? (2.0*mcTgt_s1.g*mcCol_s1.g) : (1.0-2.0*(1.0-mcTgt_s1.g)*(1.0-mcCol_s1.g)); \
                ovlM_s1.b = (mcTgt_s1.b < 0.5) ? (2.0*mcTgt_s1.b*mcCol_s1.b) : (1.0-2.0*(1.0-mcTgt_s1.b)*(1.0-mcCol_s1.b)); \
                mcTgt_s1 = ovlM_s1; \
            } \
            else if (mcBm_s1 == 4) mcTgt_s1 = (1.0-2.0*mcCol_s1)*mcTgt_s1*mcTgt_s1 + 2.0*mcCol_s1*mcTgt_s1; \
            else if (mcBm_s1 == 5) mcTgt_s1 = mcCol_s1; \
            else if (mcBm_s1 == 6) mcTgt_s1 = mcTgt_s1 - mcCol_s1; \
            else if (mcBm_s1 == 7) mcTgt_s1 = max(mcTgt_s1, mcCol_s1); \
            else if (mcBm_s1 == 8) mcTgt_s1 = min(mcTgt_s1, mcCol_s1); \
            fd.col.rgb = lerp(fd.col.rgb, mcTgt_s1, mcMask_s1); \
            fd.emissionColor += mcCol_s1 * mcMask_s1 * _DecalSlot1_MatCap_EmissionAdd; \
        } \
        if (_DecalSlot1_Emission_Enable > 0.5) { \
            float4 emTex_s1 = LIL_SAMPLE_2D(_DecalSlot1_Emission_Tex, sampler_linear_clamp, slotUV_s1); \
            float3 emCol_s1 = emTex_s1.rgb * _DecalSlot1_Emission_Color.rgb * _DecalSlot1_Emission_Strength; \
            fd.emissionColor += emCol_s1 * sharedMask_s1; \
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
        float4 decalTex_s2    = LIL_SAMPLE_2D(_DecalSlot2_Tex, sampler_linear_clamp, slotUV_s2); \
        float3 decalColor_s2  = decalTex_s2.rgb * _DecalSlot2_Color.rgb; \
        float  decalW_s2      = decalTex_s2.a * saturate(_DecalSlot2_Alpha) * sharedMask_s2; \
        float3 decalTgt_s2    = fd.col.rgb; \
        int    decalBm_s2     = _DecalSlot2_Blend; \
        if      (decalBm_s2 == 0) decalTgt_s2 = decalTgt_s2 + decalColor_s2; \
        else if (decalBm_s2 == 1) decalTgt_s2 = 1.0 - (1.0 - decalTgt_s2) * (1.0 - decalColor_s2); \
        else if (decalBm_s2 == 2) decalTgt_s2 = decalTgt_s2 * decalColor_s2; \
        else if (decalBm_s2 == 3) { \
            float3 ovlD_s2; \
            ovlD_s2.r = (decalTgt_s2.r < 0.5) ? (2.0*decalTgt_s2.r*decalColor_s2.r) : (1.0-2.0*(1.0-decalTgt_s2.r)*(1.0-decalColor_s2.r)); \
            ovlD_s2.g = (decalTgt_s2.g < 0.5) ? (2.0*decalTgt_s2.g*decalColor_s2.g) : (1.0-2.0*(1.0-decalTgt_s2.g)*(1.0-decalColor_s2.g)); \
            ovlD_s2.b = (decalTgt_s2.b < 0.5) ? (2.0*decalTgt_s2.b*decalColor_s2.b) : (1.0-2.0*(1.0-decalTgt_s2.b)*(1.0-decalColor_s2.b)); \
            decalTgt_s2 = ovlD_s2; \
        } \
        else if (decalBm_s2 == 4) decalTgt_s2 = (1.0-2.0*decalColor_s2)*decalTgt_s2*decalTgt_s2 + 2.0*decalColor_s2*decalTgt_s2; \
        else if (decalBm_s2 == 5) decalTgt_s2 = decalColor_s2; \
        else if (decalBm_s2 == 6) decalTgt_s2 = decalTgt_s2 - decalColor_s2; \
        else if (decalBm_s2 == 7) decalTgt_s2 = max(decalTgt_s2, decalColor_s2); \
        else if (decalBm_s2 == 8) decalTgt_s2 = min(decalTgt_s2, decalColor_s2); \
        fd.col.rgb = lerp(fd.col.rgb, decalTgt_s2, decalW_s2); \
        if (_DecalSlot2_MatCap_Enable > 0.5) { \
            float3 Nmc_s2 = normalize(lerp(fd.origN, fd.N, _DecalSlot2_MatCap_BumpScale)); \
            if (_DecalSlot2_MatCap_UseReflection > 0.5) { Nmc_s2 = reflect(-fd.V, Nmc_s2); } \
            float3 Nvs_s2; \
            if (_DecalSlot2_MatCap_ZRollCancel > 0.5) { \
                float3 wvd_s2 = -UNITY_MATRIX_V[2].xyz; \
                float3 vup_s2 = float3(0, 1, 0); \
                float3 vrt_s2 = cross(vup_s2, wvd_s2); \
                if (length(vrt_s2) < 0.001) { vrt_s2 = float3(1, 0, 0); } else { vrt_s2 = normalize(vrt_s2); } \
                vup_s2 = cross(wvd_s2, vrt_s2); \
                Nvs_s2 = float3(dot(vrt_s2, Nmc_s2), dot(vup_s2, Nmc_s2), dot(wvd_s2, Nmc_s2)); \
            } else { \
                Nvs_s2 = mul((float3x3)UNITY_MATRIX_V, Nmc_s2); \
            } \
            Nvs_s2.z *= -1.0; \
            float2 uvmc_s2  = Nvs_s2.xy * 0.5 + 0.5; \
            float4 mcTex_s2 = LIL_SAMPLE_2D_LOD(_DecalSlot2_MatCap_Tex, sampler_linear_clamp, uvmc_s2, _DecalSlot2_MatCap_Blur * 8.0); \
            float3 mcCol_s2 = mcTex_s2.rgb * _DecalSlot2_MatCap_Color.rgb; \
            mcCol_s2 *= lerp(1.0, fd.albedo, _DecalSlot2_MatCap_MainColorPower); \
            float mcMask_s2 = sharedMask_s2 * saturate(_DecalSlot2_MatCap_Alpha); \
            float rimP_s2 = _DecalSlot2_MatCap_RimPower; \
            if (abs(rimP_s2) > 0.01) { \
                float NdotV_s2 = saturate(dot(fd.N, fd.V)); \
                float fres_s2; \
                if (rimP_s2 > 0.0) { fres_s2 = pow(1.0 - NdotV_s2, rimP_s2); } else { fres_s2 = 1.0 - pow(1.0 - NdotV_s2, -rimP_s2); } \
                mcMask_s2 *= fres_s2; \
            } \
            float  sfac_s2 = lerp(1.0, fd.attenuation * fd.shadowmix, _DecalSlot2_MatCap_ShadowStrength); \
            float3 lfac_s2 = lerp(float3(1,1,1), fd.lightColor, _DecalSlot2_MatCap_EnableLighting); \
            mcCol_s2 *= sfac_s2 * lfac_s2; \
            float3 mcTgt_s2 = fd.col.rgb; \
            int    mcBm_s2  = _DecalSlot2_MatCap_Blend; \
            if      (mcBm_s2 == 0) mcTgt_s2 = mcTgt_s2 + mcCol_s2; \
            else if (mcBm_s2 == 1) mcTgt_s2 = 1.0 - (1.0 - mcTgt_s2) * (1.0 - mcCol_s2); \
            else if (mcBm_s2 == 2) mcTgt_s2 = mcTgt_s2 * mcCol_s2; \
            else if (mcBm_s2 == 3) { \
                float3 ovlM_s2; \
                ovlM_s2.r = (mcTgt_s2.r < 0.5) ? (2.0*mcTgt_s2.r*mcCol_s2.r) : (1.0-2.0*(1.0-mcTgt_s2.r)*(1.0-mcCol_s2.r)); \
                ovlM_s2.g = (mcTgt_s2.g < 0.5) ? (2.0*mcTgt_s2.g*mcCol_s2.g) : (1.0-2.0*(1.0-mcTgt_s2.g)*(1.0-mcCol_s2.g)); \
                ovlM_s2.b = (mcTgt_s2.b < 0.5) ? (2.0*mcTgt_s2.b*mcCol_s2.b) : (1.0-2.0*(1.0-mcTgt_s2.b)*(1.0-mcCol_s2.b)); \
                mcTgt_s2 = ovlM_s2; \
            } \
            else if (mcBm_s2 == 4) mcTgt_s2 = (1.0-2.0*mcCol_s2)*mcTgt_s2*mcTgt_s2 + 2.0*mcCol_s2*mcTgt_s2; \
            else if (mcBm_s2 == 5) mcTgt_s2 = mcCol_s2; \
            else if (mcBm_s2 == 6) mcTgt_s2 = mcTgt_s2 - mcCol_s2; \
            else if (mcBm_s2 == 7) mcTgt_s2 = max(mcTgt_s2, mcCol_s2); \
            else if (mcBm_s2 == 8) mcTgt_s2 = min(mcTgt_s2, mcCol_s2); \
            fd.col.rgb = lerp(fd.col.rgb, mcTgt_s2, mcMask_s2); \
            fd.emissionColor += mcCol_s2 * mcMask_s2 * _DecalSlot2_MatCap_EmissionAdd; \
        } \
        if (_DecalSlot2_Emission_Enable > 0.5) { \
            float4 emTex_s2 = LIL_SAMPLE_2D(_DecalSlot2_Emission_Tex, sampler_linear_clamp, slotUV_s2); \
            float3 emCol_s2 = emTex_s2.rgb * _DecalSlot2_Emission_Color.rgb * _DecalSlot2_Emission_Strength; \
            fd.emissionColor += emCol_s2 * sharedMask_s2; \
        } \
    }

//----------------------------------------------------------------------------------------------------------------------
// Entry point

#if !defined(UNITY_PASS_SHADOWCASTER)
#define BEFORE_MATCAP \
{ \
    DNKW_DECAL_MATCAP_LOGIC \
    DNKW_DECAL_EMISSION_LOGIC \
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
