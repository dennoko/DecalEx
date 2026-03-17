# AudioLink シェーダー実装 完全ガイド

---

## 1. AudioLink.cginc のインクルード方法

シェーダーに AudioLink を組み込む最初のステップは、`AudioLink.cginc` をインクルードすることです。推奨される方法はパッケージパスを使用することです。 [1](#1-0) 

サーフェスシェーダーや通常の Unlit シェーダーでも同様に `AudioLink.cginc` をインクルードします。 [2](#1-1) 

---

## 2. AudioLink テクスチャの構造

AudioLink テクスチャは **128 x 64px の RGBA テクスチャ**であり、複数のデータブロックに分かれています。

### テクスチャ内のデータブロック定義（ALPASSマクロ）

`AudioLink.cginc` 内には、各データブロックの座標を定義するマクロが用意されています。 [3](#1-2) 

各ブロックの詳細な説明：

| ブロック名 | 座標 | サイズ | 内容 |
|---|---|---|---|
| `ALPASS_AUDIOLINK` | (0,0) | 128,4 | 4バンドのオーディオ振幅（最新フレーム） |
| `ALPASS_AUDIOLINKHISTORY` | (1,0) | 127,4 | 4バンドの履歴データ |
| `ALPASS_DFT` | (0,4) | 128,2 | DFT（スペクトログラム） |
| `ALPASS_WAVEFORM` | (0,6) | 128,16 | 波形データ |
| `ALPASS_GENERALVU` | (0,22) | 12,1 | VUメーター・時刻・バージョン情報 |
| `ALPASS_CCSTRIP` | (0,24) | 128,1 | ColorChordリニアストリップ |
| `ALPASS_CCLIGHTS` | (0,25) | 128,2 | ColorChordライト |
| `ALPASS_AUTOCORRELATOR` | (0,27) | 128,1 | 自己相関器 |
| `ALPASS_FILTEREDAUDIOLINK` | (0,28) | 16,4 | フィルタリング済み4バンド |
| `ALPASS_CHRONOTENSITY` | (16,28) | 8,4 | 時間的積分値 |
| `ALPASS_FILTEREDVU` | (24,28) | 4,4 | フィルタリング済みVUメーター |
| `ALPASS_GLOBAL_STRINGS` | (40,28) | 8,4 | グローバル同期文字列 | [4](#1-3) 

---

## 3. テクスチャアクセスの内部実装

### Texture2D vs sampler2D

`AudioLink.cginc` はデフォルトで `Texture2D<float4>` を使用し、サーフェスシェーダーでは自動的に従来の `sampler2D` にフォールバックします。 [5](#1-4) 

---

## 4. データ読み取り関数（ヘルパー関数）

### 基本サンプリング関数

#### `AudioLinkData(coord)` — ピクセル単位の読み取り

整数座標でテクスチャから正確に1ピクセルを読み取ります。 [6](#1-5) 

#### `AudioLinkDataMultiline(coord)` — 折り返し対応の読み取り

行末を超えると次の行に折り返して読み取ります（DFT・波形データに有用）。 [7](#1-6) 

#### `AudioLinkLerp(xy)` — 線形補間サンプリング

隣接ピクセル間を線形補間します（ジャギーを防ぐ）。 [8](#1-7) 

#### `AudioLinkLerpMultiline(xy)` — 折り返し対応の線形補間

`AudioLinkLerp` の折り返し対応版。 [9](#1-8) 

---

### 可用性確認・バージョン確認

#### `AudioLinkIsAvailable()`

AudioLink テクスチャが存在するか確認します（幅が16pxより大きいかで判定）。 [10](#1-9) 

#### `AudioLinkGetVersionMajor()` / `AudioLinkGetVersionMinor()`

実行中の AudioLink のバージョンを取得します。 [11](#1-10) 

---

### 時刻デコード関数

#### `AudioLinkDecodeDataAsUInt(indexloc)`

テクスチャのRGBAチャンネルから32ビット整数を復元します（主に Chronotensity や時刻に使用）。 [12](#1-11) 

#### `AudioLinkDecodeDataAsSeconds(indexloc)`

ミリ秒単位の時刻データを秒単位のfloatに変換します（最大約1.5日分）。 [13](#1-12) 

---

### カラー関連ユーティリティ

#### `AudioLinkHSVtoRGB(HSV)`

HSV → RGB 変換。 [14](#1-13) 

#### `AudioLinkCCtoRGB(bin, intensity, rootNote)`

ColorChord の音楽理論に基づく色生成関数。 [15](#1-14) 

---

### 周波数サンプリング関数

#### `AudioLinkGetAmplitudeAtFrequency(hertz)`

Hz単位で指定した周波数のDFT振幅を取得します（範囲: 13.75〜14080 Hz）。 [16](#1-15) 

#### `AudioLinkGetAmplitudeAtNote(octave, note)`

オクターブとセミトーンで指定した音符の振幅を取得します。 [17](#1-16) 

---

### Chronotensity（音楽連動時間）ヘルパー

#### `AudioLinkGetChronoTime(index, band)`

`_Time.y` の代替として使える、音楽連動の時間値を取得します（index: 0〜7, band: 0〜3）。 [18](#1-17) 

#### `AudioLinkGetChronoTimeNormalized(index, band, speed)`

`[0; 1]` の範囲に正規化した Chronotensity 値を取得します。 [19](#1-18) 

#### `AudioLinkGetChronoTimeInterval(index, band, speed, interval)`

任意の区間にスケールした Chronotensity 値を取得します。 [20](#1-19) 

---

### 時刻・プレイヤー情報ヘルパー

#### `AudioLinkGetTimeOfDay()`

UTC 時刻を `float3(hour, minute, second)` 形式で返します。 [21](#1-20) 

#### `AudioLinkGetAudioSourcePosition()`

AudioLink AudioSource のワールド座標を返します。 [22](#1-21) 

---

### グローバル文字列関数

#### `AudioLinkGetGlobalStringChar(stringIndex, charIndex)`

グローバル同期文字列から UTF32 コードポイントを取得します（stringIndex: 0〜3, charIndex: 0〜31）。 [23](#1-22) 

#### `AudioLinkGetLocalPlayerNameChar(charIndex)` / `AudioLinkGetMasterNameChar(charIndex)`

ローカルプレイヤー名・マスター名の特定文字を取得します。 [24](#1-23) 

---

## 5. 各データブロックの使い方

### `ALPASS_AUDIOLINK`（4バンド振幅）

フラグメントシェーダーでY座標に対応したバンドの振幅を表示： [25](#1-24) 

### `ALPASS_WAVEFORM`（波形）

波形描画のサンプル： [26](#1-25) 

### `ALPASS_DFT`（スペクトログラム）

スペクトログラム描画のサンプル： [27](#1-26) 

### `ALPASS_FILTEREDAUDIOLINK`（スムーズな4バンド）

急激な変化を避けたい場合に使用。16レベルのスムージングがある（X=0が最大スムーズ、X=15が最小）： [28](#1-27) 

### `ALPASS_GENERALVU`（VU・システム情報）

バージョン確認・FPS・現在の音量強度の取得例： [29](#1-28) 

### `ALPASS_FILTEREDVU_INTENSITY` / `ALPASS_FILTEREDVU_MARKER`

フィルタリング済みVUメーターの使用例（`FilteredVUDebug.shader`）： [30](#1-29) 

### `ALPASS_THEME_COLORx`（テーマカラー）

ワールド作成者が設定したテーマカラーの読み取り： [31](#1-30) 

### `ALPASS_CHRONOTENSITY`（音楽連動タイムライン）

Chronotensity を使ったフラクタルアニメーション例： [32](#1-31) 

Chronotensity の値域・スケーリングの詳細注意事項： [33](#1-32) 

### `ALPASS_MEDIASTATE`（メディア状態） [34](#1-33) 

### `ALPASS_GLOBAL_STRINGS`（グローバル文字列）

`GlobalStringExample.shader` でのプレイヤー名表示例： [35](#1-34) 

---

## 6. どのサンプリング関数を使うべきか（使い分けの表） [36](#1-35) 

---

## 7. 定数定義 [37](#1-36) 

---

## 8. 実装例：AudioReactiveSurface（実用的なサーフェスシェーダー）

Delay・Band・Pulseを組み合わせ、音楽でHueシフトと発光を制御する実用例： [38](#1-37) [39](#1-38) 

---

## 9. シェーダー開発時の重要な注意点

### ① `Texture2D<float4>` vs `sampler2D`

`Texture2D<float4>` を使う方法が**パフォーマンス面で優れており推奨**されています。サーフェスシェーダーでは `AUDIOLINK_STANDARD_INDEXING` が自動で定義され、`tex2Dlod` フォールバックが使われます。 [40](#1-39) 

### ② FP16 精度の制限

テクスチャ内部は `float` ですが、アバターが読み取れる値は**FP16（half）精度に制限**されています。エフェクトパスを通るためです。 [41](#1-40) 

### ③ `AudioLinkLerp` vs `AudioLinkData` の選択

`AudioLinkData` はピクセルデータを正確に取得しますが、見た目がジャギーになる場合があります。`AudioLinkLerp` を使うと滑らかな補間が得られます。 [42](#1-41) 

### ④ Chronotensity の整数除算バグ

`AudioLinkDecodeDataAsUInt` の結果を整数で割ると整数除算になり**意図しない結果**になります。必ず `1000.0` のように float で割ること。 [43](#1-42) 

### ⑤ 時刻同期には `ALPASS_GENERALVU_NETWORK_TIME` を推奨

インスタンス開始時刻を使う場合、`ALPASS_GENERALVU_INSTANCE_TIME` ではなく `ALPASS_GENERALVU_NETWORK_TIME` を使うと**全プレイヤーで同一のアニメーション**が表示されます。 [44](#1-43) 

### ⑥ `glsl_mod` の使用

負の数に対して正しく動作するため、`fmod()` の代わりに `glsl_mod()` を使うことが推奨されています。 [45](#1-44) 

### ⑦ テーマカラーの推奨

テーマカラーは **Color0 と Color1 のみの使用が現時点では推奨**されています。 [46](#1-45) 

---

## Notes

- `AudioLink.cginc` のインクルードパスは `Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc`（パッケージ経由）と、同じフォルダにある場合は `AudioLink.cginc` の相対パス指定の両方が利用されています。
- `ALPASS_CCCOLORS` のカラー番号は `#0` が常に黒なので、実際に使う際は `+1` からインデックスします。
- AudioLink テクスチャのバージョン互換性について、v1時代の `32x4` セクションは現在も互換性が保たれています。
- Shadowriver によるスプレッドシート形式のプロトコルリファレンスも存在します（リポジトリ外の外部リソース）。
- テキスト描画を行う場合は、`SmoothPixelFont.cginc` と組み合わせると便利です。

### Citations

**File:** Docs/README.md (L48-78)
```markdown
When using the AudioLink texture, there's a few things that may make sense to add to your shader.  You may either use `AudioLink.cginc` (recommended) or copy-paste the header info.

```hlsl

Shader "MyTestShader"
{
    Properties
    {
        _AudioLink ("AudioLink Texture", 2D) = "black" {}
    }
    SubShader
    {
        ... 
        
        Pass
        {
            CGPROGRAM

            ...

            #include "UnityCG.cginc"
    
            ...
            
            #include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"
            ...
        }
    }
}

```
```

**File:** Docs/README.md (L83-119)
```markdown
```hlsl
// Map of where features in AudioLink are.
#define ALPASS_DFT                      uint2(0,4)   //Size: 128, 2
#define ALPASS_WAVEFORM                 uint2(0,6)   //Size: 128, 16
#define ALPASS_AUDIOLINK                uint2(0,0)   //Size: 128, 4
#define ALPASS_AUDIOBASS                uint2(0,0)   //Size: 128, 1
#define ALPASS_AUDIOLOWMIDS             uint2(0,1)   //Size: 128, 1
#define ALPASS_AUDIOHIGHMIDS            uint2(0,2)   //Size: 128, 1
#define ALPASS_AUDIOTREBLE              uint2(0,3)   //Size: 128, 1
#define ALPASS_AUDIOLINKHISTORY         uint2(1,0)   //Size: 127, 4
#define ALPASS_GENERALVU                uint2(0,22)  //Size: 12, 1
#define ALPASS_CCINTERNAL               uint2(12,22) //Size: 12, 2
#define ALPASS_CCCOLORS                 uint2(25,22) //Size: 11, 1
#define ALPASS_CCSTRIP                  uint2(0,24)  //Size: 128, 1
#define ALPASS_CCLIGHTS                 uint2(0,25)  //Size: 128, 2
#define ALPASS_AUTOCORRELATOR           uint2(0,27)  //Size: 128, 1
#define ALPASS_GENERALVU_INSTANCE_TIME  uint2(2,22)
#define ALPASS_GENERALVU_LOCAL_TIME     uint2(3,22)
#define ALPASS_GENERALVU_NETWORK_TIME   uint2(4,22)
#define ALPASS_GENERALVU_PLAYERINFO     uint2(6,22)
// Added in version 0.2.5
#define ALPASS_FILTEREDAUDIOLINK        uint2(0,28)  //Size: 16, 4
// Added in version 0.2.6
#define ALPASS_CHRONOTENSITY            uint2(16,28) //Size: 8, 4
#define ALPASS_THEME_COLOR0             uint2(0,23)
#define ALPASS_THEME_COLOR1             uint2(1,23)
#define ALPASS_THEME_COLOR2             uint2(2,23)
#define ALPASS_THEME_COLOR3             uint2(3,23)
#define ALPASS_FILTEREDVU               uint2(24,28) //Size: 4, 4
#define ALPASS_FILTEREDVU_INTENSITY     uint2(24,28) //Size: 4, 1
#define ALPASS_FILTEREDVU_MARKER        uint2(24,29) //Size: 4, 1
// Added in version 0.3.0
#define ALPASS_GLOBAL_STRINGS           uint2(40,28) //Size: 8, 4
#define ALPASS_GENERALVU_SOURCE_POS     uint2(7,23)
// Added in version 1.0.0
#define ALPASS_MEDIASTATE               uint(5,22)
```
```

**File:** Docs/README.md (L244-254)
```markdown

Various Usages of this field would be:
```hlsl
    AudioLinkData( ALPASS_GENERALVU + uint2( 0, 0 )).x;  //2.04 for AudioLink 2.4.
    AudioLinkData( ALPASS_GENERALVU + uint2( 1, 0 )).x;  //System FPS
    AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_INSTANCE_TIME ); //Time since start of instance, but wraps every 1.5 days.
    AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_NETWORK_TIME ); //Time that matches for all players for animations, but wraps every 1.5 days.
    AudioLinkDecodeDataAsUInt( ALPASS_GENERALVU_LOCAL_TIME ); //Local time.
    AudioLinkData( ALPASS_GENERALVU + uint2( 8, 0 )).x;  // Current intensity of sound.
    AudioLinkData( ALPASS_GENERALVU + uint2( 11, 0 )).y;  // slow responce of volume of incoming sound.
```
```

**File:** Docs/README.md (L256-257)
```markdown
NOTE: There are potentially issues with `ALPASS_GENERALVU_INSTANCE_TIME` if a map is updated mid-instance and the instance owner leaves mid-instance, so it is preferred that for effects that don't care when the instance started, use `ALPASS_GENERALVU_NETWORK_TIME` as this will allow you to animate things so that all players see your animation the same as you.

```

**File:** Docs/README.md (L276-278)
```markdown

AudioLink provides 4 "Theme" colors users can apply to their avatars **though it is recommended you only use colors 0 and 1 for the time being**.  By default this uses ColorChord colors, but, world creators can select theme colors for their map and change them dynamically by setting the following: 

```

**File:** Docs/README.md (L350-356)
```markdown

You can get a level 10 smoothed Bass value like this:

```hlsl
    return AudioLinkData( ALPASS_FILTEREDAUDIOLINK + int2(10, 0) ).rrrr;
```

```

**File:** Docs/README.md (L363-383)
```markdown

You must read this using `AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY + offset ) % LOOP`. Where `LOOP` is the period in which you want to loop over.  Otherwise, as the number gets too large, motion will become chonky.  For instance, if you want to get a rotation, since rotation goes from 0 to `2*pi`, you can modulus by `628319` and divide by `100000.0`. As a reference, with this scaling, you can expect a full rotation every 2.8 seconds if you're using `offset.x = 4` and the band is dark during that time.

There are some helper methods for sampling chronotensity in the `AudioLink.cginc` file that may make sampling this part of the texture simpler. If you are looking for a replacement for `_Time.y`, check out `AudioLinkGetChronoTime(index, band)`.

One can think of the values from chronotensity as being in some very small unit of time, like a millisecond. Thus, the values will get very large very fast, until they finally overflow and loop back to 0. To make the overflow happen faster, one can use a modulo operation as mentioned above. To get resulting value into a usable range, one can then divide by some constant. The size of the value used for the modulo will control how long the final value takes to loop back to 0, and the value in the division will control the interval (or speed) of the final value. Here are some examples:
```hlsl
// Gives a value in [0; 1] interval
float chrono = (AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY  + uint2( 1, _AudioLinkBand ) ) % 1000000) / 1000000.0;

// Gives a value also in [0; 1], but it will loop around faster
float chrono = (AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY  + uint2( 1, _AudioLinkBand ) ) % 100000) / 100000.0;

// Gives a value in [0; 6.28] range
float chrono = (AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY  + uint2( 1, _AudioLinkBand ) ) % 628319) / 100000.0;

// Also gives a value in [0; 6.28 range]
float chrono = (AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY  + uint2( 1, _AudioLinkBand ) ) % 100000) / 100000.0 * 6.28;
```
When doing this division, make sure to divide by a float! Dividing by `1000` is _NOT_ the same as dividing by `1000.0`, as the former will result in integer division, which is not what you want!

```

**File:** Docs/README.md (L418-433)
```markdown
```hlsl
// Sample media state from AudioLink
float4 mediaState = AudioLinkData(ALPASS_MEDIASTATE);

// Get volume value
float volume = mediaState.r;

// Get progress value
float progress = mediaState.g;

// Get the playing state
float playstate = mediaState.b;

// Get the looping / random state
float loopstate = mediaState.a;
```
```

**File:** Docs/README.md (L520-540)
```markdown
### Table for does it make sense to index with?

Where the following mapping is used:

 * Data = `AudioLinkData( ... )`
 * DataMultiline = `AudioLinkDataMultiline( ... )`
 * Lerp = `AudioLinkLerp( ... )`
 * LerpMultiline = `AudioLinkLerpMultiline( ... )`

| | Data | DataMultiline | Lerp | LerpMultiline | Start Coord | Size | Available Since |
| --- | --- | --- | --- | --- | --- | --- | --- |
| ALPASS_DFT  | ✅ | ✅ | ✅ | ✅ | 0,4 | 128, 2 | v2.2 |
| ALPASS_WAVEFORM  | ✅ | ✅ | ✅ | ✅ | 0, 6 | 128, 16 | v2.2 |
| ALPASS_AUDIOLINK  | ✅ |  | ✅ |  | 0, 0 | 1, 4 | v1.0 |
| ALPASS_AUDIOLINKHISTORY  | ✅ |  | ✅ |  | 1, 0 | 127, 4 | v1.0 |
| ALPASS_GENERALVU  | ✅ |  |  |  |  0, 22 | 12, 2 | v2.2 |
| ALPASS_CCINTERNAL  | ✅ |  |  |  | 12, 22 | 12, 2 | v2.2 |
| ALPASS_CCSTRIP  | ✅ |   | ✅ |   | 0, 24 | 128, 1 | v2.2 |
| ALPASS_CCLIGHTS  | ✅ | ✅ |   |   | 0, 25 | 128, 2 | v2.3 |
| ALPASS_AUTOCORRELATOR  | ✅ |   | ✅ |   | 0, 27 | 128, 1 | v2.3 |
| ALPASS_FILTEREDAUDIOLINK  | ✅ |   | ✅ |   | 0, 28 | 16, 4 | v2.5 |
```

**File:** Docs/README.md (L547-554)
```markdown
snippet, we can make a cube display just the current 4 AudioLink values.  We set the X component in the texture to 0, and the Y component to be based on the Y coordinate in the texture.

```hlsl
fixed4 frag (v2f i) : SV_Target
{
    return AudioLinkData( ALPASS_AUDIOLINK + int2( 0, i.uv.y * 4. ) ).rrrr;
}
```
```

**File:** Docs/README.md (L558-566)
```markdown
### Basic Test with sample data.
Audio waveform data is in the ALPASS_WAVEFORM section of the AudioLink texture.  This red color of this group of 128x16 pixels represents the last 85ms of the incoming waveform data.  This
can be used to draw the waveform onto a surface or use it in other ways.

```hlsl
float Sample = AudioLinkLerpMultiline( ALPASS_WAVEFORM + float2( 200. * i.uv.x, 0 ) ).r;
return 1 - 50 * abs( Sample - i.uv.y* 2. + 1 );
```

```

**File:** Docs/README.md (L570-590)
```markdown

The spectrogram portion of audiolink contains the frequency amplitude of every 1/24th of an octave, starting at A-1 (13.75Hz).  This can be used to display something with frequency respones to it.
  
This demo shows off a few things.
 * Reading the spectrogram from `ALPASS_DFT`
 * Doing something a little more interesting with the surface.  Faking alpha with `discard`.

```hlsl
float noteno = i.uv.x*AUDIOLINK_ETOTALBINS;

float4 spectrum_value = AudioLinkLerpMultiline( ALPASS_DFT + float2( noteno, 0. ) )  + 0.5;

//If we are below the spectrum line, discard the pixel.
if( i.uv.y < spectrum_value.z )
    discard;
else if( i.uv.y < spectrum_value.z + 0.01 )
    return 1.;
return 0.1;
```

![Demo3](Materials/tex_AudioLinkDocs_Demo3.gif)
```

**File:** Docs/README.md (L835-858)
```markdown
### Texture2D &lt;float4&gt; vs sampler2D

You can use either `Texture2D<float4>` and `.load()`/indexing or by using `sampler2D` and `tex2Dlod`.  We strongly recommend using the `Texture2D<float4>` method over the traditional `sampler2D` method.  This is both because of usabiity as well as a **measurable increase in perf**.  HOWEVER - in a traditional surface shader you cannot use the newer HLSL syntax.  AudioLink will automatically fallback to the old texture indexing but if you want to do it manually, you may `#define AUDIOLINK_STANDARD_INDEXING`.

There are situations where you may need to interpolate between two points in a shader, and we find that it's still worthwhile to just do it using the indexing method.

```hlsl
Texture2D<float4>   _AudioTexture;
#define GetAudioPixelData(xy) _AudioTexture[xy]
```

And the less recommended method.

```hlsl
// We recommend against this more traditional mechanism,
sampler2D _AudioTexture;
uniform float4 _AudioTexture_TexelSize;

float4 GetAudioPixelData( int2 pixelcoord )
{
    return tex2Dlod( _AudioTexture, float4( pixelcoord*_AudioTexture_TexelSize.xy, 0, 0 ) );
}
```

```

**File:** Docs/README.md (L859-862)
```markdown
### FP16 vs FP32 (half/float)

As it currently stands, because the `rt_AudioLink` texture is used as both the input and output of the camera attached to the AudioLink object, it goes through an "Effect" pass which drives the precision to FP16 (half) from the `float` that the texture is by default.  Though, internally, the AudioLink texture is `float`, it means the values avatars are allowed to retrieve from it are limited to `half` precision.

```

**File:** Docs/README.md (L863-874)
```markdown
### AudioLinkLerp vs AudioLinkData

`AudioLinkData` is designed to read a cell's data with the most integrety possible, i.e. not mixing colors or anything else.  But, sometimes you really want to get a filtered capture.  Instead of using a hardware interpolator, at this time, for control we just use lerp ourselves.

This is what sinewave would look like if one were to use `AudioLinkData`

<img src=https://raw.githubusercontent.com/cnlohr/vrc-udon-audio-link/dev/Docs/Materials/tex_AudioLinkDocs_ComparisonLookupNone.png width=512 height=288>

This is the same output, but with `AudioLinkLerp`.

<img src=https://raw.githubusercontent.com/cnlohr/vrc-udon-audio-link/dev/Docs/Materials/tex_AudioLinkDocs_ComparisonLookupLerp.png width=512 height=288>

```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLinkDocs_Demo1.shader (L1-52)
```text
﻿Shader "AudioLink/Examples/Demo1"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };


            v2f vert (appdata v)
            {
                v2f o;

                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_OUTPUT(v2f, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                return AudioLinkData( ALPASS_AUDIOLINK + int2( 0, i.uv.y * 4. ) ).rrrr;
            }
            ENDCG
        }
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L4-37)
```text
    // Map of where features in AudioLink are.
    #define ALPASS_DFT                      uint2(0,4)  //Size: 128, 2
    #define ALPASS_WAVEFORM                 uint2(0,6)  //Size: 128, 16
    #define ALPASS_AUDIOLINK                uint2(0,0)  //Size: 128, 4
    #define ALPASS_AUDIOBASS                uint2(0,0)  //Size: 128, 1
    #define ALPASS_AUDIOLOWMIDS             uint2(0,1)  //Size: 128, 1
    #define ALPASS_AUDIOHIGHMIDS            uint2(0,2)  //Size: 128, 1
    #define ALPASS_AUDIOTREBLE              uint2(0,3)  //Size: 128, 1
    #define ALPASS_AUDIOLINKHISTORY         uint2(1,0)  //Size: 127, 4
    #define ALPASS_GENERALVU                uint2(0,22) //Size: 12, 1
    #define ALPASS_GENERALVU_INSTANCE_TIME  uint2(2,22)
    #define ALPASS_GENERALVU_LOCAL_TIME     uint2(3,22)
    #define ALPASS_GENERALVU_NETWORK_TIME   uint2(4,22)
    #define ALPASS_GENERALVU_PLAYERINFO     uint2(6,22)
    #define ALPASS_THEME_COLOR0             uint2(0,23)
    #define ALPASS_THEME_COLOR1             uint2(1,23)
    #define ALPASS_THEME_COLOR2             uint2(2,23)
    #define ALPASS_THEME_COLOR3             uint2(3,23)
    #define ALPASS_GENERALVU_UNIX_DAYS      uint2(5,23)
    #define ALPASS_GENERALVU_UNIX_SECONDS   uint2(6,23)
    #define ALPASS_GENERALVU_SOURCE_POS     uint2(7,23)
    #define ALPASS_MEDIASTATE               uint2(5,22)

    #define ALPASS_CCINTERNAL               uint2(12,22) //Size: 12, 2
    #define ALPASS_CCCOLORS                 uint2(25,22) //Size: 12, 1 (Note Color #0 is always black, Colors start at 1)
    #define ALPASS_CCSTRIP                  uint2(0,24)  //Size: 128, 1
    #define ALPASS_CCLIGHTS                 uint2(0,25)  //Size: 128, 2
    #define ALPASS_AUTOCORRELATOR           uint2(0,27)  //Size: 128, 1
    #define ALPASS_FILTEREDAUDIOLINK        uint2(0,28)  //Size: 16, 4
    #define ALPASS_CHRONOTENSITY            uint2(16,28) //Size: 8, 4
    #define ALPASS_FILTEREDVU               uint2(24,28) //Size: 4, 4
    #define ALPASS_FILTEREDVU_INTENSITY     uint2(24,28) //Size: 4, 1
    #define ALPASS_FILTEREDVU_MARKER        uint2(24,29) //Size: 4, 1
    #define ALPASS_GLOBAL_STRINGS           uint2(40,28) //Size: 8, 4
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L39-91)
```text
    // Some basic constants to use (Note, these should be compatible with
    // future version of AudioLink, but may change.
    #define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
    #define AUDIOLINK_SAMPLEDATA24          2046
    #define AUDIOLINK_EXPBINS               24
    #define AUDIOLINK_EXPOCT                10
    #define AUDIOLINK_ETOTALBINS            (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
    #define AUDIOLINK_WIDTH                 128
    #define AUDIOLINK_SPS                   48000       // Samples per second
    #define AUDIOLINK_ROOTNOTE              0
    #define AUDIOLINK_4BAND_FREQFLOOR       0.123
    #define AUDIOLINK_4BAND_FREQCEILING     1
    #define AUDIOLINK_BOTTOM_FREQUENCY      13.75
    #define AUDIOLINK_BASE_AMPLITUDE        2.5
    #define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
    #define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
    #define AUDIOLINK_DFT_Q                 4.0
    #define AUDIOLINK_TREBLE_CORRECTION     5.0
    #define AUDIOLINK_4BAND_TARGET_RATE     90.0
    #define AUDIOLINK_LUT                   {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, \
                                            0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, \
                                            0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, \
                                            0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.001, 0.002, 0.003, 0.004, 0.005, 0.006, \
                                            0.008, 0.01, 0.012, 0.014, 0.017, 0.02, 0.022, 0.025, 0.029, 0.032, 0.036, \
                                            0.04, 0.044, 0.048, 0.053, 0.057, 0.062, 0.067, 0.072, 0.078, 0.083, 0.089, \
                                            0.095, 0.101, 0.107, 0.114, 0.121, 0.128, 0.135, 0.142, 0.149, 0.157, 0.164, \
                                            0.172, 0.18, 0.188, 0.196, 0.205, 0.213, 0.222, 0.23, 0.239, 0.248, 0.257, \
                                            0.266, 0.276, 0.285, 0.294, 0.304, 0.313, 0.323, 0.333, 0.342, 0.352, 0.362, \
                                            0.372, 0.381, 0.391, 0.401, 0.411, 0.421, 0.431,  0.441, 0.451, 0.46, 0.47, \
                                            0.48, 0.49, 0.499, 0.509, 0.519, 0.528, 0.538, 0.547, 0.556, 0.565, 0.575, \
                                            0.584, 0.593, 0.601, 0.61, 0.619, 0.627, 0.636, 0.644, 0.652, 0.66, 0.668, \
                                            0.676, 0.684, 0.691, 0.699, 0.706, 0.713, 0.72, 0.727, 0.734, 0.741, 0.747, \
                                            0.754, 0.76, 0.766,  0.772, 0.778, 0.784, 0.79, 0.795, 0.801, 0.806, 0.811, \
                                            0.816, 0.821, 0.826, 0.831, 0.835, 0.84, 0.844, 0.848, 0.853, 0.857, 0.861, \
                                            0.864,  0.868, 0.872, 0.875, 0.879, 0.882, 0.885, 0.888, 0.891, 0.894, 0.897, \
                                            0.899, 0.902, 0.904, 0.906, 0.909, 0.911, 0.913, 0.914, 0.916, 0.918, 0.919, \
                                            0.921, 0.922, 0.924, 0.925, 0.926, 0.927, 0.928, 0.928, 0.929, 0.929, 0.93, \
                                            0.93, 0.93, 0.931, 0.931, 0.93, 0.93, 0.93, 0.93, 0.929, 0.929, 0.928, 0.927, \
                                            0.926, 0.925, 0.924, 0.923, 0.922, 0.92, 0.919, 0.917, 0.915, 0.913, 0.911, \
                                            0.909, 0.907, 0.905, 0.903, 0.9}

    // Text constants
    #define AUDIOLINK_STRING_MAX_CHARS      32
    #define AUDIOLINK_STRING_LOCALPLAYER    0
    #define AUDIOLINK_STRING_MASTER         1
    #define AUDIOLINK_STRING_CUSTOM1        2
    #define AUDIOLINK_STRING_CUSTOM2        3

    // ColorChord constants
    #define COLORCHORD_EMAXBIN              192
    #define COLORCHORD_NOTE_CLOSEST         3.0
    #define COLORCHORD_NEW_NOTE_GAIN        8.0
    #define COLORCHORD_MAX_NOTES            10
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L93-98)
```text
    // We use glsl_mod for most calculations because it behaves better
    // on negative numbers, and in some situations actually outperforms
    // HLSL's modf().
    #ifndef glsl_mod
        #define glsl_mod(x,y) (((x)-(y)*floor((x)/(y))))
    #endif
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L100-113)
```text
    uniform float4               _AudioTexture_TexelSize;

    #ifdef SHADER_TARGET_SURFACE_ANALYSIS
        #define AUDIOLINK_STANDARD_INDEXING
    #endif

    // Mechanism to index into texture.
    #ifdef AUDIOLINK_STANDARD_INDEXING
        sampler2D _AudioTexture;
        #define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
    #else
        uniform Texture2D<float4>   _AudioTexture;
        #define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
    #endif
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L115-116)
```text
    // Convenient mechanism to read from the AudioLink texture that handles reading off the end of one line and onto the next above it.
    float4 AudioLinkDataMultiline(uint2 xycoord) { return AudioLinkData(uint2(xycoord.x % AUDIOLINK_WIDTH, xycoord.y + xycoord.x/AUDIOLINK_WIDTH)); }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L118-119)
```text
    // Mechanism to sample between two adjacent pixels and lerp between them, like "linear" supesampling
    float4 AudioLinkLerp(float2 xy) { return lerp( AudioLinkData(xy), AudioLinkData(xy+int2(1,0)), frac( xy.x ) ); }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L121-122)
```text
    // Same as AudioLinkLerp but properly handles multiline reading.
    float4 AudioLinkLerpMultiline(float2 xy) { return lerp(AudioLinkDataMultiline(xy), AudioLinkDataMultiline(xy+float2(1,0)), frac(xy.x)); }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L124-134)
```text
    //Tests to see if Audio Link texture is available
    bool AudioLinkIsAvailable()
    {
        #if !defined(AUDIOLINK_STANDARD_INDEXING)
            int width, height;
            _AudioTexture.GetDimensions(width, height);
            return width > 16;
        #else
            return _AudioTexture_TexelSize.z > 16;
        #endif
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L155-184)
```text
    float AudioLinkGetVersionMajor()
    {
        return AudioLinkData(ALPASS_GENERALVU).y;
    }

    float AudioLinkGetVersionMinor()
    {
        // If the major version is 1 or greater, we are using the new versioning system.
        if (AudioLinkGetVersionMajor() > 0)
        {
            return AudioLinkData(ALPASS_GENERALVU).w;
        }
        // Otherwise, defer to the old logic for determining version.
        else
        {
            int2 dims;
            #if !defined(AUDIOLINK_STANDARD_INDEXING)
                _AudioTexture.GetDimensions(dims.x, dims.y);
            #else
                dims = _AudioTexture_TexelSize.zw;
            #endif

            if (dims.x >= 128)
                return AudioLinkData(ALPASS_GENERALVU).x;
            else if (dims.x > 16)
                return 1;
            else
                return 0;
        }
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L190-194)
```text
    uint AudioLinkDecodeDataAsUInt(uint2 indexloc)
    {
        uint4 rpx = AudioLinkData(indexloc);
        return rpx.x + rpx.y*1024 + rpx.z * 1048576 + rpx.w * 1073741824;
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L197-206)
```text
    // if your code will alias sooner, you will need to use a different function.  It should be safe to use this on all times.
    float AudioLinkDecodeDataAsSeconds(uint2 indexloc)
    {
        uint time = AudioLinkDecodeDataAsUInt(indexloc) & 0x7ffffff;
        //Can't just divide by float.  Bug in Unity's HLSL compiler.
        return float(time / 1000) + float( time % 1000 ) / 1000.;
    }

    #define ALDecodeDataAsSeconds( x ) AudioLinkDecodeDataAsSeconds( x )
    #define ALDecodeDataAsUInt( x ) AudioLinkDecodeDataAsUInt( x )
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L210-228)
```text
    float3 AudioLinkHSVtoRGB(float3 HSV)
    {
        float3 RGB = 0;
        float C = HSV.z * HSV.y;
        float H = HSV.x * 6;
        float X = C * (1 - abs(fmod(H, 2) - 1));
        if (HSV.y != 0)
        {
            float I = floor(H);
            if (I == 0) { RGB = float3(C, X, 0); }
            else if (I == 1) { RGB = float3(X, C, 0); }
            else if (I == 2) { RGB = float3(0, C, X); }
            else if (I == 3) { RGB = float3(0, X, C); }
            else if (I == 4) { RGB = float3(X, 0, C); }
            else { RGB = float3(C, 0, X); }
        }
        float M = HSV.z - C;
        return RGB + M;
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L230-258)
```text
    float3 AudioLinkCCtoRGB(float bin, float intensity, int rootNote)
    {
        float note = bin / AUDIOLINK_EXPBINS;

        float hue = 0.0;
        note *= 12.0;
        note = glsl_mod(4. - note + rootNote, 12.0);
        {
            if(note < 4.0)
            {
                //Needs to be YELLOW->RED
                hue = (note) / 24.0;
            }
            else if(note < 8.0)
            {
                //            [4]  [8]
                //Needs to be RED->BLUE
                hue = (note-2.0) / 12.0;
            }
            else
            {
                //             [8] [12]
                //Needs to be BLUE->YELLOW
                hue = (note - 4.0) / 8.0;
            }
        }
        float val = intensity - 0.1;
        return AudioLinkHSVtoRGB(float3(fmod(hue, 1.0), 1.0, clamp(val, 0.0, 1.0)));
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L261-265)
```text
    float4 AudioLinkGetAmplitudeAtFrequency(float hertz)
    {
        float note = AUDIOLINK_EXPBINS * log2(hertz / AUDIOLINK_BOTTOM_FREQUENCY);
        return AudioLinkLerpMultiline(ALPASS_DFT + float2(note, 0));
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L273-278)
```text
    // Sample the amplitude of a given semitone in an octave. Octave is in [0; 9] while note is [0; 11].
    float4 AudioLinkGetAmplitudeAtNote(float octave, float note)
    {
        float quarter = note * 2.0;
        return AudioLinkGetAmplitudeAtQuarterNote(octave, quarter);
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L300-304)
```text
    // given chronotensity index [0; 7] and AudioLink band [0; 3].
    float AudioLinkGetChronoTime(uint index, uint band)
    {
        return (AudioLinkDecodeDataAsUInt(ALPASS_CHRONOTENSITY + uint2(index, band))) / 100000.0;
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L307-311)
```text
    // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
    float AudioLinkGetChronoTimeNormalized(uint index, uint band, float speed)
    {
        return frac(AudioLinkGetChronoTime(index, band) * speed);
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L313-318)
```text
    // Get a chronotensity value in the interval [0; interval], modulated by the speed input,
    // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
    float AudioLinkGetChronoTimeInterval(uint index, uint band, float speed, float interval)
    {
        return AudioLinkGetChronoTimeNormalized(index, band, speed) * interval;
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L320-328)
```text
    // Get time of day. The return value is a float4 with the values float3(hour, minute, second).
    float3 AudioLinkGetTimeOfDay()
    {
        float value = AudioLinkDecodeDataAsSeconds(ALPASS_GENERALVU_UNIX_SECONDS);
        float hour = floor(value / 3600.0);
        float minute = floor(value / 60.0) % 60.0;
        float second = value % 60.0;
        return float3(hour, minute, second);
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L334-338)
```text
    uint AudioLinkGetGlobalStringChar(uint stringIndex, uint charIndex)
    {
        uint4 fourChars = asuint(AudioLinkData(ALPASS_GLOBAL_STRINGS + uint2(charIndex / 4, stringIndex)));
        return fourChars[charIndex % 4];
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L340-358)
```text
    // Get a character from the local player name given a character index in the range [0; 31].
    // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
    uint AudioLinkGetLocalPlayerNameChar(uint charIndex)
    {
        return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_LOCALPLAYER, charIndex);
    }

    // Get a character from the master player name given a character index in the range [0; 31].
    // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
    uint AudioLinkGetMasterNameChar(uint charIndex)
    {
        return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_MASTER, charIndex);
    }

    // Get a character from the first custom string given a character index in the range [0; 31].
    // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
    uint AudioLinkGetCustomString1Char(uint charIndex)
    {
        return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_CUSTOM1, charIndex);
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc (L369-372)
```text
    float4 AudioLinkGetAudioSourcePosition()
    {
        return float4(AudioLinkData(ALPASS_GENERALVU_SOURCE_POS).xyz,1);
    }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/FilteredVUDebug.shader (L44-65)
```text
            fixed4 frag (v2f i) : SV_Target
            {
                i.uv.x *= 1.125;

                // Dividers
                if (frac(i.uv.x*4) < 0.02)
                    return float4(1, 0, 0, 1);

                // Show ground truth marker value
                if (i.uv.x > 1)
                    return (i.uv.y < AudioLinkData(ALPASS_GENERALVU + uint2(9, 0)).r) * float4( 0.8, 0.8, 0.8, 1.);

                // Sample filtered VU / markers
                float vu = AudioLinkData(ALPASS_FILTEREDVU_INTENSITY + uint2(i.uv.x*4, 0)).r;
                float marker = AudioLinkData(ALPASS_FILTEREDVU_MARKER + uint2(i.uv.x*4, 0)).r;

                // Show max markers
                if (abs(i.uv.y - marker) < 0.015)
                    return float4(0, 1, 0, 1);
                
                // Show columns
                return (i.uv.y < vu) * float4( 0.7, 0.7, 0.7, 1.);
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/ThemeColorGrid.shader (L51-59)
```text
            fixed4 frag (v2f i) : SV_Target
            {
                uint2 themeColorLocation = (i.uv.y > .5) ?
                    ((i.uv.x < .5)? ALPASS_THEME_COLOR0 : ALPASS_THEME_COLOR1) :
                    ((i.uv.x < .5)? ALPASS_THEME_COLOR2 : ALPASS_THEME_COLOR3);
                fixed3 themeColor = AudioLinkData(themeColorLocation).rgb;
                fixed4 col = tex2D(_MainTex, i.uv);
                themeColor = lerp(themeColor, col.rgb, col.a *.25);
                return fixed4(themeColor, 1);
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLinkDocs_Demo7.shader (L88-105)
```text
            float4 frag (v2f i) : SV_Target
            {
                uint2 quadrant = i.uv * 2;
                int quadrant_id = quadrant.x + quadrant.y * 2;

                int mode = 0;

                float time = AudioLinkDecodeDataAsUInt( ALPASS_CHRONOTENSITY +
                    uint2( mode, quadrant_id ) ) % 628318;

                float2 localuv = i.uv * 4 - quadrant * 2 - 1;

                float colout = GenFractal( localuv, time/100000. );
                
                colout *= max( 0, AudioLinkData( ALPASS_AUDIOLINK + uint2( 0, quadrant_id ) ) - .1 );

                return float4( colout.xxx, 1.);
            }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/GlobalStringExample.shader (L46-64)
```text
            float4 frag (v2f i) : SV_Target
            {
                i.uv.y = 1.0 - i.uv.y;
                
                // Pixel location on font pixel grid
                float2 pos = i.uv * float2(PIXELFONT_COLS, PIXELFONT_ROWS);
                uint2 pixel = (uint2)pos;
                
                // Fetch character from audiolink 
                int character = AudioLinkGetGlobalStringChar(pixel.y, pixel.x);

                // AA trick
                float2 softness_uv = pos * float2( 4, 6 );
                float softness = 4./(pow( length( float2( ddx( softness_uv.x ), ddy( softness_uv.y ) ) ), 0.5 ))-1.;

                // Render char
                float2 charUV = float2(4, 6) - fmod(pos, 1.0) * float2(4.0, 6.0);
                return PrintChar(character, charUV, softness, 0);
            }
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioReactiveSurface.shader (L310-313)
```text
			inline float AudioLinkLerp3_g6( int Band, float Delay )
			{
				return AudioLinkLerp( ALPASS_AUDIOLINK + float2( Delay, Band ) ).r;
			}
```

**File:** Packages/com.llealloo.audiolink/Runtime/Shaders/AudioReactiveSurface.shader (L513-548)
```text
				float _AudioHueShift_Instance = UNITY_ACCESS_INSTANCED_PROP(_AudioHueShift_arr, _AudioHueShift);
				float hueShift33 = _AudioHueShift_Instance;
				float _Band_Instance = UNITY_ACCESS_INSTANCED_PROP(_Band_arr, _Band);
				int Band3_g6 = (int)_Band_Instance;
				float2 texCoord50 = IN.ase_texcoord9.xy * float2( 1,1 ) + float2( 0,0 );
				float2 break6_g4 = texCoord50;
				float temp_output_5_0_g4 = ( break6_g4.x - 0.5 );
				float _PulseRotation_Instance = UNITY_ACCESS_INSTANCED_PROP(_PulseRotation_arr, _PulseRotation);
				float temp_output_2_0_g4 = radians( _PulseRotation_Instance );
				float temp_output_3_0_g4 = cos( temp_output_2_0_g4 );
				float temp_output_8_0_g4 = sin( temp_output_2_0_g4 );
				float temp_output_20_0_g4 = ( 1.0 / ( abs( temp_output_3_0_g4 ) + abs( temp_output_8_0_g4 ) ) );
				float temp_output_7_0_g4 = ( break6_g4.y - 0.5 );
				float2 appendResult16_g4 = (float2(( ( ( temp_output_5_0_g4 * temp_output_3_0_g4 * temp_output_20_0_g4 ) + ( temp_output_7_0_g4 * temp_output_8_0_g4 * temp_output_20_0_g4 ) ) + 0.5 ) , ( ( ( temp_output_7_0_g4 * temp_output_3_0_g4 * temp_output_20_0_g4 ) - ( temp_output_5_0_g4 * temp_output_8_0_g4 * temp_output_20_0_g4 ) ) + 0.5 )));
				float _Pulse_Instance = UNITY_ACCESS_INSTANCED_PROP(_Pulse_arr, _Pulse);
				float _Delay_Instance = UNITY_ACCESS_INSTANCED_PROP(_Delay_arr, _Delay);
				float Delay3_g6 = ( ( (_Delay_Instance + (( appendResult16_g4.x * _Pulse_Instance ) - 0.0) * (1.0 - _Delay_Instance) / (1.0 - 0.0)) % 1.0 ) * 128.0 );
				float localAudioLinkLerp3_g6 = AudioLinkLerp3_g6( Band3_g6 , Delay3_g6 );
				float temp_output_96_0 = localAudioLinkLerp3_g6;
				float amplitude36 = temp_output_96_0;
				float3 hsvTorgb39 = HSVToRGB( float3(( hsvTorgb32.x + ( hueShift33 * amplitude36 ) ),hsvTorgb32.y,hsvTorgb32.z) );
				
				float4 _BumpMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_BumpMap_ST_arr, _BumpMap_ST);
				float2 uv_BumpMap = IN.ase_texcoord9.xy * _BumpMap_ST_Instance.xy + _BumpMap_ST_Instance.zw;
				
				float4 _EmissionMap_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionMap_ST_arr, _EmissionMap_ST);
				float2 uv_EmissionMap = IN.ase_texcoord9.xy * _EmissionMap_ST_Instance.xy + _EmissionMap_ST_Instance.zw;
				float4 _EmissionColor_Instance = UNITY_ACCESS_INSTANCED_PROP(_EmissionColor_arr, _EmissionColor);
				float3 hsvTorgb40 = RGBToHSV( ( tex2D( _EmissionMap, uv_EmissionMap ) * _EmissionColor_Instance * temp_output_96_0 ).rgb );
				float3 hsvTorgb45 = HSVToRGB( float3(( hsvTorgb40.x + ( hueShift33 * amplitude36 ) ),hsvTorgb40.y,hsvTorgb40.z) );
				float _Emission_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emission_arr, _Emission);
				
				o.Albedo = hsvTorgb39;
				o.Normal = ( UnpackNormal( tex2D( _BumpMap, uv_BumpMap ) ) * _BumpScale );
				o.Emission = ( hsvTorgb45 * _Emission_Instance );
				#if defined(_SPECULAR_SETUP)
```
