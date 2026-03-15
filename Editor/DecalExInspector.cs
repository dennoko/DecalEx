#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

namespace lilToon
{
    public class DecalExInspector : lilToonInspector
    {
        //----------------------------------------------------------------------------------------------------------------------
        // Decal Slot 1 properties
        private static bool isShowDecalSlot1;
        private MaterialProperty _DecalSlot1_Enable;
        private MaterialProperty _DecalSlot1_DisableBackface;
        private MaterialProperty _DecalSlot1_OffsetX;
        private MaterialProperty _DecalSlot1_OffsetY;
        private MaterialProperty _DecalSlot1_ScaleX;
        private MaterialProperty _DecalSlot1_ScaleY;
        private MaterialProperty _DecalSlot1_Angle;
        private MaterialProperty _DecalSlot1_Tex;
        private MaterialProperty _DecalSlot1_Color;
        private MaterialProperty _DecalSlot1_Blend;
        private MaterialProperty _DecalSlot1_Alpha;
        private MaterialProperty _DecalSlot1_UseMask;
        private MaterialProperty _DecalSlot1_Mask;
        private MaterialProperty _DecalSlot1_MatCap_Enable;
        private MaterialProperty _DecalSlot1_MatCap_Tex;
        private MaterialProperty _DecalSlot1_MatCap_Color;
        private MaterialProperty _DecalSlot1_MatCap_Blend;
        private MaterialProperty _DecalSlot1_MatCap_Alpha;
        private MaterialProperty _DecalSlot1_MatCap_MainColorPower;
        private MaterialProperty _DecalSlot1_MatCap_BumpScale;
        private MaterialProperty _DecalSlot1_MatCap_UseReflection;
        private MaterialProperty _DecalSlot1_MatCap_ZRollCancel;
        private MaterialProperty _DecalSlot1_MatCap_EnableLighting;
        private MaterialProperty _DecalSlot1_MatCap_ShadowStrength;
        private MaterialProperty _DecalSlot1_MatCap_Blur;
        private MaterialProperty _DecalSlot1_MatCap_RimPower;
        private MaterialProperty _DecalSlot1_MatCap_EmissionAdd;
        private MaterialProperty _DecalSlot1_NormalMap_Enable;
        private MaterialProperty _DecalSlot1_NormalMap_Tex;
        private MaterialProperty _DecalSlot1_NormalMap_Scale;
        private MaterialProperty _DecalSlot1_Emission_Enable;
        private MaterialProperty _DecalSlot1_Emission_Tex;
        private MaterialProperty _DecalSlot1_Emission_Color;
        private MaterialProperty _DecalSlot1_Emission_Strength;

        //----------------------------------------------------------------------------------------------------------------------
        // Decal Slot 2 properties
        private static bool isShowDecalSlot2;
        private MaterialProperty _DecalSlot2_Enable;
        private MaterialProperty _DecalSlot2_DisableBackface;
        private MaterialProperty _DecalSlot2_OffsetX;
        private MaterialProperty _DecalSlot2_OffsetY;
        private MaterialProperty _DecalSlot2_ScaleX;
        private MaterialProperty _DecalSlot2_ScaleY;
        private MaterialProperty _DecalSlot2_Angle;
        private MaterialProperty _DecalSlot2_Tex;
        private MaterialProperty _DecalSlot2_Color;
        private MaterialProperty _DecalSlot2_Blend;
        private MaterialProperty _DecalSlot2_Alpha;
        private MaterialProperty _DecalSlot2_UseMask;
        private MaterialProperty _DecalSlot2_Mask;
        private MaterialProperty _DecalSlot2_MatCap_Enable;
        private MaterialProperty _DecalSlot2_MatCap_Tex;
        private MaterialProperty _DecalSlot2_MatCap_Color;
        private MaterialProperty _DecalSlot2_MatCap_Blend;
        private MaterialProperty _DecalSlot2_MatCap_Alpha;
        private MaterialProperty _DecalSlot2_MatCap_MainColorPower;
        private MaterialProperty _DecalSlot2_MatCap_BumpScale;
        private MaterialProperty _DecalSlot2_MatCap_UseReflection;
        private MaterialProperty _DecalSlot2_MatCap_ZRollCancel;
        private MaterialProperty _DecalSlot2_MatCap_EnableLighting;
        private MaterialProperty _DecalSlot2_MatCap_ShadowStrength;
        private MaterialProperty _DecalSlot2_MatCap_Blur;
        private MaterialProperty _DecalSlot2_MatCap_RimPower;
        private MaterialProperty _DecalSlot2_MatCap_EmissionAdd;
        private MaterialProperty _DecalSlot2_NormalMap_Enable;
        private MaterialProperty _DecalSlot2_NormalMap_Tex;
        private MaterialProperty _DecalSlot2_NormalMap_Scale;
        private MaterialProperty _DecalSlot2_Emission_Enable;
        private MaterialProperty _DecalSlot2_Emission_Tex;
        private MaterialProperty _DecalSlot2_Emission_Color;
        private MaterialProperty _DecalSlot2_Emission_Strength;

