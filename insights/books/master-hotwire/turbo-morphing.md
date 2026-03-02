---
title: "Turbo Morphing and Cache: Minimal DOM Updates and History Navigation"
description: "Turbo Morphing uses the Idiomorph algorithm to apply only the minimal set of DOM changes needed to match a new server-rendered page, while Turbo Cache stores up to 10 page snapshots to make back/forward navigation instant and previews seamless."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://masterhotwire.com"
  date: "2026-02-01"
tags: [turbo-morphing, turbo-drive, cache, morphing, performance, history]
---

# Turbo Morphing and Cache: Minimal DOM Updates and History Navigation

Turbo Morphing uses the Idiomorph algorithm to apply only the minimal set of DOM changes needed to match a new server-rendered page, while Turbo Cache stores up to 10 page snapshots to make back/forward navigation instant and previews seamless.

## What Morphing Is and How to Enable It

- The default page update method (`replace`) swaps the entire `<body>` element; morphing instead diffs old and new body elements and applies only the minimum changes needed to make old match new.
- Benefits of morphing over replace: faster/smoother redraws, user selections and scroll positions are preserved, JS references to unchanged DOM nodes remain valid, and state attached to unchanged nodes is preserved.
- Morphing is analogous to a server-side Virtual DOM — the server holds the canonical UI state and Turbo efficiently bridges the gap, consistent with Hotwire's server-rendering philosophy.
- Enable page morphing globally by adding a `<meta>` tag to `<head>`: `<meta name="turbo-refresh-method" content="morph">`.
- Enable scroll position preservation separately: `<meta name="turbo-refresh-scroll" content="preserve">`.
- Rails helper to set both at once: `<% turbo_refreshes_with method: :morph, scroll: :preserve %>` — must be placed **above** `<%= yield :head %>` in the layout, because `yield :head` renders before placement can affect it; view templates render before the layout, so using the helper in a view template works regardless of position.
- Debug which render method was used: listen to `turbo:render` and inspect `event.detail.renderMethod`.

## When Morphing Triggers

- Morphing only activates on full-page navigation, and only when **both** conditions are true: the new URL is identical to the current URL, and the visit action is `replace`.
- Turbo visit actions: `advance` (link clicks), `replace` (form submission with redirect), `restore` (back/forward button).
- Only `replace` visits trigger morphing — a redirect to a different URL will fall back to the `replace` DOM method even if morphing is enabled.
- Morphing can also be applied to Turbo remote frames (Turbo 8+), where the best-match algorithm becomes more significant since the new content may be a list of elements rather than a single root.

## How Idiomorph Works Under the Hood

- Morphing is powered by the **Idiomorph** library, which Turbo wraps and enhances.
- **Step 1 — Build ID map:** Queries all elements with an `id` attribute (`querySelectorAll('[id]')`), then walks each element's ancestor chain to build a `Map<DOMNode, Set<id>>` — each node maps to the set of all descendant ids. This map drives matching throughout the algorithm.
- **Step 2 — Morph `<head>` first (async):** Head is handled separately because its children rarely have ids, order does not matter, and removing elements causes unnecessary network requests. Uses a merge algorithm: elements present in both old and new are kept; elements only in old are removed; elements only in new are added. Comparison is by full `outerHTML`. The algorithm is async — it awaits `load` events of newly added assets (scripts, stylesheets) before proceeding to body morphing.
- **Step 3 — Find best match for the old top-level element:** Iterates all top-level new-content nodes and scores each: +0.5 for matching node type, +1 per shared id in the ID map; type mismatch gives score 0 regardless of ids. The highest-scoring node is the best match. If no match exists, the old element is removed and the new one inserted.
- **Step 4 — Recursively morph old into best match:** (a) Sync attributes — add missing, remove extra, update changed; attribute listeners are not triggered for unchanged attributes. (b) For each child in new content, find its best match in old content: first look for an id overlap; if none, look for a soft match (same node type), but abandon soft-match search if two subsequent siblings would have matched — morphing two is better than one. (c) If no match: insert new node. If match found: remove intervening old nodes, then recursively morph the matched pair. (d) Repeat for all new children. (e) Remove any remaining old children not matched.
- **Step 5 — Insert surrounding content:** For remote frame morphs, content around the best match is inserted around the newly morphed node to complete the update.
- Algorithm complexity: worst case O(N×M) (old nodes × new nodes), but amortised linear for typical Rails apps.
- After head morphing completes, morphing restarts with the head element ignored in the second pass.

## IDs Are Critical to Morphing Quality

