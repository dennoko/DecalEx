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
    float  _DecalEmission_MaskAngle;

// Custom textures
#define LIL_CUSTOM_TEXTURES \
    TEXTURE2D(_DecalMatCap_Tex); \
    TEXTURE2D(_DecalMatCap_Mask); \
    TEXTURE2D(_DecalEmission_Tex); \
    TEXTURE2D(_DecalEmission_Mask);

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
    float2 d = uv - offset;
    float rad = angle * 0.01745329252f; // degrees to radians
    float s, c;
    sincos(rad, s, c);
    d = float2(d.x * c - d.y * s, d.x * s + d.y * c);
    return d / max(scale, 0.0001) + 0.5;
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
// Entry point

#if !defined(UNITY_PASS_SHADOWCASTER)
#define BEFORE_MATCAP \
{ \
    DNKW_DECAL_MATCAP_LOGIC \
    DNKW_DECAL_EMISSION_LOGIC \
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
