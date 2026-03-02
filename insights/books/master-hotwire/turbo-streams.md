---
title: "Turbo Streams: Fine-Grained DOM Updates and Real-Time Broadcasting"
description: "Turbo Streams deliver surgical, per-element DOM mutations from the server using nine built-in actions and integrate with ActionCable to push real-time updates to all connected clients."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-streams, turbo, action-cable, broadcasting, real-time]
---

# Turbo Streams: Fine-Grained DOM Updates and Real-Time Broadcasting

Turbo Streams deliver surgical, per-element DOM mutations from the server using nine built-in actions and integrate with ActionCable to push real-time updates to all connected clients.

## What Turbo Streams Are

- Turbo Streams are custom HTML tags (`<turbo-stream>`) with an `action` attribute; when a server response contains them, Turbo interprets and executes the action, then removes the tag from the DOM.
- Implemented as a custom element: `customElements.define("turbo-stream", StreamElement)` — `StreamElement` inherits from `HTMLElement` and executes logic via `connectedCallback` rather than rendering.
- The browser does the heavy lifting of parsing the markup; Turbo inserts stream elements into the DOM and lets the browser invoke `StreamElement` code automatically.
- `StreamElement` reads the `action` attribute and dispatches to the matching method on `StreamActions`; each method iterates over `this.targetElements` and applies the mutation.
- After execution the `<turbo-stream>` tag is completely removed from the DOM, leaving no trace.
- Use Turbo Streams when you need more control than Turbo Frames provide — surgically precise about which parts of the UI change and how.

## The Nine Standard Stream Actions

- **`append`** — appends the template content as the last child of the target element: `turbo_stream.append :tickets do … end`.
- **`prepend`** — inserts the template content as the first child of the target element: `turbo_stream.prepend :page_content, partial: "notice", locals: { … }`.
- **`replace`** — replaces the entire target element (including the element itself) with the template content: `turbo_stream.replace "title" do … end`.
- **`update`** — replaces only the inner content of the target element, leaving the element itself in place: `turbo_stream.update :new_ticket, ""` (second argument is an inline content string).
- **`remove`** — removes the target element from the DOM entirely; no `<template>` content needed. JS implementation: `this.targetElements.forEach((e) => e.remove())`.
- **`before`** (insert before) — inserts the template content immediately before the target element in the DOM.
- **`after`** (insert after) — inserts the template content immediately after the target element in the DOM.
- **`refresh`** — the one action with no `target` attribute; fetches the current page from the server and updates the body without a full browser reload, using either `replace` (default) or `morph` method.
- **`morph`** — an alternative method for the `refresh` action; uses idiomorph for diffing rather than full body replacement; covered in the morphing chapter.

## Targeting Elements

- Target a single element by DOM id using the `target` attribute: `<turbo-stream action="replace" target="title">`.
- Target multiple elements simultaneously using a CSS selector via the `targets` attribute (plural): `<turbo-stream action="update" targets="span.loader">`.
- The `remove` action also iterates `targetElements`, so it works with both `target` (single id) and `targets` (CSS selector).
- ERB helpers use the singular form by default; pass a string id or a model object as the first argument.

## Turbo Stream Responses from Controllers

- Add `format.turbo_stream` inside a `respond_to` block; Rails will look for a `<action>.turbo_stream.erb` template automatically:
  ```ruby
  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to @ticket }
  end
  ```
- When combining `format.turbo_stream` with a `refresh` action (which re-fetches the page), set `flash.notice` on the flash object rather than an instance variable — the flash must survive the redirect to the re-fetched page:
  ```ruby
  flash.notice = "Ticket was successfully created."
  ```
- Multiple stream actions can be returned in the same `.turbo_stream.erb` template; each renders as a separate `<turbo-stream>` tag and Turbo executes them in sequence.

## `.turbo_stream.erb` View Templates

- Naming convention: `app/views/<controller>/<action>.turbo_stream.erb` — picked up automatically for `format.turbo_stream`.
- Block form renders arbitrary ERB inside the template tag:
  ```erb
  <%= turbo_stream.append :tickets do %>
    <%= render @ticket %>
  <% end %>
  ```
- Inline string form passes content as the second argument (no block needed): `turbo_stream.update :new_ticket, ""`.
- Partial with locals form: `turbo_stream.prepend :page_content, partial: "notice", locals: { notice: @notice }`.
- Example with three actions handling a successful ticket create (append new ticket, clear the form, show a notice):
  ```erb
  <%= turbo_stream.append :tickets do %>
    <%= render @ticket %>
  <% end %>
  <%= turbo_stream.update :new_ticket, "" %>
  <%= turbo_stream.prepend :page_content,
                           partial: "notice",
                           locals: { notice: @notice } %>
  ```