        private const string shaderName = "dennoko_decalex";

        protected override void LoadCustomProperties(MaterialProperty[] props, Material material)
        {
            isCustomShader = true;
            ReplaceToCustomShaders();
            isShowRenderMode = !material.shader.name.Contains("Optional");

            _DecalSlot1_Enable               = FindProperty("_DecalSlot1_Enable", props);
            _DecalSlot1_DisableBackface       = FindProperty("_DecalSlot1_DisableBackface", props);
            _DecalSlot1_OffsetX              = FindProperty("_DecalSlot1_OffsetX", props);
            _DecalSlot1_OffsetY              = FindProperty("_DecalSlot1_OffsetY", props);
            _DecalSlot1_ScaleX               = FindProperty("_DecalSlot1_ScaleX", props);
            _DecalSlot1_ScaleY               = FindProperty("_DecalSlot1_ScaleY", props);
            _DecalSlot1_Angle                = FindProperty("_DecalSlot1_Angle", props);
            _DecalSlot1_Tex                  = FindProperty("_DecalSlot1_Tex", props);
            _DecalSlot1_Color                = FindProperty("_DecalSlot1_Color", props);
            _DecalSlot1_Blend                = FindProperty("_DecalSlot1_Blend", props);
            _DecalSlot1_Alpha                = FindProperty("_DecalSlot1_Alpha", props);
            _DecalSlot1_UseMask              = FindProperty("_DecalSlot1_UseMask", props);
            _DecalSlot1_Mask                 = FindProperty("_DecalSlot1_Mask", props);
            _DecalSlot1_MatCap_Enable        = FindProperty("_DecalSlot1_MatCap_Enable", props);
            _DecalSlot1_MatCap_Tex           = FindProperty("_DecalSlot1_MatCap_Tex", props);
            _DecalSlot1_MatCap_Color         = FindProperty("_DecalSlot1_MatCap_Color", props);
            _DecalSlot1_MatCap_Blend         = FindProperty("_DecalSlot1_MatCap_Blend", props);
            _DecalSlot1_MatCap_Alpha         = FindProperty("_DecalSlot1_MatCap_Alpha", props);
            _DecalSlot1_MatCap_MainColorPower = FindProperty("_DecalSlot1_MatCap_MainColorPower", props);
            _DecalSlot1_MatCap_BumpScale     = FindProperty("_DecalSlot1_MatCap_BumpScale", props);
            _DecalSlot1_MatCap_UseReflection = FindProperty("_DecalSlot1_MatCap_UseReflection", props);
            _DecalSlot1_MatCap_ZRollCancel   = FindProperty("_DecalSlot1_MatCap_ZRollCancel", props);
            _DecalSlot1_MatCap_EnableLighting = FindProperty("_DecalSlot1_MatCap_EnableLighting", props);
            _DecalSlot1_MatCap_ShadowStrength = FindProperty("_DecalSlot1_MatCap_ShadowStrength", props);
            _DecalSlot1_MatCap_Blur          = FindProperty("_DecalSlot1_MatCap_Blur", props);
            _DecalSlot1_MatCap_RimPower      = FindProperty("_DecalSlot1_MatCap_RimPower", props);
            _DecalSlot1_MatCap_EmissionAdd   = FindProperty("_DecalSlot1_MatCap_EmissionAdd", props);
            _DecalSlot1_NormalMap_Enable     = FindProperty("_DecalSlot1_NormalMap_Enable", props);
            _DecalSlot1_NormalMap_Tex        = FindProperty("_DecalSlot1_NormalMap_Tex", props);
            _DecalSlot1_NormalMap_Scale      = FindProperty("_DecalSlot1_NormalMap_Scale", props);
            _DecalSlot1_Emission_Enable      = FindProperty("_DecalSlot1_Emission_Enable", props);
            _DecalSlot1_Emission_Tex         = FindProperty("_DecalSlot1_Emission_Tex", props);
            _DecalSlot1_Emission_Color       = FindProperty("_DecalSlot1_Emission_Color", props);
            _DecalSlot1_Emission_Strength    = FindProperty("_DecalSlot1_Emission_Strength", props);

            _DecalSlot2_Enable               = FindProperty("_DecalSlot2_Enable", props);
            _DecalSlot2_DisableBackface       = FindProperty("_DecalSlot2_DisableBackface", props);
            _DecalSlot2_OffsetX              = FindProperty("_DecalSlot2_OffsetX", props);
            _DecalSlot2_OffsetY              = FindProperty("_DecalSlot2_OffsetY", props);
            _DecalSlot2_ScaleX               = FindProperty("_DecalSlot2_ScaleX", props);
            _DecalSlot2_ScaleY               = FindProperty("_DecalSlot2_ScaleY", props);
            _DecalSlot2_Angle                = FindProperty("_DecalSlot2_Angle", props);
            _DecalSlot2_Tex                  = FindProperty("_DecalSlot2_Tex", props);
            _DecalSlot2_Color                = FindProperty("_DecalSlot2_Color", props);
            _DecalSlot2_Blend                = FindProperty("_DecalSlot2_Blend", props);
            _DecalSlot2_Alpha                = FindProperty("_DecalSlot2_Alpha", props);
            _DecalSlot2_UseMask              = FindProperty("_DecalSlot2_UseMask", props);
            _DecalSlot2_Mask                 = FindProperty("_DecalSlot2_Mask", props);
            _DecalSlot2_MatCap_Enable        = FindProperty("_DecalSlot2_MatCap_Enable", props);
            _DecalSlot2_MatCap_Tex           = FindProperty("_DecalSlot2_MatCap_Tex", props);
            _DecalSlot2_MatCap_Color         = FindProperty("_DecalSlot2_MatCap_Color", props);
            _DecalSlot2_MatCap_Blend         = FindProperty("_DecalSlot2_MatCap_Blend", props);
            _DecalSlot2_MatCap_Alpha         = FindProperty("_DecalSlot2_MatCap_Alpha", props);
            _DecalSlot2_MatCap_MainColorPower = FindProperty("_DecalSlot2_MatCap_MainColorPower", props);
            _DecalSlot2_MatCap_BumpScale     = FindProperty("_DecalSlot2_MatCap_BumpScale", props);
            _DecalSlot2_MatCap_UseReflection = FindProperty("_DecalSlot2_MatCap_UseReflection", props);
            _DecalSlot2_MatCap_ZRollCancel   = FindProperty("_DecalSlot2_MatCap_ZRollCancel", props);
            _DecalSlot2_MatCap_EnableLighting = FindProperty("_DecalSlot2_MatCap_EnableLighting", props);
            _DecalSlot2_MatCap_ShadowStrength = FindProperty("_DecalSlot2_MatCap_ShadowStrength", props);
            _DecalSlot2_MatCap_Blur          = FindProperty("_DecalSlot2_MatCap_Blur", props);
            _DecalSlot2_MatCap_RimPower      = FindProperty("_DecalSlot2_MatCap_RimPower", props);
            _DecalSlot2_MatCap_EmissionAdd   = FindProperty("_DecalSlot2_MatCap_EmissionAdd", props);
            _DecalSlot2_NormalMap_Enable     = FindProperty("_DecalSlot2_NormalMap_Enable", props);
            _DecalSlot2_NormalMap_Tex        = FindProperty("_DecalSlot2_NormalMap_Tex", props);
            _DecalSlot2_NormalMap_Scale      = FindProperty("_DecalSlot2_NormalMap_Scale", props);
            _DecalSlot2_Emission_Enable      = FindProperty("_DecalSlot2_Emission_Enable", props);
            _DecalSlot2_Emission_Tex         = FindProperty("_DecalSlot2_Emission_Tex", props);
            _DecalSlot2_Emission_Color       = FindProperty("_DecalSlot2_Emission_Color", props);
            _DecalSlot2_Emission_Strength    = FindProperty("_DecalSlot2_Emission_Strength", props);

        }

