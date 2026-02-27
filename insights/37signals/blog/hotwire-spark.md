---
title: Hotwire Spark
description: "Live reloading for Rails dev — morphs HTML, swaps CSS, hot-reloads Stimulus controllers"
source:
  type: blog
  title: 'Announcing Hotwire Spark: live reloading for Rails applications'
  author: Jorge Manrubia
  url: https://dev.37signals.com/announcing-hotwire-spark-live-reloading-for-rails/
  date: '2024-12-18'
tags:
- hotwire
- devtools
---

# Hotwire Spark

Live reloading for Rails development. Automatically updates the page when source files change — no full reload, no lost state.

## Setup

```ruby
# Gemfile
group :development do
  gem "hotwire-spark"
end
```

No additional configuration needed. Works out of the box with Rails.

## What It Reloads

| Change type | Behavior |
|---|---|
| **CSS** | Swaps the changed stylesheet in-place |
| **HTML** (views/partials) | Morphs the `<body>` into the new markup, reconnects Stimulus controllers |
| **Stimulus controllers** | Fetches modified controller module, replaces it in Stimulus, reconnects all controllers |

## Key Design Decisions

- **Built for #nobuild** — designed around serving CSS and JS as standalone files (not bundles), enabling selective file-level updates
- **Hot Module Replacement without bundlers** — Stimulus controller HMR works without Webpack, Vite, or any frontend build tool
- **Morphing over replacement** — HTML changes morph the body rather than replacing it, preserving scroll position and form state

## When to Use

- Development only — not for production
- Best with the Rails #nobuild approach (importmaps, propshaft)
- If using bundled assets (esbuild, Vite), the file-level reload is less effective since changes produce new bundles
