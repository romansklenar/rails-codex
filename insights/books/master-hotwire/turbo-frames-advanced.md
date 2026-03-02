---
title: "Turbo Frames Advanced"
description: "Frame targeting, remote frames, FrameElement JS API, morphing, autoscroll, session expiry"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-frames, turbo, navigation, javascript]
---

# Turbo Frames Advanced

Advanced frame patterns beyond basic usage.

## Frame Targeting

## Target Different Frame
```erb
<%# Link inside frame A updates frame B %>
<%= link_to "View", item_path(@item), data: { turbo_frame: "sidebar" } %>
```

## Break Out to Full Page
```erb
<%# "_top" is special frame name for full page %>
<%= button_to "Delete", item_path(@item),
    method: :delete,
    data: { turbo_frame: "_top" } %>
```

## Remote Frames

## Eager Loading (load immediately)
```erb
<%= turbo_frame_tag "comments", src: comments_path(@post) do %>
  <p>Loading comments...</p>
<% end %>
```

## Lazy Loading (load when visible)
```erb
<%= turbo_frame_tag "comments",
    src: comments_path(@post),
    loading: "lazy" do %>
  <p>Loading comments...</p>
<% end %>
```

## Programmatic Frame Loading
```javascript
// Load frame content from JavaScript
Turbo.visit(location, { frame: "frame_id" })
```

## Frame Missing Handling
```erb
<%# Response MUST contain matching frame ID %>
<%# Otherwise: "Content missing" error %>
```

Handle gracefully:
```javascript
addEventListener("turbo:frame-missing", (event) => {
  // Optionally handle missing frame
  // event.preventDefault() to suppress error

  // Or let Turbo show error and log for monitoring
  console.error("Frame missing:", event.target.id)
})
```

## Form Inside Frame
```ruby
# Controller must respond with matching frame
def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to @item  # Show page must have matching frame
  else
    render :new, status: :unprocessable_content
  end
end
```

## Permanent Elements
```erb
<%# Preserved across frame updates %>
<div id="player" data-turbo-permanent>
  <%# Video player state survives frame reload %>
</div>
```

Permanent elements must have unique `id` attribute.

# Frame Element API

## HTML Attributes
| Attribute | Purpose |
|-----------|---------|
| `src` | URL to load content from |
| `loading` | `"eager"` (default) or `"lazy"` |
| `disabled` | Prevents any navigation when present |
| `target` | Default target for links/forms (`_top`, frame ID) |
| `refresh="morph"` | Use morphing on page refresh |
| `autoscroll` | Scroll frame into view after loading |
| `data-autoscroll-block` | `"end"` (default), `"start"`, `"center"`, `"nearest"` |
| `data-autoscroll-behavior` | `"auto"` (default) or `"smooth"` |

## JavaScript Properties & Methods
```javascript
frame.src              // get/set URL — setting triggers load
frame.disabled         // Boolean — prevent loading
frame.loading          // "eager" or "lazy"
frame.loaded           // Promise resolving when navigation complete
frame.complete         // read-only Boolean
frame.isActive         // read-only — frame loaded and ready
frame.isPreview        // read-only — in preview document
frame.reload()         // reload from current src
```

## Frame with Morphing on Refresh
```erb
<%# Frame keeps its loaded content (e.g. paginated page 3) during page refresh %>
<%= turbo_frame_tag "items", src: items_path, refresh: "morph" %>
```

## Promoting Frame Navigation to Page Visit
```erb
<%# Updates both frame content AND browser URL/history %>
<%= turbo_frame_tag "articles", data: { turbo_action: "advance" } do %>
  <%= link_to "Next", articles_path(page: 2) %>
<% end %>
```

## Breaking Out on Session Expiry
Add to login page to force full reload when frame loads login:
```html
<meta name="turbo-visit-control" content="reload">
```