## The `refresh` Action in Detail

- Simplest alternative to multiple granular actions: one `refresh` re-fetches and replaces the full page body:
  ```erb
  <%= turbo_stream.refresh request_id: nil %>
  ```
- Always pass `request_id: nil` when rendering a refresh inside a direct HTTP response; omitting this lets Turbo include the current request's id, which it then ignores (thinking it already handled it).
- The `X-Turbo-Request-Id` header is generated on the frontend and sent to the server with every request; the backend echoes it in the `request-id` attribute of the `<turbo-stream action="refresh">` tag when broadcasting.
- Turbo stores seen request ids in an array; any incoming refresh whose `request-id` matches a stored id is silently ignored — prevents the initiating user from receiving a double-refresh from their own broadcast.
- Trade-off: `refresh` is far simpler to maintain but causes an extra full-page render on the server; multiple granular actions are more precise but harder to maintain as the UI evolves.

## Solving the Mismatched Frame Id Problem

- When a form inside a Turbo Frame creates a record, the frame id shifts from `new_ticket` (no id) to `ticket_4` (after save), so Turbo cannot match the response frame to the page frame — shows "Content missing".
- Root cause: Turbo Frames statically define their target at page-load time; server-side branching (errors → same frame id, success → different frame id) cannot be expressed through frames alone — a long-standing open issue in the Turbo GitHub repo.
- Solution A (granular streams): respond with `format.turbo_stream` and return `append`, `update`, and `prepend` stream actions that each target existing, stable DOM ids.
- Solution B (refresh): respond with `format.turbo_stream` and return a single `turbo_stream.refresh request_id: nil`; breaks out of any frame by reloading the full page.

## ActionCable Integration — `turbo_stream_from`

- Add `<%= turbo_stream_from "main-board" %>` anywhere in a view to subscribe the page to a named stream via WebSocket:
  ```erb
  <%= turbo_stream_from "main-board" %>
  <%# or for a specific record: %>
  <%= turbo_stream_from @board %>
  ```
- The helper emits a `<turbo-cable-stream-source channel="Turbo::StreamsChannel" signed-stream-name="…">` custom element; Turbo connects to `Turbo::StreamsChannel` (part of the turbo-rails gem) automatically.
- Stream names from strings use `String#to_param`; stream names from ActiveRecord objects use `record.to_gid_param` (from the `globalid` gem); multiple objects are concatenated.
- The signed stream name is produced by `Turbo.signed_stream_verifier#generate` backed by `ActiveSupport::MessageVerifier` — prevents man-in-the-middle stream spoofing.

## Model Broadcasting Helpers

- `broadcasts_refreshes` is the high-level class macro; registers after-commit callbacks for create, update, and destroy automatically:
  ```ruby
  class Ticket < ApplicationRecord
    broadcasts_refreshes
  end
  ```
- `broadcasts_refreshes` expands to three lower-level callbacks (customisable individually):
  ```ruby
  after_create_commit  -> { broadcast_refresh_later_to("main-board") }
  after_update_commit  -> { broadcast_refresh_later_to("main-board") }
  after_destroy_commit -> { broadcast_refresh_later_to("main-board") }
  ```
- `broadcast_refresh_later_to(stream)` schedules a `Turbo::Streams::BroadcastStreamJob` background job rather than broadcasting synchronously — keeps request latency low.
- The broadcast job calls `ActionCable.server.broadcast` with the stream name and a rendered `<turbo-stream action="refresh" request-id="…">` tag as content.
- `broadcast_refresh` (no `_later`) broadcasts synchronously; `broadcast_refresh_later` (no `_to`) broadcasts to the default stream derived from the model class name.
- Broadcast to a collection without a parent record by picking a plain string name and wiring up the callbacks manually with `broadcast_refresh_later_to("string-name")`.

## Broadcast Debouncing

- Before scheduling `BroadcastStreamJob`, turbo-rails passes the job through a `Turbo::Debouncer` instance scoped to the current thread, backed by `Concurrent::ScheduledTask` from `concurrent-ruby`.
- The debouncer cancels any pending broadcast and reschedules with a 0.5-second delay — prevents multiple redundant refreshes when several model updates happen in a single HTTP request.
- Debouncing differs from throttling: throttling fires immediately then suppresses; debouncing fires once at the end of the delay window.
- Broadcasts from different model classes are not aggregated; each model class broadcasting independently may still result in multiple refreshes arriving at the client.
- To bypass debouncing when sub-second latency matters, enqueue the job directly:
  ```ruby
  Turbo::Streams::BroadcastStreamJob
    .perform_later "main-board", content: turbo_stream.refresh
  ```

