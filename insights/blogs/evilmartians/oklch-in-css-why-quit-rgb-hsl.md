---
type: insight
title: "OKLCH in CSS: Why We Moved from RGB and HSL"
description: "Comprehensive guide to the OKLCH color space in CSS Color 4: perceptual uniformity, P3 wide-gamut support, gamut mapping, color modification syntax, migration tooling with PostCSS and Stylelint"
resource: "https://evilmartians.com/chronicles/oklch-in-css-why-quit-rgb-hsl"
tags: [css, oklch, color, design-systems, postcss, stylelint, p3, frontend, accessibility]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Andrey Sitnik"
  url: "https://evilmartians.com/chronicles/oklch-in-css-why-quit-rgb-hsl"
  date: '2025-09-17'
---

# OKLCH in CSS: Why We Moved from RGB and HSL

The CSS Color 4 spec introduces `oklch()` as a perceptually uniform, device-independent color format that enables wide-gamut P3 colors, predictable color manipulation, and human-readable color values.

## The OKLCH Syntax

- `oklch(L C H)` or `oklch(L C H / a)` where:
  - `L` = perceived lightness (0–1), perceptually uniform (unlike `hsl()` where L is not uniform)
  - `C` = chroma, from 0 (gray) to maximum saturation
  - `H` = hue angle (0–360)
  - `a` = opacity (0–1 or 0–100%)
- Example colors: `oklch(0.45 0.26 264)` (blue), `oklch(1 0 0)` (white), `oklch(0 0 0 / 50%)` (50% black)
- `none` is a valid component value (e.g., white has no hue); browsers parse `none` as 0

## How CSS Colors Have Changed

- CSS Color 4 adds `oklch()`, `lch()`, `oklab()`, `lab()`, `color()` (for P3, Rec2020, etc.) and the `color-mix()` function
- CSS Color 5 adds native relative color syntax: `oklch(from X calc(l + 0.1) c h)` for color modifications
- CSS Images 4 adds color space selection for gradients: `linear-gradient(in oklch, ...)`
- All modern browsers now support `oklch()` — no polyfills needed for the base syntax

## Problems with RGB and Hex

- RGB encodes device signals, not human perception — unintuitive to read or reason about
- No relationship between numeric values and perceived lightness, saturation, or hue
- Cannot represent colors outside sRGB gamut (P3, Rec2020)
- `#ff0000` and `#00ff00` have very different perceived brightness despite equal "max" channel values

## Problems with HSL

- Hue, Saturation, Lightness are intuitive concepts but `hsl()` is not perceptually uniform
- `hsl(60 100% 50%)` (yellow) looks much brighter than `hsl(240 100% 50%)` (blue) at the same L value
- Equal L changes in HSL produce unequal perceived lightness changes
- Cannot represent P3 or Rec2020 colors

## Why OKLCH Over LCH

- LCH (Lightness-Chroma-Hue) on top of CIE LAB is better than HSL but has a painful bug: unexpected hue shift on chroma/lightness changes in blue colors (hue values 270–330)
- OKLCH is built on Oklab space (by Björn Ottosson, 2020) which fixes the LCH hue shift bug
- OKLCH has improved gamut correction — the CSS Working Group recommends OKLCH for gamut mapping
- OKLCH adopted rapidly: within 4 years, used in CSS spec, major browsers, and design tooling

## OKLCH vs. Oklab vs. LCH vs. Lab

- `Oklab` / `lab()`: Cartesian coordinates (a, b axes); better for interpolation and gradients
- `OKLCH` / `LCH`: polar coordinates (chroma, hue); better for developer readability and color manipulation
- For gradients, `oklab` often gives better results (avoids grey mid-point artifacts)
- For developer-controlled color modification, `oklch` is preferred due to predictable hue

## P3 Wide-Gamut Colors

