---
title: Turbo Progressive Enhancement Hierarchy
source:
  type: blog
  title: A happier happy path in Turbo with morphing
  author: Jorge Manrubia
  url: https://dev.37signals.com/a-happier-happy-path-in-turbo-with-morphing/
  date: '2023-10-09'
tags:
- hotwire
- turbo
---

# Turbo Progressive Enhancement Hierarchy

Choose the simplest Turbo mechanism that meets the UI need:

1. **Turbo Drive** — full page navigation (default, zero config)
2. **Page Refresh + Morphing** — redirect-to-self with DOM morphing (preserves scroll, focus)
3. **Turbo Frames** — partial page updates within a frame
4. **Turbo Streams** — fine-grained DOM manipulation (highest complexity)

## Morphing Simplifies Broadcasting

Instead of crafting specific stream actions per model change:

```ruby
# BEFORE — one broadcast per operation
broadcasts_to :board, inserts_by: :prepend
after_destroy_commit -> { broadcast_remove_to board }

# AFTER — single refresh signal, Turbo morphs the page
broadcasts_refreshes
```

Multiple refresh broadcasts auto-debounce into one operation.

## When to Reach for Streams

- Morphing can't preserve ephemeral UI (open menus, popovers)
- You need to update elements outside the current frame
- Real-time multi-user updates require surgical DOM changes

## Preserve Elements During Morphing

```html
<div data-turbo-permanent id="open-menu">...</div>
```
