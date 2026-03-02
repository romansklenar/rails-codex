---
title: "Turbo Morphing"
description: "Page morphing for minimal DOM changes, Turbo Cache snapshots/previews, flashing fixes"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-morphing, turbo, cache, performance]
---

# Turbo Morphing

Morphing updates the page by computing minimal DOM changes instead of replacing the entire body.

## Enable Morphing
```erb
<%# In layout head, ABOVE yield :head %>
<% turbo_refreshes_with method: :morph, scroll: :preserve %>
<%= yield :head %>
```

## When Morphing Triggers
Morphing only activates when ALL conditions are true:
1. URL remains the same after navigation
2. Navigation action is `replace` (not `advance` or `restore`)
3. Meta tag `turbo-refresh-method="morph"` is present

## Prevent Morphing Specific Elements
```javascript
// app/javascript/application.js
addEventListener("turbo:before-morph-element", (event) => {
  if (event.target.hasAttribute("data-turbo-prevent-morph")) {
    event.preventDefault()
  }
})
```

```erb
<%# Element stays in place during morph, but Turbo Frame updates still work %>
<div data-turbo-prevent-morph id="<%= dom_id(@item, :wrapper) %>">
  <%= render "form", item: @item %>
</div>
```

## Morphing Algorithm Key Points
- Elements matched by `id` attribute - use `dom_id` helper consistently
- `head` section merged (unchanged assets untouched)
- `body` morphed recursively, matching by id then by node type
- Order in `head` may change (order doesn't matter there)

## Debug Morphing
```javascript
addEventListener("turbo:render", (event) => {
  console.log("Rendered with:", event.detail.renderMethod)
})
```

# Turbo Cache

Turbo Cache enables instant back/forward navigation and fast page previews.

## How It Works
1. Turbo stores last 10 page **snapshots** using `cloneNode(true)`
2. Back/Forward buttons restore from cache instantly (no server request)
3. Regular navigation shows cached **preview**, then fetches fresh content

**Critical:** Only HTML is cloned - event listeners and custom state are NOT preserved. Use Stimulus with HTML as source of truth.

## Cache Invalidation
```javascript
// Cache is automatically cleared on form submission (non-GET requests)
// For manual state mutations, clear explicitly:
Turbo.cache.clear()
```

## Opting Out
```erb
<%# Disable all caching for this page %>
<meta name="turbo-cache-control" content="no-cache">

<%# Disable previews only (back/forward still uses cache) %>
<meta name="turbo-cache-control" content="no-preview">
```

```javascript
// Disable cache globally
Turbo.session.history.stop()
```

## Fixing Preview Flashing

Cached state can cause UI to flash (e.g., dropdown opens then closes). Fix by resetting state before caching:

```erb
<%# 1. data-turbo-temporary: element removed before caching %>
<div class="flash-message" data-turbo-temporary>
  Record saved successfully
</div>
```

```javascript
// 2. Stimulus disconnect: clean up when snapshot is taken
disconnect() {
  this.element.classList.remove("open")  // Reset UI state
}

// 3. turbo:before-cache event: global cleanup
addEventListener("turbo:before-cache", () => {
  // Skip animations to end state
  document.querySelectorAll(".animating").forEach(el => {
    el.classList.remove("animating")
  })
})
```

## Cache Key Details
- URL **without anchor** is the cache key
- `<select>` selected values are auto-restored
- Password inputs are cleared for security
- `data-turbo-visit-direction` attribute added to `<html>` (forward/back/none)
