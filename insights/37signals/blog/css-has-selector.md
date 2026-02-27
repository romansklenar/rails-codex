---
title: ":has() Selector for State-Based Styling"
source: https://dev.37signals.com/modern-css-patterns-and-techniques-in-campfire/
description: ":has() pseudo-class for state-based styling without JavaScript"
tags: [css]
---

# :has() Selector for State-Based Styling

Use `:has()` to style elements based on their children's state. Prefer CSS over JavaScript for visual state changes.

## Use Cases

### Parent styling based on child state
```sass
.form-field
  &:has(input:disabled)
    opacity: .5

  &:has(input:focus)
    border-color: $color-blue-500

  &:has(input:invalid)
    border-color: $color-red-500
```

### Conditional visibility
```sass
// Show indicator when sidebar contains unread items
.menu-toggle:has(~ .sidebar .unread)::after
  content: ""
  background: $color-red-500
  border-radius: 50%
  width: .5em
  height: .5em
```

### Element counting
```sass
// Adjust layout based on child count
.avatar-group
  &:has(> :last-child:nth-child(2))
    --avatar-size: 1.5em
  &:has(> :last-child:nth-child(3))
    --avatar-size: 1.2em
```

### Row state from child
```sass
// Grey out row when action button is hidden
.list-item:has(.btn.invisible)
  opacity: .5
```

## Tips

- Wrap in `:where()` to keep specificity zero: `&:where(:has(img))`
- Replaces many cases where JS would toggle a parent class
- Baseline support: all modern browsers (2023+)