        protected override void DrawCustomProperties(Material material)
        {
            EditorGUILayout.BeginVertical(boxOuter);

            DrawDecalSlot("Decal Slot 1", ref isShowDecalSlot1,
                _DecalSlot1_Enable, _DecalSlot1_DisableBackface,
                _DecalSlot1_OffsetX, _DecalSlot1_OffsetY, _DecalSlot1_ScaleX, _DecalSlot1_ScaleY, _DecalSlot1_Angle,
                _DecalSlot1_Tex, _DecalSlot1_Color, _DecalSlot1_Blend, _DecalSlot1_Alpha,
                _DecalSlot1_UseMask, _DecalSlot1_Mask,
                _DecalSlot1_NormalMap_Enable, _DecalSlot1_NormalMap_Tex, _DecalSlot1_NormalMap_Scale,
                _DecalSlot1_MatCap_Enable, _DecalSlot1_MatCap_Tex, _DecalSlot1_MatCap_Color, _DecalSlot1_MatCap_Blend,
                _DecalSlot1_MatCap_Alpha, _DecalSlot1_MatCap_MainColorPower, _DecalSlot1_MatCap_BumpScale,
                _DecalSlot1_MatCap_UseReflection, _DecalSlot1_MatCap_ZRollCancel,
                _DecalSlot1_MatCap_EnableLighting, _DecalSlot1_MatCap_ShadowStrength, _DecalSlot1_MatCap_Blur,
                _DecalSlot1_MatCap_RimPower, _DecalSlot1_MatCap_EmissionAdd,
                _DecalSlot1_Emission_Enable, _DecalSlot1_Emission_Tex, _DecalSlot1_Emission_Color,
                _DecalSlot1_Emission_Strength);

            DrawDecalSlot("Decal Slot 2", ref isShowDecalSlot2,
                _DecalSlot2_Enable, _DecalSlot2_DisableBackface,
                _DecalSlot2_OffsetX, _DecalSlot2_OffsetY, _DecalSlot2_ScaleX, _DecalSlot2_ScaleY, _DecalSlot2_Angle,
                _DecalSlot2_Tex, _DecalSlot2_Color, _DecalSlot2_Blend, _DecalSlot2_Alpha,
                _DecalSlot2_UseMask, _DecalSlot2_Mask,
                _DecalSlot2_NormalMap_Enable, _DecalSlot2_NormalMap_Tex, _DecalSlot2_NormalMap_Scale,
                _DecalSlot2_MatCap_Enable, _DecalSlot2_MatCap_Tex, _DecalSlot2_MatCap_Color, _DecalSlot2_MatCap_Blend,
                _DecalSlot2_MatCap_Alpha, _DecalSlot2_MatCap_MainColorPower, _DecalSlot2_MatCap_BumpScale,
                _DecalSlot2_MatCap_UseReflection, _DecalSlot2_MatCap_ZRollCancel,
                _DecalSlot2_MatCap_EnableLighting, _DecalSlot2_MatCap_ShadowStrength, _DecalSlot2_MatCap_Blur,
                _DecalSlot2_MatCap_RimPower, _DecalSlot2_MatCap_EmissionAdd,
                _DecalSlot2_Emission_Enable, _DecalSlot2_Emission_Tex, _DecalSlot2_Emission_Color,
                _DecalSlot2_Emission_Strength);

            EditorGUILayout.EndVertical();
        }

