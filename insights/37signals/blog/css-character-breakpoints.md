---
title: Character-Based Breakpoints
source:
  type: blog
  title: Modern CSS patterns in Campfire
  author: Jason Zimdars
  url: https://dev.37signals.com/modern-css-patterns-and-techniques-in-campfire/
  date: '2024-04-04'
tags:
- css
- responsive
---

# Character-Based Breakpoints

Prefer `ch` units over pixels for media query breakpoints. `ch` responds to font size and actual content flow, not just viewport width.

## Why

- `1ch` = width of the `0` character in the current font
- Breakpoints adapt when users change font size or zoom
- Content-driven: layout breaks when text no longer fits, not at arbitrary pixel values

## Pattern

```sass
// Content area collapses when fewer than ~80 characters fit
@media (max-width: 80ch)
  .sidebar
    display: none
  .menu-toggle
    display: block

// Stack columns when narrow
@media (max-width: 60ch)
  .two-column
    flex-direction: column
```

## Common Equivalents

| `ch` value | Approximate `px` (at 16px base) |
|-----------|--------------------------------|
| `60ch` | ~480px |
| `80ch` | ~640px |
| `100ch` | ~800px |
| `120ch` | ~960px |

## Existing Pixel Breakpoints

Existing `$breakpoint-sm/md/lg/xl` variables remain valid. Don't refactor existing code. Use `ch` for new breakpoints.
