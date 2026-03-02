---
title: "Stimulus: Improving UX with Controllers, Targets, Values, and Actions"
description: "Stimulus augments server-rendered HTML with just enough JavaScript behavior by wiring DOM events to controller methods, keeping HTML as the single source of truth for application state."
source:
  type: book
  title: "Master Hotwire"
  author: "Radan Skorić"
  url: "https://masterhotwire.com"
  date: "2026-02-01"
tags: [stimulus, javascript, targets, values, actions, ux, controllers]
---

# Stimulus: Improving UX with Controllers, Targets, Values, and Actions

Stimulus augments server-rendered HTML with just enough JavaScript behavior by wiring DOM events to controller methods, keeping HTML as the single source of truth for application state.

## Philosophy and Design

- Stimulus does not render HTML — it augments existing HTML with behavior, unlike React or Vue which own the rendering layer
- Designed as a modest framework: no virtual DOM, no component state, no separation from the browser's native model
- Mental model: a nicer jQuery that is actually maintainable, because structure lives in HTML rather than scattered JS
- Core principle — HTML is the source of truth: a well-designed controller reacts gracefully to DOM changes from any source (Turbo Frame loads, Stream actions, other controllers, unrelated libraries)
- A controller should not care what else is modifying its element's DOM subtree; it observes and reacts, it does not own
- Orthogonal concerns compose cleanly when each piece respects the DOM as shared state

## Controller Basics

- A Stimulus controller is a JavaScript class that extends the base `Controller` from `@hotwired/stimulus`
- File naming convention: `app/javascript/controllers/form_controller.js` → controller name `"form"` (Rails infers the name automatically from the filename)
- Manual registration without Rails magic: `Stimulus.register("form", class extends Controller { ... })`
- Starting the application: `window.Stimulus = Application.start()` — Rails handles this automatically via import map or bundler
- A controller only comes to life when connected to a DOM element via `data-controller="name"`:
  ```html
  <div data-controller="form">...</div>
  ```
- `this.element` — the DOM element the controller instance is connected to; available in every method
- Multiple independent instances can coexist; each `data-controller` element gets its own isolated instance
- Place `data-controller` on a wrapper element, not necessarily the form/widget itself, to define the correct scope boundary

## Lifecycle Callbacks

- `initialize()` — called exactly once when the controller class is first instantiated; use for logic independent of connection state; do NOT assume `this.element` is live
- `connect()` — called each time the controller is connected to a DOM element; primary place for setup logic; can fire multiple times if the element is removed and re-added (e.g., by Turbo Frame navigation)
- `disconnect()` — called when the controller is disconnected from the DOM; use to tear down event listeners and timers set up in `connect()`
- Lifecycle order on first attach: `initialize` → `connect`; on re-attach of existing instance: `connect` only; on removal: `disconnect`
- Prefer `connect` over `initialize` for setup — `initialize` is rarely needed

## Actions API

- Action descriptor format: `event->controllerName#methodName`
  ```html
  <button data-action="click->form#remove">Cancel</button>
  ```
- When the event fires, Stimulus walks up the DOM from the element to find the nearest ancestor with a connected instance of the named controller, then calls the method — no explicit binding required
- `event->controller#method` is the minimal form; richer syntaxes exist for common cases
- Keyboard shorthand: `keydown.esc->modal#close` — filters events by key name, eliminating manual `event.key` checks in the handler
- Global event capture: append `@window` or `@document` — e.g., `resize@window->board#resize`; prefer local events when possible, global only as a last resort (harder to maintain)
- Event options via colon suffix: `click->modal#open:stop` calls `event.stopPropagation()` automatically before invoking the method; `:prevent` calls `preventDefault()`
- Action parameters: `data-action="modal#open" data-modal-title-param="My Title"` — accessible in the handler as `event.params.title`; Stimulus maps `data-[controller]-[param-name]-param` attributes automatically
- Action methods receive the native DOM `Event` object as their argument

## Targets API

- Targets are specially annotated child elements inside the controller element, providing named references without manual `querySelector` calls in controller code
- Declare expected targets as a static array:
  ```js
  static targets = ["draggable", "dropzone"]
  ```