- The ID map is the primary mechanism for matching elements across old and new content — elements without ids rely on soft (type-only) matching, which is weaker.
- Duplicate ids break the algorithm: HTML/CSS tolerate duplicate ids, but Idiomorph does not — ensure ids are globally unique.
- Using `dom_id` Rails helper on model instances (e.g., `id="project-123"`) automatically provides globally unique, stable ids — this directly improves morph quality.
- For lists rendered in remote Turbo frames that behave unexpectedly, adding explicit ids often resolves the issue.
- Do not rely on a specific element always being morphed in-place in non-trivial structures — one extra sibling can cause a different set of elements to be removed/re-added; use more ids if stable identity matters.
- Content reordering: if the same elements appear in a different order, some will be morphed but others will be removed and re-inserted from new content — ids help but do not guarantee in-place morphing for every element.

## `data-turbo-permanent` and Custom Morph Prevention

- `data-turbo-permanent`: any element with this attribute is preserved (not morphed) during any page update, including Turbo Frame updates — too broad when frame updates still need to apply (e.g., showing validation errors).
- For fine-grained control, use the `turbo:before-morph-element` event: fired just before each element is morphed; calling `event.preventDefault()` leaves that element untouched during full-page morph while still allowing Turbo Frame updates to proceed normally.
- Custom `data-turbo-prevent-morph` pattern: add a JS listener that calls `event.preventDefault()` when `event.target.hasAttribute("data-turbo-prevent-morph")`; mark elements in templates with that attribute.
- Elements preserved via `turbo:before-morph-element` must have a stable `id` matching the element in the new page, so the algorithm identifies them as the same node and skips morphing rather than remove-and-reinsert.
- Structural consistency matters: ensure the surrounding DOM structure (number of child nodes under a parent) is the same in old and new content so the algorithm does not insert unwanted nodes around the preserved element.

## Page Morphing vs Frame Morphing vs Stream Morph Action

- **Page morphing:** full-page refresh using `replace` visit action + `turbo-refresh-method: morph` meta tag; replaces entire body with minimal diff.
- **Frame morphing (Turbo 8 remote frames):** morphing applied to a specific `<turbo-frame>` element; new content may be a list of nodes, making the best-match algorithm more relevant.
- **Turbo Streams `morph` action:** a Turbo Stream action type that applies Idiomorph morphing to a targeted element on the page; used for targeted server-push updates rather than full-page refresh.

## When Morphing Breaks and How to Fix It

- Morphing can interact unexpectedly with third-party JS libraries or app UI logic that attaches state directly to DOM nodes — understanding the algorithm lets you diagnose and fix such cases.
- If a complex list is behaving strangely during morph (wrong elements updated), add ids to its items; the algorithm will then match by id rather than by position.
- Head morph caveat: newly added large assets (scripts, stylesheets) block body morphing until their `load` events fire — avoid introducing heavy assets in pages being morphed to.
- No performance cost for head elements that remain unchanged between pages — front-loading all assets into the shared layout is a reasonable strategy; test and profile to confirm.
- Content-before-assets: page body content is not morphed until new `<head>` assets have loaded — this can cause a visible delay if new heavy assets are introduced mid-session.

## Performance Tradeoffs and the Hotwire Ladder

- Morphing saves browser rendering/layout work even though the JS morphing algorithm does more computation than a plain replace.
- The server does more rendering work with full-page morphing than an SPA would — acceptable for small/simple apps, but may need addressing as complexity grows.
- Hotwire provides a progressive cost/benefit ladder: (1) Turbo Drive + morphing — minimal dev time, full page re-render; (2) Turbo Frames — decompose the page, scope refreshes; (3) Turbo Stream Actions — precise server-push updates; (4) Stimulus — lightweight client-side logic; (5) full frontend framework for highly interactive isolated components, optionally via an API.
- The ladder means development effort can be focused where it has the most impact; simpler parts are handled cheaply by morphing.

## Turbo Cache: How It Works

- Turbo Drive intercepts all navigation and takes control of browser history; it must therefore also manage caching of previously visited pages to emulate native back/forward speed.
- As pages are visited, Turbo creates **snapshots** — clones of the `<body>` element — and stores them in a `SnapshotCache` keyed by URL (anchors stripped, so `page#section` and `page` share one cache entry).
- Snapshots are stored as a sorted JS array; the most recently used entry is always at the front; the array is trimmed to a fixed maximum of **10 entries** (not configurable as of current Turbo version).
- Snapshots are created with `cloneNode(true)` — deep HTML clone only; event listeners and JS state attached to DOM nodes are **not** carried over; Stimulus controllers are disconnected on clone (their `disconnect` callback fires), which is an opportunity to clean up temporary state.
- Turbo Cache is a feature of Turbo Drive; it does not function if Drive is disabled.

## Cache Key and Snapshot Creation Trigger