        //----------------------------------------------------------------------------------------------------------------------
        // UI Helpers

        private static readonly Color DividerColor = new Color(0.5f, 0.5f, 0.5f, 0.35f);

        private static void DrawDivider()
        {
            EditorGUILayout.Space(5f);
            Rect r = EditorGUILayout.GetControlRect(false, 1f);
            EditorGUI.DrawRect(r, DividerColor);
            EditorGUILayout.Space(3f);
        }

        private static void DrawToggleProp(MaterialProperty prop, GUIContent label)
        {
            EditorGUI.BeginChangeCheck();
            bool val = EditorGUILayout.Toggle(label, prop.floatValue > 0.5f);
            if (EditorGUI.EndChangeCheck())
                prop.floatValue = val ? 1f : 0f;
        }

        private static void DrawSubHeader(string label)
        {
            DrawDivider();
            EditorGUILayout.LabelField(label, EditorStyles.boldLabel);
            EditorGUILayout.Space(2f);
        }

        //----------------------------------------------------------------------------------------------------------------------
        // Decal Slot (combined decal with shared UV transform)

        private void DrawDecalSlot(string title, ref bool isShow,
            MaterialProperty enable, MaterialProperty disableBackface,
            MaterialProperty offsetX, MaterialProperty offsetY,
            MaterialProperty scaleX, MaterialProperty scaleY, MaterialProperty angle,
            MaterialProperty tex, MaterialProperty color, MaterialProperty blend, MaterialProperty alpha,
            MaterialProperty useMask, MaterialProperty mask,
            MaterialProperty nmEnable, MaterialProperty nmTex, MaterialProperty nmScale,
            MaterialProperty mcEnable, MaterialProperty mcTex, MaterialProperty mcColor,
            MaterialProperty mcBlend, MaterialProperty mcAlpha, MaterialProperty mcMainColorPower,
            MaterialProperty mcBumpScale, MaterialProperty mcUseReflection, MaterialProperty mcZRollCancel,
            MaterialProperty mcEnableLighting, MaterialProperty mcShadowStrength, MaterialProperty mcBlur,
            MaterialProperty mcRimPower, MaterialProperty mcEmissionAdd,
            MaterialProperty emEnable, MaterialProperty emTex, MaterialProperty emColor,
            MaterialProperty emStrength)
        {
            isShow = Foldout(title, title, isShow);
            if(!isShow) return;
            EditorGUILayout.BeginVertical(boxOuter);
            EditorGUILayout.LabelField(title, customToggleFont);

            if(enable != null && tex != null && blend != null && mask != null
                && offsetX != null && offsetY != null && scaleX != null && scaleY != null && angle != null)
            {
                string[] blendModes = { "Add", "Screen", "Multiply", "Overlay", "Soft Light", "Replace", "Subtract", "Lighten", "Darken" };

                EditorGUILayout.BeginVertical(boxInner);

                // --- Basic ---
                DrawToggleProp(enable, new GUIContent("Enable", "デカールスロットを有効にします"));
                DrawToggleProp(disableBackface, new GUIContent("Disable on Backface", "裏面でデカールを無効にします（全サブ機能に適用）"));

                // --- Position (shared) ---
                DrawSubHeader("Position  \u2014  Shared by all sub-features");
                m_MaterialEditor.ShaderProperty(offsetX, new GUIContent("Offset X", "デカール中心のUV X座標。0.5でUV中央"));
                m_MaterialEditor.ShaderProperty(offsetY, new GUIContent("Offset Y", "デカール中心のUV Y座標。0.5でUV中央"));
                m_MaterialEditor.ShaderProperty(scaleX,  new GUIContent("Scale X",  "デカールのUV X幅。1.0でUV全幅"));
                m_MaterialEditor.ShaderProperty(scaleY,  new GUIContent("Scale Y",  "デカールのUV Y幅。1.0でUV全高"));
                m_MaterialEditor.ShaderProperty(angle,   new GUIContent("Angle",    "デカールの回転角度（度）"));

                // --- Main Decal Texture ---
                DrawSubHeader("Main Decal Texture");
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent("Texture", "デカールのメインテクスチャ（Aチャンネルが透明度）"), tex, color);
                m_MaterialEditor.ShaderProperty(alpha, new GUIContent("Opacity", "デカールの不透明度"));
                EditorGUI.BeginChangeCheck();
                int blendMode = (int)blend.floatValue;
                if(blendMode < 0 || blendMode >= blendModes.Length) blendMode = 5;
                blendMode = EditorGUILayout.Popup(new GUIContent("Blend Mode", "合成モード"), blendMode, blendModes);
                if(EditorGUI.EndChangeCheck()) blend.floatValue = blendMode;

                // --- Mask ---
                DrawSubHeader("Mask");
                DrawToggleProp(useMask, new GUIContent("Use Mask", "マスクテクスチャを使用して範囲を限定します"));
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent("Mask Texture", "範囲マスク。白=適用、黒=非適用（位置は上のPosition設定と共有）"), mask);

