---
title: "Advanced Stimulus: Composition, Outlets, Reusability, and Lifecycle Hooks"
description: "Complex Stimulus UIs are built by composing small, focused controllers that treat HTML as the source of truth and communicate through shared HTML mutation, custom events, or the Outlets API."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://masterhotwire.com"
  date: "2026-02-01"
tags: [stimulus, javascript, outlets, composition, lifecycle, reusability, advanced]
---

# Advanced Stimulus: Composition, Outlets, Reusability, and Lifecycle Hooks

Complex Stimulus UIs are built by composing small, focused controllers that treat HTML as the source of truth and communicate through shared HTML mutation, custom events, or the Outlets API.

## The Two Core Questions of Complex UIs

- Complex UIs are composed of simpler, reusable parts — like an airplane cockpit made of switches, knobs, and displays; Stimulus scales the same way.
- Two fundamental questions: (1) how to build reusable controllers? and (2) how to combine controllers? — both are connected through the principle of HTML as state.
- The path to composability: configurable controllers → fewer assumptions → smaller focused controllers → multiple controllers on same element → indirect collaboration through HTML → direct collaboration via events or outlets.

## Value Change Callbacks as Reactive State

- Declare typed values with `static values = { count: Number }` and bind them to `data-[controller]-[name]-value` attributes; Stimulus parses, stores, and syncs them bidirectionally with the DOM.
- Define `[name]ValueChanged(current, previous)` to react to value changes — Stimulus calls it both on controller initialisation and on every subsequent DOM attribute change, eliminating the need for manual initialisation logic.
- The value changed callback is only invoked when the value actually changes, preventing unnecessary DOM updates (e.g. a countdown stuck at 0 will not redundantly re-render).
- Controllers using value changed callbacks automatically integrate with Turbo page updates and any other controller that mutates the attribute — the source of the change is irrelevant.
- Anti-pattern: reading values in `connect()` and rendering there; preferred: put all rendering in the value changed callback, keep `connect()` only for wiring side-effects (e.g. starting a `setInterval`).

## Target Connected/Disconnected Callbacks

- `[name]TargetConnected()` and `[name]TargetDisconnected()` callbacks fire when a target element is added or removed from the DOM — use them instead of checking target presence in `connect()`.
- Anti-pattern: guarding setup with `if(this.hasCounterTarget)` in `connect()` — this breaks when the target appears after controller connection.
- Preferred pattern: put setup logic in `counterTargetConnected()` and teardown (e.g. `clearInterval`) in `counterTargetDisconnected()` — the controller no longer crashes if the target is absent and gracefully starts/stops with the target's lifecycle.
- Multiple targets and values handled this way allow the controller to adapt to any combination of present or absent elements automatically.

## The Lifecycle Callback Priority Rule

- `connect()` should be minimal — wiring only (e.g. starting timers, attaching global listeners that cannot go into target callbacks).
- `disconnect()` cleans up anything not already handled by `[name]TargetDisconnected()`.
- Setup belongs in `[name]TargetConnected()`, teardown in `[name]TargetDisconnected()`, rendering/state reactions in `[name]ValueChanged()`.
- This discipline moves source of truth from controller instance fields into the HTML, making the controller stateless and intrinsically compatible with Turbo and other controllers.

## Building Reusable Controllers: Eliminating Assumptions

- Treat HTML as the source of truth: store as little state as possible (ideally none) inside the controller instance; let the DOM hold values.
- Avoid hard-coded values — drive all parameters from Stimulus values declared in HTML; a controller configurable from HTML can be used in far more contexts.
- Stimulus value defaults: define a default when a reasonable one exists so the controller works without any HTML configuration at all.
- Narrow-scoped controllers: prefer controllers that do one focused thing; a smaller surface area has a higher chance of fitting into other contexts.
- Adapt to DOM state: check for element presence and implement graceful degradation (fallback behaviour when elements are missing) even when it is tedious — it pays back over time.
- Unlike Ruby method advice (few side-effects internally), Stimulus reusability focuses on *outward-facing* assumptions: it is acceptable to have substantial internal logic as long as the external requirements on the HTML are minimal.

## Combining Controllers: Indirect Collaboration Through HTML

- The most powerful and low-coupling mechanism: one controller mutates HTML, another reacts via its callbacks — neither is aware of the other.
- Full interaction visibility through DOM inspection; any source of HTML change (Turbo Stream, another controller, vanilla JS) is handled transparently.
- Enabled entirely by the reusability principles — no extra Stimulus API required.

