---
title: "Hotwire: Reactive Rails with No JavaScript?"
description: "Step-by-step migration of a Rails 6 app from Turbolinks and custom JS to Turbo Drive, Turbo Frames, Turbo Streams, Stimulus, and Custom Elements for real-time reactivity"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/hotwire-reactive-rails-with-no-javascript"
  date: '2021-04-12'
tags: [hotwire, turbo, stimulus, rails, websockets, action-cable, turbo-streams, turbo-frames]
---

# Hotwire: Reactive Rails with No JavaScript?

A thorough walkthrough of migrating an existing Rails app (AnyCable demo / AnyWork) from Turbolinks and custom JS to the full Hotwire stack, demonstrating what zero-JS reactivity achieves and where JS remains necessary.

## From Turbolinks to Turbo Drive

- Replace `turbolinks` gem with `turbo-rails` in `Gemfile`; replace `turbolinks` npm package with `@hotwired/turbo-rails`
- Initialization changes: remove `Turbolinks.start()` — Turbo Drive starts automatically on import: `import "@hotwired/turbo"`
- Rename all HTML data attributes from `data-turbolinks-*` to `data-turbo-*`
- Remote forms (`remote: true`) no longer needed — Turbo Drive intercepts all form submissions natively
- Redirect status code must change from 302 to 303 (`status: :see_other`) to work with Fetch API `redirect: "follow"` and non-POST methods
- 303 forces the browser to issue a GET after any form method (POST, PATCH, PUT, DELETE); 302/301 only guarantees this for POST

## Framing with Turbo Frames

- `turbo_frame_tag dom_id(item)` wraps each ToDo item — Turbo intercepts form submissions inside and replaces only that frame
- Each frame is identified by a unique ID via `dom_id(item)` from `ActionView::RecordIdentifier`
- Form submission within a frame: Turbo performs AJAX, extracts matching frame from response HTML, replaces contents
- Delete with empty frame: render the partial with an `unless item.destroyed?` guard — empty frame removes the item's HTML
- Triggering form submit on checkbox change: `onchange: "this.form.requestSubmit();"` — use `requestSubmit()` not `submit()` (former triggers Turbo interception, latter does not)
- `requestSubmit()` polyfill needed for some browsers

## Controller Simplification with Frames

- `ItemsController#update` and `#destroy` both render `partial: "item", locals: { item }` — no JSON, no JS templates
- Deleting: respond with the same partial; the empty frame from the partial removes the DOM node
- Zero JavaScript written for this functionality — only HTML template changes

## Streaming with Turbo Streams

- `<turbo-stream>` custom element powers declarative DOM mutations: `action="replace"`, `action="append"`, `action="prepend"`, `action="remove"`, `action="update"`
- Only 5 built-in actions (vs 30+ in CableReady) — a deliberate constraint
- Stream elements execute immediately when added to the DOM and self-destruct
- Powered by the HTML Custom Elements API
- Content type must be `text/vnd.turbo-stream.html` for Turbo to activate stream elements in responses
- Cannot mix Turbo Frame and Turbo Stream responses — use streams for everything when cross-frame updates are needed

## Turbo Stream Layout Pattern

- Define `layouts/application.turbo_stream.erb` to automatically inject flash stream into every Turbo Stream response:
  ```erb
  <%= turbo_stream.replace "flash-alerts" do %>
    <%= render "shared/alerts" %>
  <% end %>
  <%= yield %>
  ```
- Remove explicit `render ... content_type: "text/vnd.turbo-stream.html"` from controllers; implicit rendering uses the layout
- In specs: add `format: :turbo_stream` to requests that rely on implicit rendering
- Migrate JS templates: `$("#<%= dom_id(item) %>").remove()` becomes `<%= turbo_stream.remove dom_id(item) %>`

## Real-Time Broadcasting with Turbo Streams

- `turbo_stream_from workspace` helper in the view creates an Action Cable subscription for the Turbo channel
- Replace custom channel broadcasts with `Turbo::StreamsChannel.broadcast_remove_to` and `Turbo::StreamsChannel.broadcast_replace_to`
- `broadcast_replace_to workspace, target: item, partial: "items/item", locals: { item }` replaces an item in all connected browsers
- Turbo Streams are transport-agnostic: write an adapter for any WebSocket library
- Testing: Turbo Rails provides no matchers (as of the article's date); custom RSpec matcher using `have_broadcasted_to` and regex on `turbo-stream action="..." target="..."` is needed

## Using stimulus-use for DOM Observation

- When Turbo Streams lacks a required action (e.g., `insert_adjacent_html`), use `MutationObserver` via `stimulus-use`
- `useMutation` from `stimulus-use` observes DOM child changes and fires `mutate(entries)` callback
- Pattern: detect new node added, disable observer, reorder DOM, re-enable observer
- This replaces CableReady's `insert_adjacent_html` action

## Custom Elements for Per-User HTML Enhancement

- For personalizing broadcast HTML client-side without per-user channels, use the Custom Elements API
- Define `<any-chat-message>` by extending `HTMLElement` and registering with `customElements.define`
- `connectedCallback()` fires when the element is inserted into the DOM — ideal for Turbo Stream appends
- Read `data-author-id` to compare with `currentUser().id` from meta tags, then apply CSS classes
- Meta tags in `<head>`: `<meta name="current-user-id" content="<%= current_user.id %>" data-turbo-track="reload">`
- Cleaner than a Stimulus controller for this simple, self-contained concern

## Honest Assessment of Zero-JS Hotwire

- Removed most JS code, but replaced it with new JS (Stimulus controllers, custom elements, DOM observation)
- New JS is more "utilitarian" — hooks into browser APIs rather than implementing business logic
- Requires deeper knowledge of JavaScript and modern browser APIs (MutationObserver, Custom Elements, requestSubmit)
- Turbo Streams limitation of 5 actions requires workarounds for operations like `insertAdjacentHTML`
- CableReady comparison: 30+ actions including `insert_adjacent_html` — more flexible for complex DOM manipulation