- Annotate elements in HTML using `data-[controller]-target="name"`:
  ```html
  <div data-drag-target="draggable" draggable="true">...</div>
  <div data-drag-target="dropzone">...</div>
  ```
- Stimulus auto-generates three accessors per declared target name:
  - `this.[name]Target` — first matching element (throws if absent)
  - `this.[name]Targets` — array of all matching elements
  - `this.has[Name]Target` — boolean guard; use for optional targets before accessing `.Target`
- **Target connected callback**: `[name]TargetConnected(element)` — called for each target when the main element connects AND whenever a new matching target is added to the DOM later (e.g., via Turbo Frame)
- **Target disconnected callback**: `[name]TargetDisconnected(element)` — symmetric cleanup hook; use to remove listeners attached in the connected callback
- Target callbacks are more robust than `connect()` for per-element listener setup: they fire for dynamically inserted targets, not just targets present at initial connection time
- Pattern — attach per-element event listeners in target callbacks, not in `connect()`:
  ```js
  dropzoneTargetConnected(element) {
    element.addEventListener("dragover", (event) => event.preventDefault())
    element.addEventListener("drop", this.drop)
  }
  ```
- `connect()` fires only once for the controller element; target callbacks fire once per target, including future targets — making them the correct hook for dynamic UIs

## Values API

- Values are typed controller properties backed by `data-` attributes, providing a structured way to pass configuration from HTML to a controller without manual attribute reads
- Declare values as a static object with types:
  ```js
  static values = {
    url: String
  }
  ```
- Available types: `Array`, `Boolean`, `Number`, `Object`, `String` — each has a sensible default when the attribute is absent (empty string, false, 0, empty object, empty array)
- HTML attribute naming convention: `data-[controller]-[valueName]-value`:
  ```html
  <a data-controller="modal" data-modal-url-value="/modal">open</a>
  ```
- Access in controller: `this.urlValue` — Stimulus handles type coercion automatically (JSON parse for Array/Object types)
- Change callbacks: `[valueName]ValueChanged(value, previousValue)` — fires on initial connect AND whenever the attribute changes; enables reactive behavior without manual observation
- Two-way binding: assigning `this.urlValue = "/new"` in JS updates the DOM attribute; changing the attribute in the DOM updates `this.urlValue`
- Explicit default override syntax: `static values = { count: { type: Number, default: 0 } }`

## HTML as Source of Truth — State Management

- Do not store mutable UI state in controller instance variables when it can live in the DOM instead; instance variables vanish on disconnect
- Store URLs, IDs, and state values in `data-` attributes on the relevant element:
  ```html
  <div data-change-state-url="<%= update_state_ticket_path(ticket) %>">...</div>
  <div data-ticket-state="<%= state %>">...</div>
  ```
- Read state during event handling from `event.currentTarget.dataset`:
  ```js
  const url = event.currentTarget.dataset.changeStateUrl
  const state = event.currentTarget.dataset.ticketState
  ```
- Use `event.dataTransfer.setData` / `getData` to pass ephemeral data across a `dragstart`→`drop` sequence without controller-level instance variables
- Keeping data in the DOM means Turbo morphing, Stream updates, and server re-renders automatically keep JS state in sync with no extra code

## Practical UX Pattern: Cancel Button for Inline Forms

- Problem: Turbo Frame replaces content to show an inline form; user needs a way to dismiss it without a server round-trip
- Solution: wrap the form in a `data-controller="form"` div, add a Cancel button with `data-action="click->form#remove"`
- Controller implementation:
  ```js
  remove() {
    this.element.remove()  // removes the wrapper div, leaving an empty Turbo Frame
  }
  ```
- Empty Turbo Frame is ready to receive a fresh form on the next "New" click — no page refresh, no server request
- This demonstrates the correct division: Turbo for server-driven navigation, Stimulus for client-side DOM manipulation

## Practical UX Pattern: Drag and Drop Between Kanban Columns

