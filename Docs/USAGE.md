# DecalEx Usage Guide

A lilToon extension shader that adds dedicated decal slots.

## Overview

DecalEx adds two independent decal slots (**Decal Slot 1 / Slot 2**) to lilToon.
Each slot lets you place a decal at any position, size, and rotation within the UV, and optionally combine the following sub-features:

- **Main Decal Texture** — color decal with blend mode
- **Mask** — restrict the decal area using a texture
- **Normal Map** — normal map applied only within the decal area
- **MatCap** — MatCap applied only within the decal area
- **Emission** — self-illumination with animation support

## Installation

1. Confirm lilToon is installed in your project
2. Import the unitypackage
3. Wait for Unity to finish recompiling scripts

## Applying the Shader

1. Select a material
2. In the Shader dropdown, choose `dennoko_decalex > lilToon`
3. Expand **Decal Slot 1** / **Decal Slot 2** at the bottom of the Inspector and configure

Rendering modes Opaque, Cutout, and Transparent are all supported.

---

## Slot Structure

Both slots (Slot 1 / Slot 2) share the same structure.

### Basic

| Parameter | Description |
|---|---|
| **Enable** | Toggle the entire slot on/off |
| **Disable on Backface** | Disable the decal on back-facing polygons (applies to all sub-features) |

---

### Position — Shared by all sub-features

Position, scale, and rotation are shared by all sub-features (texture, mask, normal map, MatCap, emission).

| Parameter | Description |
|---|---|
| **Offset X / Y** | Decal center in UV space (0.5, 0.5 = UV center) |
| **Scale X / Y** | Decal UV width / height (1.0 = full UV width) |
| **Angle** | Decal rotation in degrees (−180 to 180) |

**Example:** A decal centered at UV (0.3, 0.7) with width 0.2 and height 0.15
→ Offset X = 0.3, Offset Y = 0.7, Scale X = 0.2, Scale Y = 0.15

---

### Main Decal Texture

| Parameter | Description |
|---|---|
| **Texture** | Main decal texture (alpha channel = opacity) |
| **Color** | Color multiplied onto the texture |
| **Opacity** | Decal opacity (also multiplied with the texture alpha) |
| **Blend Mode** | How to composite with the base color (see table below) |

#### Blend Modes

| Mode | Effect |
|---|---|
| Add | Addition — result becomes brighter |
| Screen | Screen — natural brightness increase |
| Multiply | Multiply — result becomes darker |
| Overlay | Overlay — contrast enhancement |
| Soft Light | Soft Light — gentle brightening/darkening |
| Replace | Replace — overwrites with decal color |
| Subtract | Subtract — result becomes darker |
| Lighten | Lighten — takes the brighter of the two |
| Darken | Darken — takes the darker of the two |

---

### Mask

| Parameter | Description |
|---|---|
| **Use Mask** | Use a mask texture to restrict where the decal is visible |
| **Mask Texture** | Area mask (white = apply, black = hide). Shares Position settings |

Outside the mask all sub-features (texture, normal map, MatCap, emission) are suppressed.

---

### Normal Map

| Parameter | Description |
|---|---|
| **Enable Normal Map** | Enable a normal map applied only within the decal area |
| **Normal Map** | Tangent-space normal map texture |
| **Strength** | Normal map strength (0 = flat, 1 = normal, 3 = enhanced) |

---

### MatCap

| Parameter | Description |
|---|---|
| **Enable MatCap** | Enable MatCap |
| **Texture** | MatCap texture (sphere capture image) |
| **Color** | Color multiplied onto the MatCap |
| **Opacity** | MatCap opacity |
| **Blend Mode** | Composite mode (same options as Main Decal Texture) |
| **Main Color Strength** | How strongly the main texture color is multiplied onto the MatCap (0 = off, 1 = full) |
| **Blur** | MatCap blur amount (requires MipMaps on the texture) |
| **Normal Strength** | Normal map influence on MatCap UV calculation |
| **Use Reflection** | Reflection mode — MatCap appearance changes with camera angle (specular-like) |
| **Enable Lighting** | Lighting influence (0 = off, 1 = full) |
| **Shadow Strength** | MatCap attenuation in shadow areas (0 = no effect, 1 = fully hidden in shadow) |
| **Rim Power** | Fresnel rim mask (positive = edges, negative = center, 0 = off) |
| **Emission Addition** | Adds MatCap color as emission |

