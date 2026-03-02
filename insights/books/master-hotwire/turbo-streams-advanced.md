---
title: "Turbo Streams Advanced"
description: "All 9 stream actions, morph method, stream sources, manual rendering, broadcasting"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-streams, turbo, action-cable, broadcasting]
---

# Turbo Streams Advanced

Advanced patterns beyond basic append/prepend/replace.

## All 9 Stream Actions
```erb
<%# 7 DOM manipulation actions %>
<%= turbo_stream.append "container", @item %>
<%= turbo_stream.prepend "container", @item %>
<%= turbo_stream.replace dom_id(@item), @item %>
<%= turbo_stream.update dom_id(@item), @item %>  <%# inner HTML only %>
<%= turbo_stream.remove dom_id(@item) %>
<%= turbo_stream.before dom_id(@item), partial: "divider" %>
<%= turbo_stream.after dom_id(@item), partial: "divider" %>

<%# 2 morphing actions (Turbo 8+) %>
<%= turbo_stream.morph dom_id(@item), @item %>
<%= turbo_stream.refresh %>  <%# triggers page refresh with morphing %>
```

## Refresh Action for Full Page Morph
```erb
<%# Instead of multiple stream actions, trigger page-wide morph %>
<%= turbo_stream.refresh %>
```
Requires `turbo_refreshes_with method: :morph` in layout.

## Custom Stream Actions
```javascript
// app/javascript/application.js
import { Turbo } from "@hotwired/turbo-rails"

Turbo.StreamActions.log = function() {
  console.log(this.getAttribute("message"))
}

Turbo.StreamActions.redirect = function() {
  Turbo.visit(this.getAttribute("url"))
}
```

```erb
<%# Use in response %>
<turbo-stream action="log" message="Item saved!"></turbo-stream>
<turbo-stream action="redirect" url="<%= items_path %>"></turbo-stream>
```

## Custom Action Rails Helpers
Register custom actions as Rails helpers for use in `.turbo_stream.erb`:
```ruby
# app/helpers/turbo_stream_actions_helper.rb
module TurboStreamActionsHelper
  def redirect(url)
    turbo_stream_action_tag :redirect, url: url
  end

  def log(message)
    turbo_stream_action_tag :log, message: message
  end
end

# Wire it up
Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)
```

```erb
<%# Now usable like built-in actions %>
<%= turbo_stream.redirect items_path %>
<%= turbo_stream.log "Item saved!" %>
```

## Multi-Element Targeting with CSS Selectors
```erb
<%# Target multiple elements by CSS selector (not just ID) %>
<turbo-stream action="remove" targets=".notification.read"></turbo-stream>
```

Note: Use `targets` (plural) with CSS selector vs `target` (singular) with DOM ID.

## Security: CSP Benefits
Turbo Streams don't execute `<script>` tags by design:
- Safe to render user content in stream responses
- No XSS risk from stream templates
- CSP can block inline scripts without breaking Turbo

## Broadcasting Debounce
Broadcasts are debounced by 500ms to batch rapid updates:
```ruby
# Multiple saves = single broadcast
@item.save!  # broadcast scheduled
@item.touch  # same broadcast, not duplicated
# 500ms later: single broadcast sent
```

In tests, wrap in `perform_enqueued_jobs` and keep assertions inside the block.

# ActionCable Broadcasting

## Setting Up Live Updates
```erb
<%# Subscribe to stream in view %>
<%= turbo_stream_from "main-board" %>
<%= turbo_stream_from @board %>  <%# uses to_gid_param %>
```

```ruby
# app/models/ticket.rb
class Ticket < ApplicationRecord
  # broadcasts_refreshes unrolls to:
  after_create_commit  -> { broadcast_refresh_later_to("main-board") }
  after_update_commit  -> { broadcast_refresh_later_to("main-board") }
  after_destroy_commit -> { broadcast_refresh_later_to("main-board") }
end
```

## Request ID Mechanism
Prevents the user who triggered an action from receiving their own broadcast:
```erb
<%# When initiating refresh yourself, set request_id: nil %>
<%= turbo_stream.refresh request_id: nil %>
```

The frontend generates a unique request ID and passes it via `X-Turbo-Request-Id` header. Broadcasts include this ID, and refreshes with matching IDs are ignored.

## Bypassing Debounce
For latency-sensitive updates, skip the debouncer:
```ruby
Turbo::Streams::BroadcastStreamJob
  .perform_later "main-board", content: turbo_stream.refresh
```

## Protecting Forms During Broadcast
```erb
<%# Prevent morph from wiping open form %>
<%= turbo_frame_tag @new_ticket, data: { turbo_prevent_morph: true } %>
```

```erb
<%# Clear form before triggering refresh (create.turbo_stream.erb) %>
<%= turbo_stream.update Ticket.new, "" %>
<%= turbo_stream.refresh request_id: nil %>
```

## Morph Method on Stream Actions
Replace and update actions support morphing for minimal DOM changes:
```html
<!-- Morph-replace: only changes diffed attributes/children -->
<turbo-stream action="replace" method="morph" target="message_1">
  <template><div id="message_1">Updated</div></template>
</turbo-stream>

<!-- Morph-update: morph children only, preserve element -->
<turbo-stream action="update" method="morph" target="unread_count">
  <template>5</template>
</turbo-stream>
```
`update` preserves the element and its listeners; `replace` rebuilds the element.

## Stream Source Element
Connect to WebSocket or SSE for live stream delivery:
```html
<!-- WebSocket -->
<turbo-stream-source src="ws://example.com/stream"></turbo-stream-source>

<!-- Server-Sent Events -->
<turbo-stream-source src="https://example.com/stream"></turbo-stream-source>
```
- Connected when element inserted to DOM, disconnected when removed
- Place in `<body>` (not `<head>`) so it persists across navigations
- Rails equivalent: `<%= turbo_stream_from @board %>`

## Manual Stream Rendering
```javascript
// Process stream HTML from any source
Turbo.renderStreamMessage(htmlString)

// Connect/disconnect custom stream sources (must emit MessageEvent)
Turbo.session.connectStreamSource(source)
Turbo.session.disconnectStreamSource(source)
```

## Custom Actions via StreamActions Property
Alternative to `Turbo.StreamActions` (both work):
```javascript
import { StreamActions } from "@hotwired/turbo"

StreamActions.log = function() {
  console.log(this.getAttribute("message"))
}
// Usage: <turbo-stream action="log" message="Hello"></turbo-stream>
```