## Combining Controllers: Custom Browser Events

- Dispatch events with `element.dispatchEvent(new CustomEvent("prefix:my-event", { bubbles: true, cancelable: true }))` — always set `bubbles: true` and `cancelable: true` explicitly; the defaults are `false` for custom events, unlike native browser events.
- Scope event names with a short application prefix (e.g. `hot:`, `hb:`) to avoid clashes with browser events and third-party library events, following the same convention Turbo uses with `turbo:`.
- Two ways a controller listens to an event: (1) manual `addEventListener` in `connect()` with matching `removeEventListener` in `disconnect()`; (2) `data-action="hot:my-event->controller#method"` attribute handled automatically by Stimulus.
- Arrow function instance fields preserve `this` without `bind`: `doSomething = (event) => { ... }` — using a regular method requires `this.doSomething.bind(this)` when passing to `addEventListener`.
- Use manual listeners when the controller must react by simply being attached (e.g. a frame-loading animation controller that listens to multiple Turbo events — impossible to misuse).
- Use `data-action` when behaviour should be explicit in HTML and easy to customise (e.g. interactive widgets) — prefer `data-action` by default and migrate to manual listeners only when repeated setup becomes error-prone.

## Combining Controllers: The Outlets API

- Outlets are Stimulus' built-in mechanism for one controller to hold a reference to another controller instance and call methods on it directly — conceptually targets, but for controller instances instead of DOM elements.
- Declare with `static outlets = ["form"]`; reference elements via `data-[identifier]-[outlet]-outlet="[css-selector]"` on the declaring controller's element (e.g. `data-column-form-outlet=".some-css-selector"`).
- Three generated accessors mirror the target API: `this.[name]Outlets` (array of all matching instances), `this.[name]Outlet` (first instance, throws if none), `this.has[Name]Outlet` (boolean guard).
- Unlike targets (scoped to the controller's subtree), outlet CSS selectors are global — `document.querySelectorAll` across the entire page.
- Call any public method on the resolved outlet controller instance directly: `this.formOutlet.remove()`.
- Outlets have `[name]OutletConnected()` and `[name]OutletDisconnected()` callbacks — prefer placing outlet-related logic there rather than in `connect()`/`disconnect()`.
- CSS selector tip: avoid selectors tied to visual CSS classes (they change during redesigns); use attribute selectors like `[data-controller='form']` for robustness.
- Silent failure risk: if an outlet CSS selector matches nothing, Stimulus raises no error or warning — validate selectors carefully when markup changes.

## Choosing the Right Collaboration Mechanism

- Indirect HTML mutation: prefer when functionality is orthogonal — fully decoupled, easy to monitor, best for maintainability; use as the default before reaching for events or outlets.
- Custom events — pros: controllers are unaware of each other; connection is markup-independent; multiple listeners can react to one emission. Cons: harder to trace/debug; event must bubble to a shared ancestor or be listened globally (risking unrelated controllers triggering each other).
- Outlets — pros: easy to debug (calling controller appears higher in the call stack); precise targeting via CSS selector. Cons: calling controller is coupled to the outlet controller's public interface; selector validity is not verified by Stimulus.
- Use events for page-wide significant changes where the emitter does not care about side-effects and multiple unknown listeners may need to react (e.g. online/offline status).
- Use outlets when there is a clear parent-child relationship and the parent must call specific methods on the child (e.g. a list controller calling methods on item controllers).
- Ask: does the emitting controller need to change if nothing listens? If no — event. Does the outlet controller need to change if nothing calls it? If no — outlet.
- OOP intuition applies: these trade-offs mirror classic object-oriented coupling and encapsulation decisions.

## Reusability Principles Summary

- Small and focused beats large and general: a smaller slice of functionality has a higher probability of being reused in other contexts.
- Callbacks over imperative checks: `[name]ValueChanged`, `[name]TargetConnected`, `[name]TargetDisconnected`, `[name]OutletConnected`, `[name]OutletDisconnected` are the primary tools for eliminating setup assumptions.
- HTML configurability via values (with sensible defaults) is the mechanism for making controllers parametric without coupling to specific markup structure.
- Graceful degradation — checking DOM state and providing fallback behaviour — is a discipline worth the initial cost; it compounds in reusability over time.
- The result of consistent application: a library of small, composable controllers that combine like hardware components — adding new features often means reusing or re-combining existing controllers rather than building from scratch.