                // --- Normal Map ---
                DrawSubHeader("Normal Map  \u2014  Uses shared position & mask");
                if(nmEnable != null) DrawToggleProp(nmEnable, new GUIContent("Enable Normal Map", "デカール範囲内のみに適用するノーマルマップを有効にします"));
                if(nmEnable != null && nmEnable.floatValue > 0.5f && nmTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent("Normal Map", "タンジェント空間ノーマルマップ"), nmTex);
                    m_MaterialEditor.ShaderProperty(nmScale, new GUIContent("Strength", "ノーマルマップの強度（0=フラット、1=通常、3=強調）"));
                }

                // --- MatCap ---
                DrawSubHeader("MatCap  \u2014  Uses shared position & mask");
                if(mcEnable != null) DrawToggleProp(mcEnable, new GUIContent("Enable MatCap", "MatCapを有効にします"));
                if(mcEnable != null && mcEnable.floatValue > 0.5f && mcTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent("Texture", "MatCapテクスチャ"), mcTex, mcColor);
                    m_MaterialEditor.ShaderProperty(mcAlpha, new GUIContent("Opacity", "MatCapの不透明度"));
                    EditorGUI.BeginChangeCheck();
                    int mcBlendMode = (int)mcBlend.floatValue;
                    if(mcBlendMode < 0 || mcBlendMode >= blendModes.Length) mcBlendMode = 1;
                    mcBlendMode = EditorGUILayout.Popup(new GUIContent("Blend Mode", "MatCapの合成モード"), mcBlendMode, blendModes);
                    if(EditorGUI.EndChangeCheck()) mcBlend.floatValue = mcBlendMode;
                    m_MaterialEditor.ShaderProperty(mcMainColorPower, new GUIContent("Main Color Strength", "メインテクスチャの色をMatCapに乗算する強度"));
                    m_MaterialEditor.ShaderProperty(mcBlur, new GUIContent("Blur", "MatCapのぼかし強度（MipMap必要）"));
                    EditorGUILayout.Space(3f);
                    m_MaterialEditor.ShaderProperty(mcBumpScale, new GUIContent("Normal Strength", "法線マップの影響度"));
                    DrawToggleProp(mcUseReflection, new GUIContent("Use Reflection", "視線反射モード（鏡面反射）"));
                    DrawToggleProp(mcZRollCancel, new GUIContent("Z-Roll Cancellation", "Z軸の首傾きによる変化をキャンセル"));
                    EditorGUILayout.Space(3f);
                    m_MaterialEditor.ShaderProperty(mcEnableLighting, new GUIContent("Enable Lighting", "ライティングの影響度"));
                    m_MaterialEditor.ShaderProperty(mcShadowStrength, new GUIContent("Shadow Strength", "影部分でのMatCap減衰強度"));
                    m_MaterialEditor.ShaderProperty(mcRimPower, new GUIContent("Rim Power", "リムマスク（フレネル）。正=エッジ、負=中心、0=無効"));
                    m_MaterialEditor.ShaderProperty(mcEmissionAdd, new GUIContent("Emission Addition", "MatCapの色をEmissionとして加算する強度"));
                }

                // --- Emission ---
                DrawSubHeader("Emission  \u2014  Uses shared position & mask");
                if(emEnable != null) DrawToggleProp(emEnable, new GUIContent("Enable Emission", "エミッションを有効にします"));
                if(emEnable != null && emEnable.floatValue > 0.5f && emTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent("Texture", "エミッションテクスチャ（黒=無効）"), emTex, emColor);
                    m_MaterialEditor.ShaderProperty(emStrength, new GUIContent("Strength", "エミッション強度"));
                }

                EditorGUILayout.Space(4f);
                EditorGUILayout.EndVertical();
            }
            EditorGUILayout.EndVertical();
        }

        //----------------------------------------------------------------------------------------------------------------------
        // Shader variant lookup

        protected override void ReplaceToCustomShaders()
        {
            lts    = Shader.Find(shaderName + "/lilToon");
            ltsc   = Shader.Find("Hidden/" + shaderName + "/Cutout");
            ltst   = Shader.Find("Hidden/" + shaderName + "/Transparent");
            ltsot  = Shader.Find("Hidden/" + shaderName + "/OnePassTransparent");
            ltstt  = Shader.Find("Hidden/" + shaderName + "/TwoPassTransparent");

            ltso   = Shader.Find("Hidden/" + shaderName + "/OpaqueOutline");
            ltsco  = Shader.Find("Hidden/" + shaderName + "/CutoutOutline");
            ltsto  = Shader.Find("Hidden/" + shaderName + "/TransparentOutline");
            ltsoto = Shader.Find("Hidden/" + shaderName + "/OnePassTransparentOutline");
            ltstto = Shader.Find("Hidden/" + shaderName + "/TwoPassTransparentOutline");

            ltsover  = Shader.Find(shaderName + "/[Optional] Overlay");
            ltsoover = Shader.Find(shaderName + "/[Optional] OverlayOnePass");
        }
    }
}
#endif
