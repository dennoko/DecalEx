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
        private MaterialProperty _DecalSlot1_MatCap_EnableLighting;
        private MaterialProperty _DecalSlot1_MatCap_ShadowStrength;
        private MaterialProperty _DecalSlot1_MatCap_Blur;
        private MaterialProperty _DecalSlot1_MatCap_RimPower;
        private MaterialProperty _DecalSlot1_MatCap_EmissionAdd;
        private MaterialProperty _DecalSlot1_NormalMap_Enable;
        private MaterialProperty _DecalSlot1_NormalMap_Tex;
        private MaterialProperty _DecalSlot1_NormalMap_Scale;
        private MaterialProperty _DecalSlot1_LilToon_NormalMap_Scale;
        private MaterialProperty _DecalSlot1_Emission_Enable;
        private MaterialProperty _DecalSlot1_Emission_Tex;
        private MaterialProperty _DecalSlot1_Emission_UseTex;
        private MaterialProperty _DecalSlot1_Emission_Color;
        private MaterialProperty _DecalSlot1_Emission_Strength;
        private MaterialProperty _DecalSlot1_Emission_Opacity;
        private MaterialProperty _DecalSlot1_Emission_SinEnable;
        private MaterialProperty _DecalSlot1_Emission_SinSpeed;
        private MaterialProperty _DecalSlot1_Emission_SinMin;
        private MaterialProperty _DecalSlot1_Emission_SinMax;
        private MaterialProperty _DecalSlot1_Emission_PulseEnable;
        private MaterialProperty _DecalSlot1_Emission_PulseProbability1;
        private MaterialProperty _DecalSlot1_Emission_PulseDuration1;
        private MaterialProperty _DecalSlot1_Emission_PulseProbability2;
        private MaterialProperty _DecalSlot1_Emission_PulseDuration2;
        private MaterialProperty _DecalSlot1_Emission_ScrollEnable;
        private MaterialProperty _DecalSlot1_Emission_ScrollX;
        private MaterialProperty _DecalSlot1_Emission_ScrollY;
        private MaterialProperty _DecalSlot1_Emission_ScrollMask;
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
        private MaterialProperty _DecalSlot2_MatCap_EnableLighting;
        private MaterialProperty _DecalSlot2_MatCap_ShadowStrength;
        private MaterialProperty _DecalSlot2_MatCap_Blur;
        private MaterialProperty _DecalSlot2_MatCap_RimPower;
        private MaterialProperty _DecalSlot2_MatCap_EmissionAdd;
        private MaterialProperty _DecalSlot2_NormalMap_Enable;
        private MaterialProperty _DecalSlot2_NormalMap_Tex;
        private MaterialProperty _DecalSlot2_NormalMap_Scale;
        private MaterialProperty _DecalSlot2_LilToon_NormalMap_Scale;
        private MaterialProperty _DecalSlot2_Emission_Enable;
        private MaterialProperty _DecalSlot2_Emission_Tex;
        private MaterialProperty _DecalSlot2_Emission_UseTex;
        private MaterialProperty _DecalSlot2_Emission_Color;
        private MaterialProperty _DecalSlot2_Emission_Strength;
        private MaterialProperty _DecalSlot2_Emission_Opacity;
        private MaterialProperty _DecalSlot2_Emission_SinEnable;
        private MaterialProperty _DecalSlot2_Emission_SinSpeed;
        private MaterialProperty _DecalSlot2_Emission_SinMin;
        private MaterialProperty _DecalSlot2_Emission_SinMax;
        private MaterialProperty _DecalSlot2_Emission_PulseEnable;
        private MaterialProperty _DecalSlot2_Emission_PulseProbability1;
        private MaterialProperty _DecalSlot2_Emission_PulseDuration1;
        private MaterialProperty _DecalSlot2_Emission_PulseProbability2;
        private MaterialProperty _DecalSlot2_Emission_PulseDuration2;
        private MaterialProperty _DecalSlot2_Emission_ScrollEnable;
        private MaterialProperty _DecalSlot2_Emission_ScrollX;
        private MaterialProperty _DecalSlot2_Emission_ScrollY;
        private MaterialProperty _DecalSlot2_Emission_ScrollMask;
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
            _DecalSlot1_MatCap_EnableLighting = FindProperty("_DecalSlot1_MatCap_EnableLighting", props);
            _DecalSlot1_MatCap_ShadowStrength = FindProperty("_DecalSlot1_MatCap_ShadowStrength", props);
            _DecalSlot1_MatCap_Blur          = FindProperty("_DecalSlot1_MatCap_Blur", props);
            _DecalSlot1_MatCap_RimPower      = FindProperty("_DecalSlot1_MatCap_RimPower", props);
            _DecalSlot1_MatCap_EmissionAdd   = FindProperty("_DecalSlot1_MatCap_EmissionAdd", props);
            _DecalSlot1_NormalMap_Enable     = FindProperty("_DecalSlot1_NormalMap_Enable", props);
            _DecalSlot1_NormalMap_Tex        = FindProperty("_DecalSlot1_NormalMap_Tex", props);
            _DecalSlot1_NormalMap_Scale      = FindProperty("_DecalSlot1_NormalMap_Scale", props);
            _DecalSlot1_LilToon_NormalMap_Scale = FindProperty("_DecalSlot1_LilToon_NormalMap_Scale", props);
            _DecalSlot1_Emission_Enable      = FindProperty("_DecalSlot1_Emission_Enable", props);
            _DecalSlot1_Emission_Tex         = FindProperty("_DecalSlot1_Emission_Tex", props);
            _DecalSlot1_Emission_UseTex      = FindProperty("_DecalSlot1_Emission_UseTex", props);
            _DecalSlot1_Emission_Color       = FindProperty("_DecalSlot1_Emission_Color", props);
            _DecalSlot1_Emission_Strength    = FindProperty("_DecalSlot1_Emission_Strength", props);
            _DecalSlot1_Emission_Opacity     = FindProperty("_DecalSlot1_Emission_Opacity", props);
            _DecalSlot1_Emission_SinEnable   = FindProperty("_DecalSlot1_Emission_SinEnable", props);
            _DecalSlot1_Emission_SinSpeed    = FindProperty("_DecalSlot1_Emission_SinSpeed", props);
            _DecalSlot1_Emission_SinMin      = FindProperty("_DecalSlot1_Emission_SinMin", props);
            _DecalSlot1_Emission_SinMax      = FindProperty("_DecalSlot1_Emission_SinMax", props);
            _DecalSlot1_Emission_PulseEnable = FindProperty("_DecalSlot1_Emission_PulseEnable", props);
            _DecalSlot1_Emission_PulseProbability1 = FindProperty("_DecalSlot1_Emission_PulseProbability1", props);
            _DecalSlot1_Emission_PulseDuration1    = FindProperty("_DecalSlot1_Emission_PulseDuration1", props);
            _DecalSlot1_Emission_PulseProbability2 = FindProperty("_DecalSlot1_Emission_PulseProbability2", props);
            _DecalSlot1_Emission_PulseDuration2    = FindProperty("_DecalSlot1_Emission_PulseDuration2", props);
            _DecalSlot1_Emission_ScrollEnable = FindProperty("_DecalSlot1_Emission_ScrollEnable", props);
            _DecalSlot1_Emission_ScrollX     = FindProperty("_DecalSlot1_Emission_ScrollX", props);
            _DecalSlot1_Emission_ScrollY     = FindProperty("_DecalSlot1_Emission_ScrollY", props);
            _DecalSlot1_Emission_ScrollMask  = FindProperty("_DecalSlot1_Emission_ScrollMask", props);
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
            _DecalSlot2_MatCap_EnableLighting = FindProperty("_DecalSlot2_MatCap_EnableLighting", props);
            _DecalSlot2_MatCap_ShadowStrength = FindProperty("_DecalSlot2_MatCap_ShadowStrength", props);
            _DecalSlot2_MatCap_Blur          = FindProperty("_DecalSlot2_MatCap_Blur", props);
            _DecalSlot2_MatCap_RimPower      = FindProperty("_DecalSlot2_MatCap_RimPower", props);
            _DecalSlot2_MatCap_EmissionAdd   = FindProperty("_DecalSlot2_MatCap_EmissionAdd", props);
            _DecalSlot2_NormalMap_Enable     = FindProperty("_DecalSlot2_NormalMap_Enable", props);
            _DecalSlot2_NormalMap_Tex        = FindProperty("_DecalSlot2_NormalMap_Tex", props);
            _DecalSlot2_NormalMap_Scale      = FindProperty("_DecalSlot2_NormalMap_Scale", props);
            _DecalSlot2_LilToon_NormalMap_Scale = FindProperty("_DecalSlot2_LilToon_NormalMap_Scale", props);
            _DecalSlot2_Emission_Enable      = FindProperty("_DecalSlot2_Emission_Enable", props);
            _DecalSlot2_Emission_Tex         = FindProperty("_DecalSlot2_Emission_Tex", props);
            _DecalSlot2_Emission_UseTex      = FindProperty("_DecalSlot2_Emission_UseTex", props);
            _DecalSlot2_Emission_Color       = FindProperty("_DecalSlot2_Emission_Color", props);
            _DecalSlot2_Emission_Strength    = FindProperty("_DecalSlot2_Emission_Strength", props);
            _DecalSlot2_Emission_Opacity     = FindProperty("_DecalSlot2_Emission_Opacity", props);
            _DecalSlot2_Emission_SinEnable   = FindProperty("_DecalSlot2_Emission_SinEnable", props);
            _DecalSlot2_Emission_SinSpeed    = FindProperty("_DecalSlot2_Emission_SinSpeed", props);
            _DecalSlot2_Emission_SinMin      = FindProperty("_DecalSlot2_Emission_SinMin", props);
            _DecalSlot2_Emission_SinMax      = FindProperty("_DecalSlot2_Emission_SinMax", props);
            _DecalSlot2_Emission_PulseEnable = FindProperty("_DecalSlot2_Emission_PulseEnable", props);
            _DecalSlot2_Emission_PulseProbability1 = FindProperty("_DecalSlot2_Emission_PulseProbability1", props);
            _DecalSlot2_Emission_PulseDuration1    = FindProperty("_DecalSlot2_Emission_PulseDuration1", props);
            _DecalSlot2_Emission_PulseProbability2 = FindProperty("_DecalSlot2_Emission_PulseProbability2", props);
            _DecalSlot2_Emission_PulseDuration2    = FindProperty("_DecalSlot2_Emission_PulseDuration2", props);
            _DecalSlot2_Emission_ScrollEnable = FindProperty("_DecalSlot2_Emission_ScrollEnable", props);
            _DecalSlot2_Emission_ScrollX     = FindProperty("_DecalSlot2_Emission_ScrollX", props);
            _DecalSlot2_Emission_ScrollY     = FindProperty("_DecalSlot2_Emission_ScrollY", props);
            _DecalSlot2_Emission_ScrollMask  = FindProperty("_DecalSlot2_Emission_ScrollMask", props);
        }

        protected override void DrawCustomProperties(Material material)
        {
            EditorGUILayout.BeginVertical(boxOuter);

            DrawDecalSlot("Decal Slot 1", ref isShowDecalSlot1,
                _DecalSlot1_Enable, _DecalSlot1_DisableBackface,
                _DecalSlot1_OffsetX, _DecalSlot1_OffsetY, _DecalSlot1_ScaleX, _DecalSlot1_ScaleY, _DecalSlot1_Angle,
                _DecalSlot1_Tex, _DecalSlot1_Color, _DecalSlot1_Blend, _DecalSlot1_Alpha,
                _DecalSlot1_UseMask, _DecalSlot1_Mask,
                _DecalSlot1_NormalMap_Enable, _DecalSlot1_NormalMap_Tex, _DecalSlot1_NormalMap_Scale, _DecalSlot1_LilToon_NormalMap_Scale,
                _DecalSlot1_MatCap_Enable, _DecalSlot1_MatCap_Tex, _DecalSlot1_MatCap_Color, _DecalSlot1_MatCap_Blend,
                _DecalSlot1_MatCap_Alpha, _DecalSlot1_MatCap_MainColorPower, _DecalSlot1_MatCap_BumpScale,
                _DecalSlot1_MatCap_UseReflection,
                _DecalSlot1_MatCap_EnableLighting, _DecalSlot1_MatCap_ShadowStrength, _DecalSlot1_MatCap_Blur,
                _DecalSlot1_MatCap_RimPower, _DecalSlot1_MatCap_EmissionAdd,
                _DecalSlot1_Emission_Enable, _DecalSlot1_Emission_Tex, _DecalSlot1_Emission_UseTex, _DecalSlot1_Emission_Color,
                _DecalSlot1_Emission_Strength, _DecalSlot1_Emission_Opacity,
                _DecalSlot1_Emission_SinEnable, _DecalSlot1_Emission_SinSpeed,
                _DecalSlot1_Emission_SinMin, _DecalSlot1_Emission_SinMax,
                _DecalSlot1_Emission_PulseEnable,
                _DecalSlot1_Emission_PulseProbability1, _DecalSlot1_Emission_PulseDuration1,
                _DecalSlot1_Emission_PulseProbability2, _DecalSlot1_Emission_PulseDuration2,
                _DecalSlot1_Emission_ScrollEnable, _DecalSlot1_Emission_ScrollX, _DecalSlot1_Emission_ScrollY,
                _DecalSlot1_Emission_ScrollMask);

            DrawDecalSlot("Decal Slot 2", ref isShowDecalSlot2,
                _DecalSlot2_Enable, _DecalSlot2_DisableBackface,
                _DecalSlot2_OffsetX, _DecalSlot2_OffsetY, _DecalSlot2_ScaleX, _DecalSlot2_ScaleY, _DecalSlot2_Angle,
                _DecalSlot2_Tex, _DecalSlot2_Color, _DecalSlot2_Blend, _DecalSlot2_Alpha,
                _DecalSlot2_UseMask, _DecalSlot2_Mask,
                _DecalSlot2_NormalMap_Enable, _DecalSlot2_NormalMap_Tex, _DecalSlot2_NormalMap_Scale, _DecalSlot2_LilToon_NormalMap_Scale,
                _DecalSlot2_MatCap_Enable, _DecalSlot2_MatCap_Tex, _DecalSlot2_MatCap_Color, _DecalSlot2_MatCap_Blend,
                _DecalSlot2_MatCap_Alpha, _DecalSlot2_MatCap_MainColorPower, _DecalSlot2_MatCap_BumpScale,
                _DecalSlot2_MatCap_UseReflection,
                _DecalSlot2_MatCap_EnableLighting, _DecalSlot2_MatCap_ShadowStrength, _DecalSlot2_MatCap_Blur,
                _DecalSlot2_MatCap_RimPower, _DecalSlot2_MatCap_EmissionAdd,
                _DecalSlot2_Emission_Enable, _DecalSlot2_Emission_Tex, _DecalSlot2_Emission_UseTex, _DecalSlot2_Emission_Color,
                _DecalSlot2_Emission_Strength, _DecalSlot2_Emission_Opacity,
                _DecalSlot2_Emission_SinEnable, _DecalSlot2_Emission_SinSpeed,
                _DecalSlot2_Emission_SinMin, _DecalSlot2_Emission_SinMax,
                _DecalSlot2_Emission_PulseEnable,
                _DecalSlot2_Emission_PulseProbability1, _DecalSlot2_Emission_PulseDuration1,
                _DecalSlot2_Emission_PulseProbability2, _DecalSlot2_Emission_PulseDuration2,
                _DecalSlot2_Emission_ScrollEnable, _DecalSlot2_Emission_ScrollX, _DecalSlot2_Emission_ScrollY,
                _DecalSlot2_Emission_ScrollMask);

            EditorGUILayout.EndVertical();
        }

        //----------------------------------------------------------------------------------------------------------------------
        // Localization

        private static bool IsJapanese => lilLanguageManager.langSet.languageName == "ja-JP";
        private static string L(string en, string ja) => IsJapanese ? ja : en;

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
            MaterialProperty nmEnable, MaterialProperty nmTex, MaterialProperty nmScale, MaterialProperty nmLilToonScale,
            MaterialProperty mcEnable, MaterialProperty mcTex, MaterialProperty mcColor,
            MaterialProperty mcBlend, MaterialProperty mcAlpha, MaterialProperty mcMainColorPower,
            MaterialProperty mcBumpScale, MaterialProperty mcUseReflection,
            MaterialProperty mcEnableLighting, MaterialProperty mcShadowStrength, MaterialProperty mcBlur,
            MaterialProperty mcRimPower, MaterialProperty mcEmissionAdd,
            MaterialProperty emEnable, MaterialProperty emTex, MaterialProperty emUseTex, MaterialProperty emColor,
            MaterialProperty emStrength, MaterialProperty emOpacity,
            MaterialProperty emSinEnable, MaterialProperty emSinSpeed,
            MaterialProperty emSinMin, MaterialProperty emSinMax,
            MaterialProperty emPulseEnable,
            MaterialProperty emPulseProbability1, MaterialProperty emPulseDuration1,
            MaterialProperty emPulseProbability2, MaterialProperty emPulseDuration2,
            MaterialProperty emScrollEnable, MaterialProperty emScrollX, MaterialProperty emScrollY,
            MaterialProperty emScrollMask)
        {
            isShow = Foldout(title, title, isShow);
            if(!isShow) return;
            EditorGUILayout.BeginVertical(boxOuter);
            EditorGUILayout.LabelField(title, customToggleFont);

            if(enable != null && tex != null && blend != null && mask != null
                && offsetX != null && offsetY != null && scaleX != null && scaleY != null && angle != null)
            {
                string[] blendModes = IsJapanese
                    ? new[] { "加算", "スクリーン", "乗算", "オーバーレイ", "ソフトライト", "置換", "減算", "比較（明）", "比較（暗）" }
                    : new[] { "Add", "Screen", "Multiply", "Overlay", "Soft Light", "Replace", "Subtract", "Lighten", "Darken" };

                EditorGUILayout.BeginVertical(boxInner);

                // --- Basic ---
                DrawToggleProp(enable, new GUIContent(L("Enable", "有効"), L("Enable this decal slot", "デカールスロットを有効にします")));
                DrawToggleProp(disableBackface, new GUIContent(L("Disable on Backface", "裏面で無効"), L("Disable decal on backfaces (applies to all sub-features)", "裏面でデカールを無効にします（全サブ機能に適用）")));

                // --- Position (shared) ---
                DrawSubHeader(L("Position  \u2014  Shared by all sub-features", "位置設定  \u2014  全サブ機能で共有"));
                m_MaterialEditor.ShaderProperty(offsetX, new GUIContent(L("Offset X", "オフセット X"), L("Decal center UV X. 0.5 = UV center", "デカール中心のUV X座標。0.5でUV中央")));
                m_MaterialEditor.ShaderProperty(offsetY, new GUIContent(L("Offset Y", "オフセット Y"), L("Decal center UV Y. 0.5 = UV center", "デカール中心のUV Y座標。0.5でUV中央")));
                m_MaterialEditor.ShaderProperty(scaleX,  new GUIContent(L("Scale X",  "スケール X"),  L("Decal UV width. 1.0 = full UV width", "デカールのUV X幅。1.0でUV全幅")));
                m_MaterialEditor.ShaderProperty(scaleY,  new GUIContent(L("Scale Y",  "スケール Y"),  L("Decal UV height. 1.0 = full UV height", "デカールのUV Y幅。1.0でUV全高")));
                m_MaterialEditor.ShaderProperty(angle,   new GUIContent(L("Angle",    "角度"),         L("Decal rotation in degrees", "デカールの回転角度（度）")));

                // --- Main Decal Texture ---
                DrawSubHeader(L("Main Decal Texture", "メインデカールテクスチャ"));
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(L("Texture", "テクスチャ"), L("Main decal texture (alpha = opacity)", "デカールのメインテクスチャ（Aチャンネルが透明度）")), tex, color);
                m_MaterialEditor.ShaderProperty(alpha, new GUIContent(L("Opacity", "不透明度"), L("Decal opacity", "デカールの不透明度")));
                EditorGUI.BeginChangeCheck();
                int blendMode = (int)blend.floatValue;
                if(blendMode < 0 || blendMode >= blendModes.Length) blendMode = 5;
                blendMode = EditorGUILayout.Popup(new GUIContent(L("Blend Mode", "ブレンドモード"), L("Blend mode with base color", "合成モード")), blendMode, blendModes);
                if(EditorGUI.EndChangeCheck()) blend.floatValue = blendMode;

                // --- Mask ---
                DrawSubHeader(L("Mask", "マスク"));
                DrawToggleProp(useMask, new GUIContent(L("Use Mask", "マスク使用"), L("Use a mask texture to restrict the decal area", "マスクテクスチャを使用して範囲を限定します")));
                m_MaterialEditor.TexturePropertySingleLine(new GUIContent(L("Mask Texture", "マスクテクスチャ"), L("White=apply, Black=no apply. Shares Position settings", "範囲マスク。白=適用、黒=非適用（位置はPosition設定と共有）")), mask);

                // --- Normal Map ---
                DrawSubHeader(L("Normal Map  \u2014  Uses shared position & mask", "ノーマルマップ  \u2014  位置・マスク共有"));
                if(nmLilToonScale != null)
                    m_MaterialEditor.ShaderProperty(nmLilToonScale, new GUIContent(L("lilToon Normal Strength (in decal area)", "lilToon ノーマル強度（デカール範囲内）"), L("Scale lilToon's own normal map only within this decal's masked area. 1=unchanged, 0=flat.", "このデカールのマスク範囲内でのみlilToonのノーマルマップをスケールします。1=そのまま、0=フラット")));
                if(nmEnable != null) DrawToggleProp(nmEnable, new GUIContent(L("Enable Decal Normal Map", "デカール ノーマルマップ有効"), L("Enable a normal map applied only within the decal area", "デカール範囲内のみに適用するノーマルマップを有効にします")));
                if(nmEnable != null && nmEnable.floatValue > 0.5f && nmTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent(L("Normal Map", "ノーマルマップ"), L("Tangent space normal map", "タンジェント空間ノーマルマップ")), nmTex);
                    if(nmTex.textureValue != null)
                    {
                        string nmPath = AssetDatabase.GetAssetPath(nmTex.textureValue);
                        var nmImporter = AssetImporter.GetAtPath(nmPath) as TextureImporter;
                        if(nmImporter != null && nmImporter.textureType != TextureImporterType.NormalMap)
                        {
                            if(lilEditorGUI.AutoFixHelpBox(L("Texture is not set as Normal Map. Click \"Fix Now\" to fix the import settings.", "テクスチャがNormal Mapとして設定されていません。「今すぐ修正」をクリックしてインポート設定を修正してください。")))
                            {
                                nmImporter.textureType = TextureImporterType.NormalMap;
                                AssetDatabase.ImportAsset(nmPath);
                            }
                        }
                    }
                    m_MaterialEditor.TextureScaleOffsetProperty(nmTex);
                    m_MaterialEditor.ShaderProperty(nmScale, new GUIContent(L("Decal Normal Strength", "デカール ノーマル強度"), L("Decal normal map strength (0=flat, 1=normal, 3=enhanced)", "デカールノーマルマップの強度（0=フラット、1=通常、3=強調）")));
                }

                // --- MatCap ---
                DrawSubHeader(L("MatCap  \u2014  Uses shared position & mask", "MatCap  \u2014  位置・マスク共有"));
                if(mcEnable != null) DrawToggleProp(mcEnable, new GUIContent(L("Enable MatCap", "MatCap有効"), L("Enable MatCap", "MatCapを有効にします")));
                if(mcEnable != null && mcEnable.floatValue > 0.5f && mcTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent(L("Texture", "テクスチャ"), L("MatCap texture", "MatCapテクスチャ")), mcTex, mcColor);
                    m_MaterialEditor.ShaderProperty(mcAlpha, new GUIContent(L("Opacity", "不透明度"), L("MatCap opacity", "MatCapの不透明度")));
                    EditorGUI.BeginChangeCheck();
                    int mcBlendMode = (int)mcBlend.floatValue;
                    if(mcBlendMode < 0 || mcBlendMode >= blendModes.Length) mcBlendMode = 1;
                    mcBlendMode = EditorGUILayout.Popup(new GUIContent(L("Blend Mode", "ブレンドモード"), L("MatCap blend mode", "MatCapの合成モード")), mcBlendMode, blendModes);
                    if(EditorGUI.EndChangeCheck()) mcBlend.floatValue = mcBlendMode;
                    m_MaterialEditor.ShaderProperty(mcMainColorPower, new GUIContent(L("Main Color Strength", "メインカラー強度"), L("Multiply main texture color onto MatCap", "メインテクスチャの色をMatCapに乗算する強度")));
                    m_MaterialEditor.ShaderProperty(mcBlur, new GUIContent(L("Blur", "ぼかし"), L("MatCap blur strength (requires MipMap)", "MatCapのぼかし強度（MipMap必要）")));
                    EditorGUILayout.Space(3f);
                    m_MaterialEditor.ShaderProperty(mcBumpScale, new GUIContent(L("Normal Strength", "法線強度"), L("Normal map influence on MatCap UV", "MatCap UV計算への法線マップ影響度")));
                    DrawToggleProp(mcUseReflection, new GUIContent(L("Use Reflection", "反射モード"), L("Reflection mode (view-dependent MatCap)", "視線反射モード（鏡面反射）")));
                    EditorGUILayout.Space(3f);
                    m_MaterialEditor.ShaderProperty(mcEnableLighting, new GUIContent(L("Enable Lighting", "ライティング有効"), L("Lighting influence (0=off, 1=full)", "ライティングの影響度")));
                    m_MaterialEditor.ShaderProperty(mcShadowStrength, new GUIContent(L("Shadow Strength", "シャドウ強度"), L("MatCap attenuation in shadow areas", "影部分でのMatCap減衰強度")));
                    m_MaterialEditor.ShaderProperty(mcRimPower, new GUIContent(L("Rim Power", "リムパワー"), L("Fresnel rim mask. Positive=edge, Negative=center, 0=off", "リムマスク（フレネル）。正=エッジ、負=中心、0=無効")));
                    m_MaterialEditor.ShaderProperty(mcEmissionAdd, new GUIContent(L("Emission Addition", "エミッション加算"), L("Add MatCap color as emission", "MatCapの色をEmissionとして加算する強度")));
                }

                // --- Emission ---
                DrawSubHeader(L("Emission  \u2014  Uses shared position & mask", "エミッション  \u2014  位置・マスク共有"));
                if(emEnable != null) DrawToggleProp(emEnable, new GUIContent(L("Enable Emission", "エミッション有効"), L("Enable emission", "エミッションを有効にします")));
                if(emEnable != null && emEnable.floatValue > 0.5f && emTex != null)
                {
                    EditorGUILayout.Space(2f);
                    m_MaterialEditor.TexturePropertySingleLine(new GUIContent(L("Texture", "テクスチャ"), L("Emission texture (black=off)", "エミッションテクスチャ（黒=無効）")), emTex, emColor);
                    if(emUseTex != null)
                    {
                        emUseTex.floatValue = emTex.textureValue != null ? 1f : 0f;
                    }
                    m_MaterialEditor.ShaderProperty(emStrength, new GUIContent(L("Strength", "強度"), L("Emission strength", "エミッション強度")));
                    m_MaterialEditor.ShaderProperty(emOpacity, new GUIContent(L("Opacity", "不透明度"), L("How strongly emissive color overlays onto the lit result. 0 keeps original look when dark", "発光色をライティング結果へ重ねる強さ。0で暗い時に元の見た目を維持")));

                    // Sin Wave
                    EditorGUILayout.Space(4f);
                    DrawToggleProp(emSinEnable, new GUIContent(L("Sin Wave", "サイン波"), L("Animate emission strength with a sine wave", "強度を正弦波でアニメーションします")));
                    if(emSinEnable != null && emSinEnable.floatValue > 0.5f)
                    {
                        EditorGUI.indentLevel++;
                        m_MaterialEditor.ShaderProperty(emSinSpeed, new GUIContent(L("Speed", "速度"), L("Oscillation speed", "振動速度（大きいほど速い）")));
                        m_MaterialEditor.ShaderProperty(emSinMin,   new GUIContent(L("Min",   "最小"), L("Minimum brightness (0=fully off)", "最小輝度（0=完全消灯）")));
                        m_MaterialEditor.ShaderProperty(emSinMax,   new GUIContent(L("Max",   "最大"), L("Maximum brightness (1=full strength)", "最大輝度（1=Strength全開）")));
                        EditorGUI.indentLevel--;
                    }

                    // Random Pulse
                    EditorGUILayout.Space(2f);
                    DrawToggleProp(emPulseEnable, new GUIContent(L("Random Pulse", "ランダムパルス"), L("Randomly pulse emission strength", "強度をランダムにパルス発光させます")));
                    if(emPulseEnable != null && emPulseEnable.floatValue > 0.5f)
                    {
                        EditorGUI.indentLevel++;
                        m_MaterialEditor.ShaderProperty(emPulseProbability1, new GUIContent(L("Pulse Probability 1", "発光確率1"), L("Chance to trigger pulse pattern 1 in each time window", "各時間ウィンドウでパターン1が発光する確率")));
                        m_MaterialEditor.ShaderProperty(emPulseDuration1,    new GUIContent(L("Pulse Duration 1", "発光時間1"), L("How long pulse pattern 1 stays on when triggered (seconds)", "パターン1が発光した際の持続時間（秒）")));
                        m_MaterialEditor.ShaderProperty(emPulseProbability2, new GUIContent(L("Pulse Probability 2", "発光確率2"), L("Chance to trigger pulse pattern 2 in each time window", "各時間ウィンドウでパターン2が発光する確率")));
                        m_MaterialEditor.ShaderProperty(emPulseDuration2,    new GUIContent(L("Pulse Duration 2", "発光時間2"), L("How long pulse pattern 2 stays on when triggered (seconds)", "パターン2が発光した際の持続時間（秒）")));
                        EditorGUI.indentLevel--;
                    }

                    // UV Scroll
                    EditorGUILayout.Space(2f);
                    DrawToggleProp(emScrollEnable, new GUIContent(L("UV Scroll", "UVスクロール"), L("Scroll the emission texture UV over time", "エミッションテクスチャをスクロールアニメーションします")));
                    if(emScrollEnable != null && emScrollEnable.floatValue > 0.5f)
                    {
                        EditorGUI.indentLevel++;
                        m_MaterialEditor.ShaderProperty(emScrollX, new GUIContent(L("Scroll X", "スクロール X"), L("Horizontal scroll speed (UV/sec)", "横スクロール速度（UV/秒）")));
                        m_MaterialEditor.ShaderProperty(emScrollY, new GUIContent(L("Scroll Y", "スクロール Y"), L("Vertical scroll speed (UV/sec)", "縦スクロール速度（UV/秒）")));
                        m_MaterialEditor.TexturePropertySingleLine(
                            new GUIContent(L("Scroll Mask", "スクロールマスク"), L("Mask defining the visible scroll window (scroll UV, white=show)", "スクロールの可視ウィンドウを定義するマスク（スクロールUV、白=表示）")),
                            emScrollMask);
                        m_MaterialEditor.TextureScaleOffsetProperty(emScrollMask);
                        EditorGUI.indentLevel--;
                    }

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
