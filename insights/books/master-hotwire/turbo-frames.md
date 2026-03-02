---
title: "Turbo Frames: Scoped Navigation and Partial Page Updates"
description: "Turbo Frames scope navigation and form submissions to a named region of the page, enabling inline editing, lazy content loading, and frame-targeted actions without writing any JavaScript."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
  date: "2026-02-01"
tags: [turbo-frames, turbo, navigation, lazy-loading, hotwire, rails]
---

# Turbo Frames: Scoped Navigation and Partial Page Updates

Turbo Frames scope navigation and form submissions to a named region of the page, enabling inline editing, lazy content loading, and frame-targeted actions without writing any JavaScript.

## What Turbo Frames Are

- A `<turbo-frame>` is a custom HTML element registered by Turbo; every link click and form submission inside it is intercepted and handled as a frame update rather than a full-page navigation.
- The canonical mental model is a "page within a page": Turbo Drive's navigation logic (link interception → fetch → render) is replicated inside the frame boundary by a per-frame `FrameController` instance.
- `FrameController` attaches three observers identical to those used by Turbo Drive: `LinkInterceptor`, `FormLinkClickObserver`, and `FormSubmitObserver` — the only difference is that the result updates the frame content, not the full page.
- Frame identity is determined by the `id` attribute; ids are global across the page, so every frame must have a unique id — use Rails' `dom_id` helper consistently to generate them.
- `turbo_frame_tag object` in ERB generates `<turbo-frame id="ticket_42">` using `dom_id` under the hood; passing the same object on both sides of a request guarantees matching ids without manual coordination.
- The `turbo-frame` custom element is registered via `customElements.define`; the browser calls `connectedCallback` when the element is parsed and attached to the DOM tree, which is where `FrameController` is instantiated.

## How Frame Navigation Works

- When a link inside a frame is clicked, Turbo fetches the href, parses the response body, and looks for a `<turbo-frame>` with the same `id`; if found, it replaces the current frame's content with the matched content from the response.
- The response page does not need to be a frame-only page — only the matching `<turbo-frame>` element is extracted from the response; the rest of the HTML is discarded.
- Form submissions inside a frame follow the same intercept-fetch-match cycle: Turbo serialises the form, issues the request with the correct HTTP method, follows any redirect, then extracts the matching frame from the final response.
- On a successful create/update the controller redirects to a show action; as long as the show template contains the matching frame (e.g. via the item partial), Turbo extracts it and replaces the form with the updated read view automatically.
- Validation errors are returned by re-rendering the form (HTTP 422); Turbo detects the non-redirect response, extracts the frame, and replaces the current frame with the error-annotated form — inline error display with zero extra code.

## Response Requirements and Frame Missing Errors

- Every server response to a frame-targeted request must contain a `<turbo-frame id="...">` whose `id` matches the requesting frame, or the `turbo:frame-missing` event must be handled explicitly.
- A redirect is fine — Turbo follows it and looks for the frame in the final redirected response.
- If no matching frame is found, Turbo fires `turbo:frame-missing` on the frame element; calling `event.preventDefault()` suppresses further handling and lets the application respond however it chooses.
- If the application does not call `preventDefault()`, Turbo logs a developer-console warning and throws `TurboFrameMissingError` uncaught, so any JavaScript error tracker will capture it.
- `TurboFrameMissingError` is worth tracking in error monitoring, but suppress reports for 5xx responses (already captured server-side); the response status is available at `event.detail.response.status`.
- 5xx responses will never contain the expected frame; treat them as server errors rather than frame-missing errors to avoid double-reporting.

## Targeting a Different Frame (Breaking Out)

- Any link, button, or form can target a frame other than its containing frame via the `data-turbo-frame` attribute; the value is the `id` of the destination frame.
- `data-turbo-frame="_top"` is a reserved value that always refers to the full page/window, making the action behave as a normal full-page navigation regardless of which frame the element sits inside.
- Use `_top` for actions whose server response affects the whole page (e.g., delete redirecting to index) — without it, a redirect to a page that lacks the matching frame causes a "Content missing" error.
- An element outside any frame can also target a specific frame using `data: { turbo_frame: dom_id(object) }`, so a "New" button in a page header can load content into an empty placeholder frame located elsewhere in the DOM.
- `Turbo.visit(url, { frame: frameId })` is the programmatic equivalent: it loads the URL and updates the named frame, useful when triggering navigation from custom JavaScript.

