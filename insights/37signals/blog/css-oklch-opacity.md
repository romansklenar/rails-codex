---
title: OKLCH Dynamic Opacity
source:
  type: blog
  title: Modern CSS patterns in Campfire
  author: Jason Zimdars
  url: https://dev.37signals.com/modern-css-patterns-and-techniques-in-campfire/
  date: '2024-04-04'
tags:
- css
- colors
---

# OKLCH Dynamic Opacity

Technique for applying runtime opacity to OKLCH colors using CSS custom properties. Not yet adopted — documented for future reference.

## Technique

Store LCH triplet (without `oklch()` wrapper) as a CSS custom property. Apply opacity with the `/` syntax.

```sass
:root
  --lch-blue: 54% 0.23 255
  --lch-red: 63% 0.24 29

.link
  color: oklch(var(--lch-blue))

.link-faded
  color: oklch(var(--lch-blue) / 0.5)

.overlay
  background: oklch(var(--lch-red) / 0.1)
```

## Why

- Single color definition, infinite opacity variants without new variables
- Works with `light-dark()` for theme switching
- No SASS compilation needed — fully runtime

## When to Adopt

The CSS custom property approach becomes valuable over SASS variables when:

- You need many opacity variants of the same color
- Colors must change at runtime (themes, user preferences)
- You want to avoid generating `$color-blue-500-50`, `$color-blue-500-30`, etc.
