---
title: "Turbo Drive: Navigation, Prefetching, and Legacy Migration"
description: "Turbo Drive intercepts link clicks and form submissions to replace only the changed parts of a page, delivering near-instant navigation without full page reloads, and can be adopted incrementally in legacy applications."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-drive, turbo, prefetching, cache, navigation, legacy-migration]
---

# Turbo Drive: Navigation, Prefetching, and Legacy Migration

Turbo Drive intercepts link clicks and form submissions to replace only the changed parts of a page, delivering near-instant navigation without full page reloads, and can be adopted incrementally in legacy applications.

## Role and Startup

- Turbo Drive intercepts link clicks and form submissions with `event.preventDefault()`, then issues its own `fetch` request instead of letting the browser navigate normally.
- On page load, Turbo calls `Turbo.start()` — equivalent to `Turbo.session.start()` — which activates three observers: `LinkClickObserver`, `FormSubmitObserver`, and `FormLinkClickObserver`; all other objects are passive until this call.
- `Turbo.session` is the central object holding all page-level state; almost all Turbo Drive functionality is rooted there.
- The speed improvement comes from avoiding redundant asset re-parsing: unchanged CSS and JS assets between pages are never touched because the `<head>` is diffed, not replaced.

## Head and Body Update Mechanics

- The `<body>` is replaced in full with the new response body (default, non-morphing mode).
- The `<head>` is diffed node-by-node: identical nodes are left untouched, nodes absent from the new content are removed, and new nodes are inserted.
- Head element order is ignored during diffing; the final head order may differ from the payload, but the relative order of scripts that depend on each other is preserved because previously evaluated scripts are already in place.
- Leaving unchanged `<head>` assets untouched is the primary source of Turbo Drive's speed improvement — they are not re-parsed or re-executed.
- Scripts must be in `<head>`, not `<body>`, for the head-diffing to work; placing JS in `<body>` was historically justified but is no longer necessary due to the `async` attribute, HTTP/2 parallel downloads, and modern browser efficiency.

## LinkClickObserver — Intercepting Link Clicks

- `LinkClickObserver` attaches a single global `click` listener on `window`; for every click it locates the nearest `<a>` ancestor and decides whether to intercept.
- A link is intercepted only when all three conditions are true: Turbo is enabled on the element, the `href` is same-origin, and application code has not called `preventDefault()` on the `turbo:click` event.
- `data-turbo` can be nested: `data-turbo="false"` on a parent disables Drive for all descendants; `data-turbo="true"` on a child re-enables it; the nearest ancestor attribute wins.
- Cancelling the `turbo:click` event prevents Turbo from handling navigation but does NOT prevent the browser from navigating — to stop navigation entirely, cancel the native `click` event.
- When a link passes all checks, Turbo calls `Turbo.visit(location)` — the same public API method available for programmatic use.
- `Turbo.visit(location)` is the central public function of Turbo Drive and can be called directly from custom JavaScript to trigger Turbo navigation without simulating a click.

## FormSubmitObserver — Form Submissions

- `FormSubmitObserver` catches all form submissions; the actual submission logic is delegated to the `FormSubmission` class.
- Lifecycle order on submit: show confirmation dialog → serialise fields with the native `FormData` object → set `X-CSRF-Token` header → disable the submitter element → execute `fetch` → process response.
- The `X-CSRF-Token` header is set automatically by Turbo; for manual `fetch` calls use the Rails Request.JS library or set the header manually.
- The submitter (submit button) is disabled for the duration of the submission to prevent double-clicks; it is re-enabled when the submission ends.
- `turbo:submit-start` fires when submission begins; `turbo:submit-end` fires when it ends; both expose the submitter via `event.detail.formSubmission.submitter`.
- A successful form submission must issue a redirect; if the server returns a 2xx body without redirecting, Turbo throws an error.
- For failed validations render with `status: :unprocessable_entity` (422); Turbo renders the 4xx response body directly without requiring a redirect.
- If the response `Content-Type` is `text/vnd.turbo-stream.html`, `FormSubmitObserver` automatically processes embedded Turbo Stream actions from the response.

## FormLinkClickObserver — Non-GET Links

- `FormLinkClickObserver` scopes `LinkClickObserver` to links that have `data-turbo-method` or `data-turbo-stream` attributes.
- Under the hood it constructs a hidden `<form>` in memory, copies the link's URL and method onto it, inserts it into `document.body`, submits it, and removes it when submission completes.
- Because it submits a real form, all `FormSubmitObserver` rules apply: CSRF handling, redirect requirement on success, 422 for errors, and `turbo:submit-*` events.
- Rails helper: `link_to "Delete", ticket, data: { turbo_method: :delete }`.

## Confirmation Dialogs

