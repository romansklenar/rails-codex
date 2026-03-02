---
title: 'Turbo 8: Morphing & Page Refreshes'
description: "Turbo 8 feature overview, morphing vs streams decision guide, why client-side morphing over server-side diffing"
source:
- type: blog
  title: Turbo 8 released
  author: Alberto Fernandez-Capel
  url: https://dev.37signals.com/turbo-8-released/
  date: '2024-02-07'
- type: blog
  title: Demo of page refreshes with morphing
  author: Jorge Manrubia
  url: https://dev.37signals.com/page-refreshes-with-morphing-demo/
  date: '2023-11-27'
- type: blog
  title: Exploring server-side diffing in Turbo
  author: Jorge Manrubia
  url: https://dev.37signals.com/exploring-server-side-diffing-in-turbo/
  date: '2023-10-24'
tags:
- hotwire
- turbo
---

# Turbo 8: Morphing & Page Refreshes

Turbo 8 introduced three major features. This standard captures the decision rationale;
for implementation details see `hotwire/turbo-morphing` and `turbo-progressive-enhancement`.

## Turbo 8 Feature Overview

- **Page refreshes with morphing** — redirect-to-self triggers DOM morphing (idiomorph) instead of full page swap. Preserves scroll, focus, and ephemeral state. Deployed in Basecamp Card Table and HEY Calendar.
- **View Transitions API** — CSS-animatable page transitions via browser-native View Transitions. Chrome only (progressive enhancement — no-op in other browsers). See `hotwire/turbo-drive` for `data-turbo-view-transition`.
- **InstantClick-style prefetching** — links prefetch on hover before click. ~1s improvement on slow connections (1.4s down to ~380ms in 37signals benchmarks). See `hotwire/turbo-drive` for `data-turbo-prefetch`.

## When to Use Page Refreshes vs. Streams

Page refreshes with morphing reduce the need for Turbo Streams but do not replace them.

| Mechanism | Use when | Cost |
|-----------|----------|------|
| **Page refresh + morph** | Standard CRUD, form submissions, simple broadcasts | Low — `broadcasts_refreshes` is one line, no partials to manage |
| **Turbo Streams** | Surgical updates, multi-element changes, ephemeral UI preservation | Higher — requires per-action stream templates or inline rendering |

**Default to morphing.** Reach for streams only when:
- You need to update elements that morphing can't reach (outside the page, cross-frame)
- Ephemeral UI (open dropdowns, popovers) would be lost by a morph
- Multiple users need real-time surgical DOM updates (chat, collaborative editing)

```ruby
# Prefer: one-line broadcast, Turbo morphs the page
broadcasts_refreshes

# Only when needed: targeted stream actions
broadcasts_to :board, inserts_by: :prepend
after_destroy_commit -> { broadcast_remove_to board }
```

## Why Client-Side Morphing (Not Server-Side Diffing)

37signals prototyped server-side diffing (Rails middleware caching rendered pages, computing JSON diff payloads) and rejected it because:

- **Stateless HTTP** — server-side diffing requires session-scoped page caching, violating HTTP's stateless model
- **Backend coupling** — ties the diffing implementation to Rails, making Turbo less portable across backends
- **Marginal payload savings** — diff payloads were not meaningfully smaller than morphing the full page client-side
- **Progressive enhancement** — client-side morphing (idiomorph) works with any backend that serves HTML

The chosen approach: **server sends full HTML, client morphs the DOM.** This keeps the architecture simple and aligns with Turbo's "HTML over the wire" philosophy.