## Remote Frames: Eager and Lazy Loading

- An empty frame with a `src` attribute is an **eager-loaded frame**: as soon as it is connected to the DOM, Turbo fetches `src` and fills the frame — useful for deferring heavy content so the initial page response is fast.
- `turbo_frame_tag @ticket, src: ticket_path(@ticket)` renders `<turbo-frame id="ticket_42" src="/tickets/42">` and triggers an automatic fetch on page load.
- A frame with both `src` and `loading="lazy"` is a **lazy-loaded frame**: the fetch is deferred until the frame scrolls into the viewport, implemented via `IntersectionObserver`.
- Lazy loading is ideal for long lists where off-screen items should not be fetched until needed; the frame can render placeholder text (e.g. `Loading …`) that is visible until content arrives.
- After a link click targets a frame, Turbo sets the `src` attribute on the frame element; this is observable in DevTools and is also how the eager-load mechanism is triggered when `src` is pre-set in markup.
- The book uses the term **remote frames** as a collective name for both eager and lazy variants since Turbo's own documentation treats them separately without a shared term.

## FrameElement JavaScript API

- Reading or setting the `src` property on the DOM element (`frameEl.src = url`) triggers a new fetch and frame update, equivalent to `Turbo.visit(url, { frame: id })`.
- `frameEl.loaded` is a Promise that resolves when the current remote fetch completes — useful in tests or orchestration code that needs to wait for frame content.
- `frameEl.reload()` re-fetches the current `src`, refreshing the frame content on demand.
- `frameEl.disabled` (Boolean attribute) prevents any navigation or loading when set.
- `frameEl.complete` is a read-only Boolean indicating whether the frame has finished loading.
- `frameEl.isActive` is a read-only Boolean indicating whether the frame is connected and ready.
- The `loading` attribute accepts `"eager"` (default, load immediately on connect) or `"lazy"` (load on viewport intersection).
- The `autoscroll` attribute on the frame element causes Turbo to scroll the frame into view after its content is updated; `data-autoscroll-block` (`"end"`, `"start"`, `"center"`, `"nearest"`) and `data-autoscroll-behavior` (`"auto"`, `"smooth"`) fine-tune the scroll behaviour.

## Rendering Pipeline Inside the Frame

- Rendering is delegated to the `FrameRenderer` class, which mirrors the page-level renderer but scoped to the frame's subtree.
- Step 1: collect all `data-turbo-permanent` elements (by unique `id`) from the current frame content and store references to the live DOM nodes.
- Step 2: in the new content, replace permanent elements with same-id placeholder nodes.
- Step 3: remove current frame children from the DOM.
- Step 4: insert new frame children.
- Step 5: re-insert saved permanent nodes in place of their placeholders, preserving JavaScript object identity (event listeners, component state, media playback, etc.).
- Step 6: if the frame has `autoscroll` set, scroll the page to bring the frame into view.
- Step 7: apply `autofocus` to any eligible element inside the frame, mirroring native browser autofocus behaviour within the frame boundary.
- Step 8: evaluate any `<script>` elements found in the new content; skip evaluation per element by setting `data-turbo-eval="false"` on the script tag.
- `data-turbo-permanent` elements must have unique ids across the entire page, not just within the frame, because Turbo stores them globally by id.

## Busy and Disabled States

- While a frame fetch is in progress, Turbo sets `aria-busy="true"` on the `<turbo-frame>` element; CSS can target `turbo-frame[aria-busy]` to show spinners or dim content without any JavaScript.
- Turbo also adds a `busy` attribute to the frame element during loading, providing an additional CSS hook (`turbo-frame[busy]`).
- The `disabled` attribute on a frame prevents all navigation and loading for that frame; it can be toggled programmatically to temporarily lock the frame.

## Morphing Within Frames and Broadcast Compatibility

- The `data-turbo-prevent-morph` attribute on a frame prevents Turbo's morphing algorithm from collapsing or replacing that frame during a page-level refresh (e.g., triggered by a Turbo Stream broadcast or Turbo Drive navigation).
- This is required for empty placeholder frames that should persist across broadcast-driven page updates: without it, a morph pass would remove the unpopulated frame from the DOM.
- Pattern: add `data: { turbo_prevent_morph: true }` to every `turbo_frame_tag` that acts as a form-insertion placeholder so broadcast refreshes cannot destroy it.
- The `refresh="morph"` attribute on a frame causes frame-level refreshes to use morphing rather than a full innerHTML replace, preserving DOM state for focused inputs or open dropdowns.