- Attach a single `data-controller="drag"` on the outer wrapper containing all columns and tickets — one controller instance manages all drag interactions
- Mark draggable items with `draggable="true"` + `data-drag-target="draggable"` + `data-action="dragstart->drag#start"`
- Mark drop zones with `data-drag-target="dropzone"` on each column element; also store `data-ticket-state` on the column
- Wire `dragover`/`drop` listeners in `dropzoneTargetConnected` so dynamically added columns (e.g., via Turbo) are covered automatically
- Must call `event.preventDefault()` on `dragover` for the `drop` event to fire — native browser requirement
- Store the update URL in `data-change-state-url` on the draggable element; transfer it to the drop handler via `dataTransfer`:
  ```js
  start(event) {
    event.dataTransfer.setData("changeStateUrl", event.currentTarget.dataset.changeStateUrl)
  }

  drop = (event) => {
    event.preventDefault()
    const changeStateUrl = event.dataTransfer.getData("changeStateUrl")
    const state = event.currentTarget.dataset.ticketState
    // submit the state change ...
  }
  ```
- Keep extra data attributes on the same elements already marked as targets to minimize DOM traversal

## Making POST Requests from Stimulus (Turbo Integration)

- Turbo does not expose a programmatic POST navigation API — `Turbo.visit` is GET only; adding POST support was explicitly declined by the maintainers
- Official workaround: construct an invisible form and submit it programmatically
- Simpler equivalent: create a hidden `<a>` with `data-turbo-method="post"`, append to body, `.click()`, then `.remove()`:
  ```js
  const link = document.createElement('a')
  link.setAttribute('href', `${changeStateUrl}?state=${state}`)
  link.setAttribute('data-turbo-method', 'post')
  link.style.display = 'none'
  document.body.appendChild(link)
  link.click()
  link.remove()
  ```
- Under the hood, Turbo intercepts the click, constructs an actual hidden form, and submits it — the visible link is just a trigger
- Alternative: `requestjs-rails` gem (official 37signals gem) wraps the Fetch API to work with Rails CSRF, redirects, and Turbo Streams; lower level, requires more manual wiring

## Optimistic Updates vs. Server-Authoritative UI

- Turbo's default flow: wait for server redirect → morph the page — a small visible delay between user action and DOM update
- SPA optimistic update: apply the DOM change immediately, then confirm or roll back based on the server response
- Turbo advantage on failure: if the update fails, the morphed page always reflects true server state — no rollback logic needed; impossible to show a stale or inconsistent state
- SPA disadvantage: must implement rollback for failures AND handle cases where the server applies a different transformation than the frontend anticipated
- Extending Stimulus's `drop` handler to immediately move the ticket in the DOM is possible but requires duplicating server-side sorting logic in JavaScript

## Under the Hood: How Stimulus Observes the DOM

- Stimulus attaches a `MutationObserver` to the root `<html>` element — watches the entire document, catches every DOM change regardless of source
- Two mutation types handled:
  - `"attributes"` — reacts when `data-controller` is set dynamically on an existing element
  - `"childList"` — detects elements added or removed, including those inserted by Turbo Frames and Streams
- On finding `data-controller` without an attached instance, Stimulus creates a `Context` object that instantiates the controller class and starts subsidiary observers: `valueObserver`, `targetObserver`, `outletObserver`
- All subsidiary observers are ultimately backed by `MutationObserver` with convenience wrappers (e.g., `StringMapObserver` watches for attribute adds, removes, and updates)
- This architecture means controllers initialized inside Turbo Frames work automatically — no special Turbo integration code needed in the controller
- Stimulus does significant work under the hood so that its simple mental model (connect, callbacks, targets) holds even in complex dynamic UIs
- Debugging tip: every Stimulus feature (values, targets, outlets) has a named high-level observer; start debugging there; all paths eventually lead to a `MutationObserver`

## When to Use Stimulus vs. Turbo vs. Plain JS

- Use Stimulus when behavior needs to be scoped to a DOM element, reused across multiple pages, or correctly initialized/torn down as elements come and go (e.g., inside Turbo Frames)
- Use Turbo (Frames, Streams, Drive) for server-driven content updates, form submissions, and navigation — don't reach for Stimulus to do what Turbo handles natively
- Use plain JS (or a one-off event listener) for truly global, stateless behavior that never needs scoping or lifecycle management
- Stimulus sweet spot: toggle visibility, drag-and-drop, third-party widget initialization, keyboard shortcuts scoped to a widget, client-side validation feedback, cancel/dismiss actions