- Cache key = URL **without** anchor fragment; navigating between `#section-1` and `#section-2` on the same page uses a single cache entry.
- A snapshot is stored only when `shouldCacheSnapshot` is `true`, which is `true` only for GET requests; non-GET requests set this to `false`.
- When `shouldCacheSnapshot` is `false`, the Navigator **clears the entire cache** before starting the visit — this is the mechanism by which form submissions invalidate all cached pages.
- The cache-invalidation principle is **"read your own writes"**: the user will never see their own stale mutations, but changes made by other users are not guaranteed to be reflected (consistent with normal browser back/forward expectations).
- If server state is mutated outside of a form submission (e.g., custom fetch, non-Turbo request), manually invalidate the cache with `Turbo.cache.clear()`.
- Snapshot creation (`cacheSnapshot`) is **async** and not awaited — it does not block page rendering, so cache cleanup logic does not need to be micro-optimised for speed.

## Preview Pages

- When navigating forward to a URL already in the cache, Turbo shows the cached snapshot immediately as a **preview** and simultaneously issues a fresh server request.
- When the server response arrives, the page is updated with fresh content (rendered as a normal page load / refresh).
- Previews mean the page can visibly change after it has already appeared — acceptable because: (a) it only happens when *another* user mutated state (own writes clear the cache); (b) it looks like a live Turbo broadcast update to the current user.
- Back/forward navigation does **not** trigger a follow-up server request — the cached snapshot is simply restored.
- To disable previews for specific pages while keeping back/forward caching: `<meta name="turbo-cache-control" content="no-preview">`.
- Scroll position is restored on back/forward navigation (stored via `restorationIdentifier` attached to browser history state) but is **not** restored for preview navigations.

## Cache Restoration and `data-turbo-visit-direction`

- Turbo listens to the browser `popstate` event; it prevents default browser behaviour and implements its own restoration using the snapshot cache.
- Direction detection: Turbo stores a `restorationIndex` in browser history state; comparing the stored index with the currently rendered page's index reveals whether navigation is forward or backward.
- `data-turbo-visit-direction` attribute is set on `<html>` during navigation with values `forward`, `back`, or `none` — useful for CSS view transition animations.
- `historyPoppedToLocationWithRestorationIdentifierAndDirection` is the Turbo source method that orchestrates restore visits after `popstate` fires.

## Controlling Caching

- Disable Turbo cache entirely for a page: `<meta name="turbo-cache-control" content="no-cache">` — Turbo always goes to the server for this page; no snapshot is stored or restored.
- Disable only preview rendering while keeping back/forward cache: `<meta name="turbo-cache-control" content="no-preview">`.
- Disable cache globally for all pages: `Turbo.session.history.stop()`.

## The Flashing Problem and How to Fix It

- **Root cause:** a snapshot captures the current DOM state including transient UI state (open dropdowns, applied CSS classes, animations mid-flight); when restored as a preview, this transient state is visible briefly before the fresh server response replaces it, causing a visible flash.
- Fix strategy: ensure the cached snapshot matches the server's default state by removing transient UI state **before** caching occurs.
- **`data-turbo-temporary`** attribute: elements with this attribute are automatically removed from the HTML before it is cached — best for truly ephemeral elements like flash messages ("Record saved", "You are logged in").
- **Stimulus `disconnect` callback:** when a snapshot is created, Stimulus controllers are disconnected (because `cloneNode` removes nodes from the live DOM, triggering `disconnect`); use `disconnect` to collapse menus, hide tooltips, reset CSS classes — if already following Stimulus best practices of cleaning up in `disconnect`, this is largely handled automatically.
- **`turbo:before-cache` event:** fires just before caching; subscribe to perform app-wide cleanup (e.g., skip animations to end state, remove transient classes); `data-turbo-temporary` is itself implemented as an observer of this event.
- **Opt out of caching/preview:** use `no-cache` or `no-preview` meta tag as a last resort for pages where transient state cannot be cleanly removed.

## Additional Cache Details

- `<select>` elements lose their selected option on clone; Turbo automatically resets all selects after cloning.
- `<input type="password">` values are cleared before caching for security purposes.
- Snapshots are stored in browser memory (JavaScript array), not in `localStorage` or `sessionStorage`.
- Because `cacheSnapshot` is async, cache cleanup logic (e.g., in `turbo:before-cache`) does not block rendering and can be moderately complex without performance impact.
- HTML as the source of truth (no hidden JS-only state) is the single most effective strategy for avoiding both morphing glitches and cache flash problems — Stimulus's HTML-first conventions align naturally with this requirement, and the same principle that makes Turbo page updates work well also makes Turbo Cache work well.
