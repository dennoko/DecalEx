# DecalEx Audio Link 実装: 現行仕様の説明とレビュー

最終更新: 2026-03-23
対象: `Shaders/custom.hlsl` / `Shaders/lilCustomShaderProperties.lilblock` / `Editor/DecalExInspector.cs`

## 1. 現行仕様の説明

### 1-1. Audio Link の適用範囲

現行の DecalEx では、Audio Link は **Decal Slot 1 / Slot 2 の Emission 強度制御**にのみ適用されています。

- 対応箇所（プロパティ）
  - `_DecalSlot1_Emission_AL*`
  - `_DecalSlot2_Emission_AL*`
- 非対応（現行）
  - デカール本体色・MatCap・通常ライティングへの直接反映

### 1-2. 使用パラメータ

各スロットで共通のパラメータを持ちます。

- `AudioLink Enable` (`_DecalSlotX_Emission_ALEnable`)
- 帯域重み
  - `Bass` (`_DecalSlotX_Emission_ALBass`)
  - `Low-Mid` (`_DecalSlotX_Emission_ALLowMid`)
  - `High-Mid` (`_DecalSlotX_Emission_ALHighMid`)
  - `Treble` (`_DecalSlotX_Emission_ALTreble`)
- 波モード
  - `Wave Enable` (`_DecalSlotX_Emission_ALWaveEnable`)
  - `Wave Axis` (`_DecalSlotX_Emission_ALWaveAxis`, 0=U / 1=V)

### 1-3. 強度計算ロジック

`custom.hlsl` の `DNKW_AL_EMISSION_S1_LOGIC` / `DNKW_AL_EMISSION_S2_LOGIC` で、Emission の最終強度係数に乗算されます。

#### Audio Link 利用可能時（`LIL_FEATURE_AUDIOLINK`）

- `lilCheckAudioLink()` が true のとき有効
- 4帯域をサンプリングして重み付き合成
  - Bass: y=0.0000
  - Low-Mid: y=0.0625
  - High-Mid: y=0.1250
  - Treble: y=0.1875
- 合成式（概念）

```text
alStrength = saturate(
  bass    * ALBass +
  lowMid  * ALLowMid +
  highMid * ALHighMid +
  treble  * ALTreble
)
```

- `Wave Mode` ON の場合は、サンプリング x 座標に slot UV（U または V）を使い、UV 方向に波面が進む見え方を作ります。
- `Wave Mode` OFF の場合は、x=0 固定で帯域値を取得します。

#### Audio Link 非利用時（フォールバック）

- `fd.audioLinkValue` を使って同様の係数を計算し、`saturate` でクランプ
- 既存説明（`Docs/USAGE.md` / `Docs/使い方.md`）の通り、非対応環境でも破綻せず通常発光として動作します。

### 1-4. Inspector 上の挙動

`DecalExInspector.cs` では Emission セクション内の `AudioLink` トグルが ON の場合にのみ、帯域重みと Wave Mode 設定を段階表示します。

- AudioLink ON → 帯域重みUIを表示
- Wave Mode ON → Wave Axis UIを追加表示

このため、通常利用時の UI ノイズを増やさずに拡張機能を提供する構成です。

---

## 2. 現行実装レビュー

### 2-1. 良い点

1. **機能境界が明確**
   - Audio Link を Emission 係数に限定しており、既存のデカール/MatCap ブレンドを壊しにくい設計です。

2. **安全なフォールバック**
   - Audio Link 非対応時の経路があり、ワールド依存で完全無効にならないため運用上の事故が少ないです。

3. **UI と実装の対応が直感的**
   - 4帯域重み＋Wave 軸という最小セットで、見た目調整の意図が分かりやすいです。

### 2-2. 注意点（仕様として理解すべき点）

1. **重みを上げても最終値は `saturate` で 1 に張り付く**
   - 帯域重みを大きくしても、最終係数は 0..1 にクランプされるため、強調は主に「飽和までの到達しやすさ」に効きます。

2. **Wave Mode は UV 依存**
   - 波の見え方はメッシュ UV 展開に強く依存します。UV が歪んだ領域では進行が不均一に見える可能性があります。

3. **適用対象は Emission のみ**
   - 「デカール全体が音で変化する」と期待すると差分が出るため、仕様説明時に対象範囲を明示するのが重要です。

### 2-3. 改善候補（将来向け）

- 仕様拡張候補
  - 帯域別カーブ（ガンマ/しきい値）を追加し、`saturate` 以外の応答特性を選択可能にする。
  - Emission 以外（例: Decal Alpha / MatCap Alpha）への Audio Link ルーティングをオプション化する。

- UX 改善候補
  - Wave Axis を enum 表示（U/V）にして 0/1 の意味をさらに明確化する。

現時点では、実装の一貫性と安全性を優先した妥当な仕様と評価できます。

---

## 3. 関連ドキュメント

- 利用者向け説明: `Docs/USAGE.md`, `Docs/使い方.md`
- Audio Link 参照情報: `Docs/ImplDocs/AudioLinkReference.md`

