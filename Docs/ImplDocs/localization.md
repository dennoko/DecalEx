# DecalEx ローカライズ実装仕様

## 概要

lilToon の言語設定に連動して、DecalEx インスペクター UI のラベル・ツールチップ・ドロップダウン選択肢を英語 / 日本語で切り替える。

---

## 実装ファイル

`Editor/DecalExInspector.cs`

---

## 言語判定

lilToon は選択言語を `lilLanguageManager.langSet.languageName` に文字列（BCP 47 形式）で保持する。

```csharp
// ロケール判定
private static bool IsJapanese => lilLanguageManager.langSet.languageName == "ja-JP";
```

対応言語コード：

| 言語 | コード |
|---|---|
| 英語 (US) | `"en-US"` |
| 日本語 | `"ja-JP"` |
| 韓国語 | `"ko-KR"` |
| 簡体中国語 | `"zh-Hans"` |
| 繁体中国語 | `"zh-Hant"` |

現在の実装は **日本語 (`ja-JP`) のみ個別対応**し、それ以外はすべて英語にフォールバックする。

---

## ヘルパーメソッド

```csharp
private static string L(string en, string ja) => IsJapanese ? ja : en;
```

- 第1引数: 英語文字列
- 第2引数: 日本語文字列
- `IsJapanese` が `true` のとき `ja` を返す

---

## 使用パターン

### ラベル + ツールチップ

```csharp
new GUIContent(L("Enable", "有効"), L("Enable this decal slot", "デカールスロットを有効にします"))
```

### セクションヘッダー

```csharp
DrawSubHeader(L("Position  \u2014  Shared by all sub-features", "位置設定  \u2014  全サブ機能で共有"));
```

### ドロップダウン選択肢（ブレンドモード）

```csharp
string[] blendModes = IsJapanese
    ? new[] { "加算", "スクリーン", "乗算", "オーバーレイ", "ソフトライト", "置換", "減算", "比較（明）", "比較（暗）" }
    : new[] { "Add", "Screen", "Multiply", "Overlay", "Soft Light", "Replace", "Subtract", "Lighten", "Darken" };
```

---

## 言語追加手順

新しい言語（例：韓国語）を追加する場合：

1. `IsJapanese` に相当する判定を追加:
   ```csharp
   private static bool IsKorean => lilLanguageManager.langSet.languageName == "ko-KR";
   ```

2. `L()` を多言語対応に拡張:
   ```csharp
   private static string L(string en, string ja, string ko = null)
   {
       if (IsJapanese) return ja;
       if (IsKorean && ko != null) return ko;
       return en;
   }
   ```

3. 各 `GUIContent` 呼び出しに第3引数を追加

---

## 注意事項

- `lilLanguageManager.langSet` は `lilToon` 名前空間内で公開されているため、同名前空間の `DecalExInspector` から直接アクセス可能。
- `IsJapanese` / `L()` はどちらも `static` なので、インスタンス生成前でも呼び出せる。
- 言語変更はリアルタイムに反映される（GUIContent は描画ごとに評価されるため）。
