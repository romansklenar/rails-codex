---
title: "Input Device Media Queries"
source: https://dev.37signals.com/modern-css-patterns-and-techniques-in-campfire/
description: "Hover/pointer media queries for touch vs mouse adaptation"
tags: [css, responsive]
---

# Input Device Media Queries

Guard hover effects and adapt UI for touch vs mouse.

## Hover Guard

Wrap all `:hover` styles in `@media (any-hover: hover)` to prevent sticky hover states on touch devices.

```sass
.list-item
  @media (any-hover: hover)
    &:where(:not(:active):hover)
      background: $color-zinc-50
```

Without this guard, tapping an element on mobile leaves it visually "stuck" in hover state.

## Pointer-Based UI

Use `pointer` queries to show/hide UI based on input precision.

```sass
// Reveal action button on hover (mouse only)
.list-item .action-btn
  @media (any-hover: hover) and (pointer: fine)
    opacity: 0
    .list-item:hover &
      opacity: 1

  // Always visible on touch
  @media (pointer: coarse)
    opacity: 1
```

## Quick Reference

| Query | Matches |
|-------|--------|
| `any-hover: hover` | Mouse, trackpad |
| `any-hover: none` | Touch-only devices |
| `pointer: fine` | Mouse cursor |
| `pointer: coarse` | Finger/stylus |

## Existing Mixin

Consider wrapping in a SASS mixin if used frequently:

```sass
=hover-only
  @media (any-hover: hover)
    &:where(:not(:active):hover)
      @content
```