## Broadcasting Flow End-to-End

- User A submits a form → Rails controller saves the record → model after-commit callback fires → `BroadcastStreamJob` enqueued (debounced by 500 ms) → job calls `ActionCable.server.broadcast` with the signed stream name and the refresh tag.
- User B's browser has a `<turbo-cable-stream-source>` element on the page → Turbo connected to `Turbo::StreamsChannel` via WebSocket → receives the broadcast → executes the refresh action → fetches the current page from the server → morphs or replaces the body.
- User A (the initiator) receives the stream response via the normal HTTP response and does not trigger a second refresh because the `request-id` in the broadcast matches the stored id and is ignored.
- The user initiating the action should receive the same content via the regular HTTP response as what other users will receive when they refresh — keep both paths in sync.

## Preventing Morphing During Collaborative Refresh

- If a user has an open form and a broadcast refresh arrives, the form will be wiped by the morph/replace; guard against this with `data-turbo-prevent-morph` on the frame:
  ```erb
  <%= turbo_frame_tag @new_ticket, data: { turbo_prevent_morph: true } %>
  ```
- When using `data-turbo-prevent-morph`, the form survives incoming refreshes but also survives after a successful create — explicitly clear it before the refresh using an `update` stream action:
  ```erb
  <%= turbo_stream.update Ticket.new, "" %>
  <%= turbo_stream.refresh request_id: nil %>
  ```
- `data-turbo-permanent` on any element tells idiomorph (and Turbo's morphing pass) to skip that element entirely — useful for persistent UI like notification banners, open dropdowns, or media players.
- Turbo's morphing integration with idiomorph adds two guards: skip elements with `data-turbo-permanent`; skip morphing remote turbo frames (those with a remote `src` and `refresh="morph"`) — they are reloaded separately after the main morph pass completes.

## Custom Turbo Stream Actions

- Extend `Turbo.StreamActions` in JavaScript with a plain function; `this` inside the function is the `<turbo-stream>` element instance — use `this.getAttribute("attr")` to read attributes:
  ```js
  // app/javascript/application.js
  Turbo.StreamActions.log = function () {
    console.log(this.getAttribute("message"))
  }
  ```
- The corresponding HTML tag: `<turbo-stream message="My super message" action="log" />` — attributes are not parsed into function parameters, they must be read via `this.getAttribute`.
- Create a Ruby helper module and include it into `Turbo::Streams::TagBuilder` to render the custom action from ERB using `turbo_stream_action_tag`:
  ```ruby
  # app/helpers/turbo_stream_actions_helper.rb
  module TurboStreamActionsHelper
    def log(message)
      turbo_stream_action_tag :log, message:
    end
  end
  Turbo::Streams::TagBuilder.include(TurboStreamActionsHelper)
  ```
- Use in `.turbo_stream.erb`: `<%= turbo_stream.log("LOG: Ticket ##{@ticket.id} created.") %>`.
- Custom actions define a controlled vocabulary of UI mutations; they restrict server responses to a predefined, auditable interface rather than allowing arbitrary inline JavaScript.
- CSP benefit: custom stream actions eliminate the need for `script-src 'unsafe-inline'`; the browser never evaluates ad-hoc inline scripts, shrinking the attack surface to a named, reviewable list of actions.
- Third-party libraries like `turbo_power` provide extended action sets as a drop-in; the author recommends adding app-specific custom actions individually so they fit the application's precise requirements.

## When to Use Streams vs Frames vs Refresh vs Morphing

- Use **Turbo Frames** as the primary tool: a bounded region updates in response to a form submission or link click with a statically known, matching frame id.
- Use **Turbo Streams (granular)** when a single interaction must update multiple disjoint DOM regions simultaneously, or when you need to break out of a mismatched frame id without an extra page fetch.
- Use **`refresh` stream action (simple)** when maintainability matters more than avoiding the extra server round-trip; one action keeps both the HTML and turbo_stream paths consistent.
- Use **morphing** (`refresh` with the morph method) to minimise DOM churn during a refresh — preserves scroll position, open inputs, and CSS transitions better than a full body replace.
- Use **ActionCable broadcasts** (`broadcast_refresh_later_to`, `broadcasts_refreshes`) to push changes to other connected clients after a model mutation; combine with `turbo_stream_from` on the receiving page.
- Use **`data-turbo-permanent`** to exclude stateful elements (open forms, video players, notification banners) from both morphing and broadcast-triggered refreshes.
