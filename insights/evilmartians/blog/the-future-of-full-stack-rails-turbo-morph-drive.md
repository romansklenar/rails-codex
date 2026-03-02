---
title: "The Future of Full-Stack Rails: Turbo Morph Drive"
description: "Implementing DOM morphing with Idiomorph in Turbo 7 to fix scroll, animation, and Stimulus lifecycle issues before Turbo 8's native Page Refresh feature"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/the-future-of-full-stack-rails-turbo-morph-drive"
  date: '2023-10-16'
tags: [turbo, hotwire, rails, morphing, idiomorph, stimulus, dom, websockets]
---

# The Future of Full-Stack Rails: Turbo Morph Drive

This article implements a custom morphing-based Turbo rendering strategy using Idiomorph in Turbo 7, addressing scroll, CSS animation, and Stimulus lifecycle regressions that full DOM-swap navigation causes.

## Why Morphing Matters

- Turbo Drive default: replaces entire `<body>` with new HTML on every navigation
- Full swap loses all browser-side state: scroll position, CSS animation progress, focus, input field content
- Morphing performs an incremental diff-and-patch of the existing DOM, preserving unchanged nodes
- Used in production by Phoenix LiveView and StimulusReflex for years; Turbo 8 adopts it via the `refresh` Turbo Stream action
- Demo app: Turbo Music Drive — a Rails 7.1 music library/player app at `turbo-music-drive.fly.dev`

## Choosing Idiomorph

- Alternatives include `morphdom`, but `idiomorph` is the morphing library chosen for Turbo 8 internals
- Idiomorph offers improvements over morphdom, particularly around element matching heuristics
- Turbo 7's `turbo:before-render` event allows injecting a custom render function via `event.detail.render`

## Basic Morphing Integration

- Override Turbo's render via `document.addEventListener("turbo:before-render", ...)` and set `event.detail.render`
- Required async hack for Turbo caching compatibility: `await new Promise((resolve) => setTimeout(() => resolve(), 0))` before calling `Idiomorph.morph`
- Without the async tick, Turbo's page preview caching breaks
- After basic morphing: horizontal scroll is preserved, but vertical scroll is still reset by Turbo's own `scrolled` flag

## Fixing Scroll Position

- Turbo resets scroll to zero on each navigation regardless of morphing
- Workaround: track previous path and set `Turbo.navigator.currentVisit.scrolled = true` when path has not changed
- Key line: `Turbo.navigator.currentVisit.scrolled = prevPath === window.location.pathname`
- Signals Turbo not to reset scroll when only the query string changes (e.g., filter updates)
- Store `prevPath = window.location.pathname` at the start of each `turbo:before-render` callback

## Debugging DOM Updates with CSS

- Debug which elements are re-rendered using a CSS highlight animation on every node insertion
- CSS technique: `@keyframes highlight { 0% { outline: 1px solid red; } 100% { outline: 0; } }` applied globally to `*`
- Reveals that `data-turbo-permanent` elements still re-mount on every render cycle despite morphing
- Root cause: Turbo removes permanent elements before rendering and re-inserts them afterward; CSS animations restart because the element is re-added to the DOM

## Handling Permanent Elements with Morphing

- Replace `data-turbo-permanent` with custom `data-morph-permanent` for morphing-controlled permanence
- Pass a `beforeNodeMorphed` callback to `Idiomorph.morph` to skip morphing permanent nodes
- If `fromEl.hasAttribute("data-morph-permanent") && toEl.hasAttribute("data-morph-permanent")`, return `false` to skip
- `return false` from `beforeNodeMorphed` tells Idiomorph to leave the element completely untouched
- In Turbo 8, `data-turbo-permanent` will work interchangeably in both replace and morph modes

## Morphing Turbo Frames

- Turbo Frames require a separate event listener: `turbo:before-frame-render`
- Use `morphStyle: "innerHTML"` since frame updates replace only the frame's children, not the frame element itself
- Call `Idiomorph.morph(prevEl, newEl.children, { morphStyle: "innerHTML" })` in the render override
- Fixes Stimulus controllers attached to frame child elements that would otherwise be re-created

## Writing Morphing-Aware Stimulus Controllers

- Controllers relying on `connect()` / `disconnect()` break with morphing: the element is never replaced, only its attributes change
- Two options: restart controllers after morph (Turbo 8 default), or react to attribute changes using Stimulus `values` callbacks
- Preferred: use value change callbacks, e.g. `endValueChanged(_newValue, oldValue)` for `data-animated-number-end-value`
- Also update `startValue` to the previous value so animation starts from current position rather than zero
- Value callbacks leverage morphing's precision — only the changed attribute triggers the callback

## Broadcasting Refresh Streams

- Implement the `refresh` Turbo Stream action (Turbo 8 preview) manually in Turbo 7 via `StreamActions.refresh`
- Avoid re-rendering the originating user's page using a session ID header: `X-Turbo-Session-ID`
- Store session ID via `around_action` in `ApplicationController`, saved to `Current.turbo_session_id`
- Broadcast from models using an `after_commit` hook that calls `Turbo::StreamsChannel.broadcast_stream_to`
- Session ID embedded in the Turbo Stream action tag prevents triggering a page visit for the requesting user

## Turbo Morph Drive vs. Turbo 8 Page Refresh

- Turbo 8 does not enable morphing for all navigations — only for explicit `refresh` Turbo Stream actions
- Two different rendering modes within one app risks developer confusion and limits Stimulus morphing benefits
- Author recommends morphing globally (not just on refresh) for consistency and full value callback benefits
- The custom Turbo Morph Drive applies to all `turbo:before-render` events; Turbo 8 scopes morphing to `refresh` action only
