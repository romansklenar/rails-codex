---
title: CSS Custom Property Variants
source:
  type: blog
  title: Modern CSS patterns in Campfire
  author: Jason Zimdars
  url: https://dev.37signals.com/modern-css-patterns-and-techniques-in-campfire/
  date: '2024-04-04'
tags:
- css
- components
---

# CSS Custom Property Variants

For new components, use CSS custom properties with fallback values to define themeable surfaces. Don't retrofit existing components.

## Pattern

Define defaults inline with `var()`. Create variants by reassigning only the properties that change.

```sass
.badge
  background: var(--badge-bg, #{$color-zinc-100})
  color: var(--badge-color, #{$color-zinc-700})
  border-radius: var(--badge-radius, #{$radius-full})

.badge--success
  --badge-bg: #{$color-green-100}
  --badge-color: #{$color-green-800}

.badge--danger
  --badge-bg: #{$color-red-100}
  --badge-color: #{$color-red-800}
```

## When to Use

- New components with 2+ visual variants
- Components that need runtime theming (dark mode, user preference)
- Avoid for one-off styles or components with no variants

## When NOT to Use

- Existing components using SASS variables — leave them as-is
- Static values that never change per-variant