- `data-turbo-confirm="message"` on a link or form shows a system confirmation dialog before proceeding.
- Works on forms and on links with `data-turbo-method`; does not work on plain GET links unless `data-turbo-method="get"` is also added.
- Override the default system dialog: `Turbo.config.forms.confirm = function(message, formElement, formSubmitter) { ... }` — must return a `Promise` resolving to `true` (proceed) or `false` (cancel).

## Link Prefetching

- Turbo prefetches links on `mouseenter` after a 100ms hover delay, so the server response may already be in flight or complete before the user finishes clicking.
- Typical human decision-to-click time is 300ms+ (P300 response); in practice 500–800ms, often enough for even heavy pages to finish loading before the click registers.
- Prefetch fires only after 100ms of continuous hover; `mouseleave` within 100ms cancels the pending `setTimeout` callback and no request is sent — prevents rapid-fire requests when the cursor sweeps across many links.
- Only GET links are prefetched; non-GET links, anchor links, turbo-stream links, and links with confirmation dialogs are excluded.
- The result is stored in `PrefetchCache`, which holds at most one in-flight prefetch at a time; a new `mouseenter` cancels the previous prefetch before starting a new one.
- Prefetch intercepts the `turbo:before-fetch-request` event and replaces the not-yet-started fetch with the already-executing or completed prefetch `Promise`, avoiding two server calls even for superhumanly fast clickers.
- Because the cached result is a `Promise`, Turbo `await`s it regardless of whether it has already resolved — no special branching needed.
- Turbo sets the `X-Sec-Purpose: prefetch` request header on prefetch requests; backend code can inspect this to skip expensive side-effects on prefetch-only hits.
- The entire prefetch feature is implemented purely by hooking into `turbo:before-fetch-request` (a public event), demonstrating that extensions to Turbo Drive can be built without patching Turbo source.
- Only GET requests should be idempotent; with prefetching this becomes mandatory — a non-idempotent GET endpoint can be triggered by hover alone.

## Disabling and Scoping Turbo Drive

- Disable Drive globally: set `Turbo.session.drive = false` in `application.js`.
- Disable the history cache: `Turbo.session.history.stop()`.
- Make form handling opt-in rather than opt-out: `Turbo.setFormMode("optin")` — forms must then explicitly set `data-turbo="true"` to be intercepted.
- Disable or enable Drive on a section: `data-turbo="false"` / `data-turbo="true"` on any element; the nearest ancestor attribute wins; nesting is supported.
- Scope Drive to a URL path: `<meta name="turbo-root" content="/some/path">` — Drive is active only for links under that path, everything else uses full page loads.
- Drive is automatically active inside Turbo Frames regardless of surrounding page settings.

## UJS Replacement

- Turbo Drive replaces all four behaviours provided by Rails UJS: non-GET links (`data-turbo-method`), confirmation dialogs (`data-turbo-confirm`), async fetch-based form submission, and automatic submit-button disabling.
- Async form submission is the default in Turbo (opt-out) vs. opt-in in UJS.
- Submit-button disabling is automatic for every Turbo-handled form with no extra attributes required.

## Legacy Migration Strategy

- Start by installing Turbo but disabling everything: `Turbo.session.drive = false`, `Turbo.session.history.stop()`, `Turbo.setFormMode("optin")` — this leaves the library dormant and prevents interference with existing code.
- Avoid a big-bang rewrite; migrate incrementally so every step delivers value and the project remains worthwhile even if migration is paused indefinitely.
- Turbo Frames, Streams, and Stimulus make no page-level assumptions and are safe to introduce to any isolated part of the UI without enabling Drive.
- Turbo Frames are an especially safe intermediate step: all Turbo features are enabled inside a Frame, actions are scoped to the frame, and Drive's page-lifecycle takeover is not required.
- Recommended migration sequence (stop at any step and still have net value):
  1. Introduce Turbo Frames, Streams, and Stimulus on isolated UI sections — no page-level side-effects.
  2. Expand Frame usage; remove `data-turbo="false"` exceptions inside Frames to fully enable Turbo within them.
  3. Move `<script>` and `<style>` tags from `<body>` to `<head>`; use `async` on scripts where blocking is a concern.
  4. Selectively enable Drive on sections of the page using `data-turbo="true"/"false"`.
  5. Enable Drive on full pages; use `<meta name="turbo-root">` to scope Drive to a subsection of the site.
  6. Enable full-page morphing selectively on pages that are ready.
  7. Enable Turbo Drive globally — migration complete.
- Prioritise areas to migrate in this order: (1) areas with new features planned soon — maximises ROI; (2) areas with high current development pain — same migration cost, higher payoff; (3) areas with uncertain future evolution — refactoring increases optionality and the value of the code itself.
- Treat migration as an investment: front-load benefit by migrating high-ROI areas first and measure each step against expected return.