#### Use Reflection

- **OFF (default):** Fixed MatCap driven by the surface normal, independent of camera position
- **ON (reflection):** MatCap appearance varies with camera angle (mirror-like reflection)

#### Rim Power

| Value | Effect |
|---|---|
| 0 | Rim mask disabled — MatCap applied uniformly |
| Positive | Stronger toward edges; higher value = narrower edge ring |
| Negative | Stronger toward the center; larger absolute value = more center-focused |

---

### Emission

| Parameter | Description |
|---|---|
| **Enable Emission** | Enable emission |
| **Texture** | Emission texture (if not set, emits as a flat color) |
| **Color** | Color multiplied onto the emission texture |
| **Strength** | Emission strength |
| **Opacity** | How strongly the emissive color overlays onto the lit result (0 = preserves original look when dark) |

#### Sin Wave

Smoothly oscillates emission strength with a sine wave.

| Parameter | Description |
|---|---|
| **Sin Wave** | ON/OFF |
| **Speed** | Oscillation speed (higher = faster) |
| **Min** | Minimum brightness (0 = fully off) |
| **Max** | Maximum brightness (1 = full Strength) |

#### Random Pulse

Randomly pulses emission on and off. Two independent patterns are combined with OR, allowing complex flicker.

| Parameter | Description |
|---|---|
| **Random Pulse** | ON/OFF |
| **Pulse Probability 1** | Probability that pattern 1 fires in each time window (0–1) |
| **Pulse Duration 1** | How long pattern 1 stays on when triggered (seconds) |
| **Pulse Probability 2** | Probability that pattern 2 fires in each time window (0–1) |
| **Pulse Duration 2** | How long pattern 2 stays on when triggered (seconds) |

Emission occurs whenever either pattern condition is met (OR combination).

#### UV Scroll

Scrolls the emission texture UV over time.

| Parameter | Description |
|---|---|
| **UV Scroll** | ON/OFF |
| **Scroll X** | Horizontal scroll speed (UV/sec, −3 to 3) |
| **Scroll Y** | Vertical scroll speed (UV/sec, −3 to 3) |
| **Scroll Mask** | Mask that moves with the scroll (white = emit, black = hide). Set Tiling to repeat a pattern |

If no emission texture is assigned, only the scroll mask animates.
If an emission texture is assigned, both the texture and mask scroll at the same speed.

Sin Wave, Random Pulse, and UV Scroll can be enabled simultaneously and combined freely.

#### AudioLink

Controls emission strength using [AudioLink](https://github.com/llealloo/vrc-udon-audio-link) in compatible worlds.
In worlds without AudioLink, emission runs at full strength as normal.

| Parameter | Description |
|---|---|
| **AudioLink** | Enable AudioLink control |
| **Bass** | Bass band weight (0 = off, 1 = normal, 2 = double) |
| **Low-Mid** | Low-mid band weight |
| **High-Mid** | High-mid band weight |
| **Treble** | Treble band weight |
| **Wave Mode** | UV-based wave: emission sweeps from one side to the other with each beat |
| **Wave Axis (0=U / 1=V)** | UV axis along which the wave travels (0 = horizontal U, 1 = vertical V) |

The final emission multiplier is `saturate(Bass×w + LowMid×w + HighMid×w + Treble×w)`.
Set all band weights to 0 to silence emission completely; set any weight above 1 to boost that band.

---

## Rendering Modes

Select from **Rendering Mode** at the top of the material.

| Mode | Description |
|---|---|
| **Opaque** | Fully opaque |
| **Cutout** | Alpha test (hard cutout) |
| **Transparent** | Semi-transparent |
