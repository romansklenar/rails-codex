---
title: "Hotwire Standards (Turbo + Stimulus)"
description: "Turbo Drive, Turbo Frames, Turbo Streams, Stimulus controllers — overview and common patterns"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [hotwire, turbo, stimulus, turbo-frames, turbo-streams]
---

# Hotwire Standards (Turbo + Stimulus)

## Philosophy
Hotwire provides SPA-like interactivity while keeping most logic server-side. The golden rule: **HTML over the wire, not JSON.**

## Turbo Drive
Turbo Drive intercepts link clicks and form submissions, replacing the `<body>` with the response.

```erb
<%# Turbo Drive is enabled by default %>
<%# Disable for specific links %>
<%= link_to "External", "https://example.com", data: { turbo: false } %>

<%# Disable for specific forms %>
<%= form_with model: @user, data: { turbo: false } do |f| %>
  <%# Full page reload on submit %>
<% end %>
```

## Turbo Frames
Turbo Frames scope navigation to a specific portion of the page.

## Basic Frame
```erb
<%# Wrap content that should update independently %>
<turbo-frame id="user_profile">
  <%= render @user %>
</turbo-frame>

<%# Links within frame update only the frame %>
<turbo-frame id="user_profile">
  <%= link_to "Edit", edit_user_path(@user) %>
  <%# Response must contain matching frame ID %>
</turbo-frame>
```

## Lazy Loading
```erb
<%# Load content asynchronously %>
<turbo-frame id="comments" src="<%= post_comments_path(@post) %>" loading="lazy">
  <p>Loading comments...</p>
</turbo-frame>
```

## Breaking Out of Frames
```erb
<%# Target different frame %>
<%= link_to "View All", users_path, data: { turbo_frame: "main_content" } %>

<%# Break out to full page %>
<%= link_to "Home", root_path, data: { turbo_frame: "_top" } %>
```

## Frame IDs with dom_id
```erb
<%# Use dom_id helper for consistent IDs %>
<turbo-frame id="<%= dom_id(@post) %>">
  <%= render @post %>
</turbo-frame>

<%# In controller response %>
<turbo-frame id="<%= dom_id(@post) %>">
  <%= render @post %>
</turbo-frame>
```

## Turbo Streams
Turbo Streams allow multiple DOM updates from a single response.

## Stream Actions
```erb
<%# app/views/posts/create.turbo_stream.erb %>

<%# Append to end of container %>
<%= turbo_stream.append "posts", @post %>

<%# Prepend to beginning %>
<%= turbo_stream.prepend "posts", @post %>

<%# Replace specific element %>
<%= turbo_stream.replace dom_id(@post), @post %>

<%# Update inner HTML %>
<%= turbo_stream.replace "flash", partial: "shared/flash" %>

<%# Remove element %>
<%= turbo_stream.remove dom_id(@post) %>

<%# Before/after specific element %>
<%= turbo_stream.before dom_id(@post), partial: "posts/divider" %>
<%= turbo_stream.after dom_id(@post), partial: "posts/divider" %>
```

## Controller Response
```ruby
class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream  # Renders create.turbo_stream.erb
        format.html { redirect_to @post }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "post_form",
            partial: "posts/form",
            locals: { post: @post }
          )
        end
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end
end
```

## Real-time Updates (Solid Cable)
```ruby
# app/models/post.rb
class Post < ApplicationRecord
  after_create_commit -> { broadcast_prepend_to "posts" }
  after_update_commit -> { broadcast_replace_to "posts" }
  after_destroy_commit -> { broadcast_remove_to "posts" }
end
```

```erb
<%# Subscribe to stream in view %>
<%= turbo_stream_from "posts" %>

<div id="posts">
  <%= render @posts %>
</div>
```

## Stimulus Controllers

## Controller Structure
```javascript
// app/javascript/controllers/toggle_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Declare targets
  static targets = ["content", "button"]

  // Declare values (with types)
  static values = {
    open: { type: Boolean, default: false },
    url: String
  }

  // Declare CSS classes
  static classes = ["hidden", "active"]

  // Lifecycle callbacks
  connect() {
    // Called when controller connects to DOM
  }

  disconnect() {
    // Called when controller disconnects
  }

  // Actions
  toggle() {
    this.openValue = !this.openValue
  }

  // Value change callbacks
  openValueChanged(value, previousValue) {
    this.contentTarget.classList.toggle(this.hiddenClass, !value)
    this.buttonTarget.classList.toggle(this.activeClass, value)
  }
}
```

## HTML Integration
```erb
<div data-controller="toggle"
     data-toggle-open-value="false"
     data-toggle-hidden-class="hidden"
     data-toggle-active-class="active">

  <button data-toggle-target="button"
          data-action="toggle#toggle">
    Toggle Content
  </button>

  <div data-toggle-target="content" class="hidden">
    Hidden content here
  </div>
</div>
```

## Actions
```erb
<%# Click event (default for buttons) %>
<button data-action="controller#method">Click</button>

<%# Explicit event %>
<input data-action="input->search#filter">
<input data-action="change->form#validate">

<%# Multiple actions %>
<button data-action="click->menu#open keydown.enter->menu#open">

<%# Prevent default %>
<a href="#" data-action="click->modal#open:prevent">
```

## Targets
```erb
<%# Single target %>
<input data-controller-target="input">

<%# Multiple targets %>
<li data-items-target="item">Item 1</li>
<li data-items-target="item">Item 2</li>
```

```javascript
// Access single target
this.inputTarget       // First matching target
this.hasInputTarget    // Boolean check

// Access multiple targets
this.itemTargets       // Array of all matching
this.itemTargetCount   // Count
```

## Common Patterns

## Form Submission with Turbo
```erb
<%= form_with model: @post, id: "post_form", data: { turbo_frame: "_top" } do |f| %>
  <%= f.text_field :title %>
  <%= f.submit "Save", data: { turbo_submits_with: "Saving..." } %>
<% end %>
```

## Confirmation Dialogs
```erb
<%= button_to "Delete", post_path(@post),
    method: :delete,
    data: { turbo_confirm: "Are you sure?" } %>
```

## Disable During Submit
```erb
<%= f.submit "Save", data: {
  turbo_submits_with: "Saving...",
  disable_with: "Saving..."  # Fallback for non-Turbo
} %>
```

## Flash Messages with Turbo
```erb
<%# layouts/application.html.erb %>
<div id="flash">
  <%= render "shared/flash" %>
</div>

<%# In turbo_stream responses %>
<%= turbo_stream.replace "flash", partial: "shared/flash" %>
```

## Best Practices
- **Progressive enhancement:** Pages should work without JavaScript
- **Keep controllers small:** Single responsibility, compose multiple controllers
- **Use targets, not querySelector:** Maintainable and explicit
- **Name actions clearly:** verb + noun (e.g., `toggle`, `submit`, `filter`)
- **Avoid inline JavaScript:** Keep all JS in Stimulus controllers
- **Test with Turbo disabled:** Ensure graceful degradation
