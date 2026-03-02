---
title: "Turbo Data Attributes & Meta Tags"
description: "All data attributes, meta tags, and auto-set attributes quick reference"
source:
  type: documentation
  title: "Turbo Handbook"
  author: "Hotwire / Basecamp"
  url: "https://turbo.hotwired.dev"
tags: [turbo, attributes, reference]
---

# Turbo Data Attributes & Meta Tags

Quick reference for all Turbo HTML attributes and meta tags.

## Data Attributes

| Attribute | Values | Purpose |
|-----------|--------|---------|
| `data-turbo` | `"false"` / `"true"` | Disable/enable Turbo Drive; nestable |
| `data-turbo-action` | `"advance"` / `"replace"` | History action for links/frames |
| `data-turbo-frame` | frame ID / `"_top"` / `"_self"` | Override navigation target |
| `data-turbo-stream` | (presence) | Enable Turbo Streams on GET requests |
| `data-turbo-method` | HTTP verb | Change link HTTP method (creates hidden form) |
| `data-turbo-confirm` | message text | Show confirmation before action |
| `data-turbo-submits-with` | text | Replace element text during submit |
| `data-turbo-permanent` | (presence) + unique `id` | Persist element across page loads |
| `data-turbo-temporary` | (presence) | Remove element before caching |
| `data-turbo-preload` | (presence) | Pre-fetch link content into cache |
| `data-turbo-prefetch` | `"false"` | Disable hover prefetch for link |
| `data-turbo-track` | `"reload"` / `"dynamic"` | Asset change detection |
| `data-turbo-eval` | `"false"` | Prevent inline script re-evaluation |
| `data-turbo-prevent-morph` | (presence) | Exclude from morph updates |
| `download` | (presence) | Opt out of Turbo entirely |

## Meta Tags

| Name | Content | Purpose |
|------|---------|---------|
| `turbo-cache-control` | `"no-cache"` / `"no-preview"` | Page caching control |
| `turbo-visit-control` | `"reload"` | Force full page reload |
| `turbo-root` | path prefix | Scope Turbo to URL path |
| `turbo-refresh-method` | `"morph"` | Use morphing on page refresh |
| `turbo-refresh-scroll` | `"preserve"` | Keep scroll position on refresh |
| `turbo-prefetch` | `"false"` | Disable all prefetching site-wide |
| `view-transition` | `"same-origin"` | Enable View Transition API |
| `csrf-token` | token | CSRF token auto-injected by Turbo |

## Auto-Set Attributes (by Turbo)

| Attribute | Element | When |
|-----------|---------|------|
| `disabled` | form submitter | During submission |
| `data-turbo-preview` | `<html>` | Showing cached preview |
| `data-turbo-visit-direction` | `<html>` | `"forward"` / `"back"` / `"none"` |
| `aria-busy="true"` | `<html>`, `<form>`, `<turbo-frame>` | During navigation/submission |
| `complete` | `<turbo-frame>` | Navigation finished |

## Asset Tracking
```html
<!-- Reload page if asset fingerprint changes -->
<link rel="stylesheet" href="/app-abc123.css" data-turbo-track="reload">

<!-- Remove element if absent from new page (CSS only, not scripts) -->
<style data-turbo-track="dynamic">...</style>
```

## Ignored Paths
URLs with `.` in final path component are ignored (e.g., `/files/doc.pdf`) unless ending in `.htm`, `.html`, `.xhtml`, `.php`.
- Workaround: add trailing `/`
- `data-turbo="true"` does **not** override ignored paths