## Inline Editing Pattern

- Wrap the item partial in `turbo_frame_tag item`; any "Edit" link placed inside the partial automatically targets the enclosing frame — no `data-turbo-frame` attribute needed.
- On the edit page, wrap only the form (not the full page layout) in the same `turbo_frame_tag @item`; the surrounding page markup is irrelevant since only the matching frame is extracted from the response.
- Intentionally not framing the entire edit template preserves the ability to open the edit URL as a standalone full page for users who arrive there directly.
- On save, the controller redirects to the show action; the show action renders the item partial which contains the same frame, so Turbo replaces the edit form with the read view automatically.
- A "Cancel" link inside the edit form frame pointing to the item's show path causes Turbo to fetch show, extract the matching frame, and replace the form with the read view — no JavaScript needed.

## Inline Creation Pattern

- Place an **empty** `turbo_frame_tag @new_record` on the index/list page as a placeholder (renders as `<turbo-frame id="new_ticket"></turbo-frame>` with no content).
- Give the "New" link `data: { turbo_frame: dom_id(@new_record) }` so it targets the placeholder frame; Turbo loads the new-record form into that frame without navigating the full page.
- On the new page, wrap the form in the matching `turbo_frame_tag @record` so Turbo can extract it and inject it into the placeholder.
- On successful create, the controller must respond with a Turbo Stream or redirect to a page that contains the matching frame; a plain redirect to index without the matching frame produces "Content missing".
- To clear the form frame after a successful creation, send a Turbo Stream update targeting the frame id with empty content: `turbo_stream.update new_ticket_dom_id(@ticket.state), ""`.
- Prepare the `@new_record` object in the controller's `index` action even if it will be used only for `dom_id`; the overhead is negligible and keeps id generation consistent across controller and views.

## Per-Column / Per-Context Frame IDs

- When multiple instances of the same "new record" form exist on one page (e.g., one "New ticket" button per Kanban column), `dom_id(Ticket.new)` always produces `"new_ticket"` — a collision that makes all buttons target the same single frame.
- Solve by encoding additional context into the id string, e.g. `"new_ticket_with_state_#{state}"`, and extract it into a helper method (`new_ticket_dom_id(state)`) shared between views and Turbo Stream response templates.
- The "New" link (`data: { turbo_frame: new_ticket_dom_id(state) }`), the placeholder frame in the column, the form frame in `new.html.erb` (`turbo_frame_tag new_ticket_dom_id(@ticket.state)`), and the Turbo Stream clear action must all call the same helper to guarantee identical ids.
- Pass state as a URL param (`new_ticket_path(state:)`) and initialise the model with it in the controller (`Ticket.new(state: params[:state])`); embed it in a hidden field in the form (`form.hidden_field :state`) so the state is submitted with the record.
- Permit the state param in `ticket_params` strong parameters; without this, `state` is stripped and the ticket is created in the default state regardless of which column button was clicked.
- Each per-column placeholder frame still needs `data: { turbo_prevent_morph: true }` to survive broadcast-driven page refreshes without disappearing.

## Session Expiry Handling

- When a frame fetches a URL and the session has expired, the server typically redirects to the login page; the login page normally does not contain the expected frame, triggering `turbo:frame-missing`.
- To force a full-page reload to the login page instead, add `<meta name="turbo-visit-control" content="reload">` to the login page; Turbo detects this meta tag and promotes the frame navigation to a full-page visit.

## Practical Tips and Conventions

- Use `dom_id` to generate frame ids whenever possible; nothing enforces it, but the convention prevents collisions and simplifies debugging.
- Prefer wrapping only the relevant content in a frame rather than the entire page template; this preserves the ability to open the URL standalone and keeps frame payloads small.
- When adding inline actions (edit, delete) from a list page, prefer moving the action links into the item partial so they automatically inherit the item's frame — no extra targeting needed.
- Use `_top` as a temporary escape hatch for actions (like delete) that affect the broader page; replace it later with a targeted Turbo Stream action that removes just the deleted element for a more refined UX.
- Inspect the `src` attribute on a `<turbo-frame>` in DevTools after a link-targeted navigation to understand how Turbo tracks the frame's current URL and to diagnose unexpected behaviour.