- P3 color space (used in iPhone/Mac screens) covers ~50% more colors than sRGB
- OKLCH can encode sRGB, P3, Rec2020, and any future color space in the same syntax
- Colors outside sRGB gamut require P3-capable hardware (Chrome + Apple Silicon/Retina screens)
- Browsers render the closest possible in-gamut color when out-of-gamut colors are specified
- Manual P3 approach: provide sRGB fallback + P3 override in `@media (color-gamut: p3)`:
  ```css
  .element { color: oklch(0.55 0.22 264); }
  @media (display-p3) {
    .element { color: oklch(0.55 0.32 264); }
  }
  ```
- `stylelint-gamut` plugin automatically detects P3 colors that need `@media` wrapping

## Gamut Mapping and Correction

- Gamut mapping = finding closest displayable color when a color exceeds the monitor's gamut
- Two approaches: clipping (fast, inaccurate — used by Chrome and Safari currently) and OKLCH-space mapping (accurate, spec-required)
- CSS Colors 4 requires browsers to use OKLCH method for gamut mapping, but current browsers still use clipping
- Until browsers implement spec correctly, manually provide sRGB + P3 variants
- `stylelint-gamut` plugin enforces proper dual-declaration pattern

## Native Color Modification Syntax (CSS Colors 5)

- Relative colors: `oklch(from var(--origin) calc(l + 0.1) c h)`
- Origin color can be any CSS color or custom property
- Each component (`l`, `c`, `h`) can be the original value, a `calc()` expression, or a literal
- Cannot use `%` inside `calc()` in relative colors — use decimal fractions instead (e.g., `0.1` not `10%`)
- Example: 10% darker hover background: `oklch(from var(--bg) calc(l - 0.1) c h)`
- With CSS Custom Properties, define hover logic once and reuse across variants
- All modern browsers now support relative color syntax

## OKLCH for Gradients

- A gradient is a path through a color space — changing the space changes the result
- For gradients, no single space is universally best; different tasks need different spaces
- `oklab` (OKLCH's Cartesian sibling) often produces good, saturation-preserving gradient results
- CSS Images 4 syntax: `linear-gradient(in oklab, oklch(0.7 0.2 30), oklch(0.7 0.2 150))`
- Add easing functions to further refine gradient color distribution

## Color Manipulation in JavaScript

- `Color.js` and `culori` libraries support OKLCH transformations in JS
- Use these to generate design system palettes with predictable contrast and accessibility
- `Huetone` (accessible palette generator) uses Oklab by default
- Example: generate accessible accent color from user-provided hex by converting to OKLCH, adjusting L/C, converting back

## Migration: Converting Existing Colors

- All modern browsers support `oklch()` directly — safe to replace all `hex`, `rgb()`, `hsl()` values
- Use the OKLCH converter tool at `oklch.com` to manually convert colors
- Automated conversion script available for bulk migration
- Figma users: use the `OkColor` plugin to copy colors in `oklch()` format directly from Figma designs

## Building OKLCH Color Palettes

- Move colors to a palette as part of migration for better maintainability
- Palette requirements: consistent lightness steps, perceptually uniform chroma, named semantic tokens
- OKLCH's predicted lightness makes palette construction more systematic than with HSL

## Stylelint Integration

- `stylelint-gamut` plugin: detects colors needing P3 wrapping, enforces best practices
- `stylelint-config-recommended`: sharable config for CSS best practices alongside gamut rules
- Setup: `npm install stylelint stylelint-gamut`, add `.stylelintrc`, run via `npm test` in CI
- Run `npm test` to find colors that still need conversion to `oklch()`

## Why Evil Martians Moved to OKLCH

- Colors are readable by inspecting code: lightness value immediately communicates darkness/brightness
- Contrast-related accessibility issues visible in code by comparing L values directly
- Predictable color modification: darken/lighten without unexpected hue shifts
- Unified syntax for both sRGB and P3 wide-gamut colors via same `oklch()` function
- CSS Custom Properties + relative colors enable powerful design system patterns
- `Color.js`/`culori` provide JS-side OKLCH manipulation with same benefits
- OKLCH educates developers on perceptual color theory, raising the community's overall understanding
