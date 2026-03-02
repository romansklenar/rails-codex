---
title: "Turbo Drive"
description: "Prefetching, visit actions, form submission rules, cache API, View Transitions, legacy migration"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [turbo-drive, turbo, performance, cache, prefetching]
---

# Turbo Drive

Turbo Drive patterns for page navigation enhancement.

## Link Prefetching

Turbo prefetches links on hover (after 100ms delay) for instant-feeling navigation.

**Requirements:**
- GET requests only
- Must be idempotent (no side effects)
- Different page (not anchor links)

```erb
<%# Prefetching happens automatically %>
<%= link_to "Profile", user_path(@user) %>

<%# Disable prefetching %>
<%= link_to "External", url, data: { turbo_prefetch: false } %>
```

## Detecting Prefetch Requests
```ruby
# Server can detect prefetch via header
if request.headers["X-Sec-Purpose"] == "prefetch"
  # Handle differently if needed (rare)
end
```

## Visit Actions
```erb
<%# Replace current history entry (no back navigation) %>
<%= link_to "Tab", tab_path, data: { turbo_action: "replace" } %>

<%# Advance creates new history entry (default) %>
<%= link_to "Page", page_path, data: { turbo_action: "advance" } %>
```

## Disable Turbo Drive
```erb
<%# Per-link %>
<%= link_to "External", url, data: { turbo: false } %>

<%# Per-form %>
<%= form_with model: @user, data: { turbo: false } do |f| %>
<% end %>

<%# Per-section %>
<div data-turbo="false">
  <%# All links/forms inside use full page load %>
</div>
```

## Programmatic Navigation
```javascript
// Navigate with Turbo
Turbo.visit("/path")

// Replace instead of push
Turbo.visit("/path", { action: "replace" })

// Target specific frame
Turbo.visit("/path", { frame: "content" })

// Clear cache and navigate
Turbo.cache.clear()
Turbo.visit("/path")
```

# Form Submission

## Response Status Rules
Turbo Drive requires specific HTTP status codes for form responses:
```ruby
def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to @item  # 302/303 redirect on success
  else
    render :new, status: :unprocessable_content  # 422 required for re-render
  end
end
```

- **Success**: Must redirect (302/303). Turbo follows the redirect as a GET visit
- **Validation error**: Must return `422 Unprocessable Content`. Turbo re-renders the form
- **Server error**: 500 responses show error page in place

## Non-GET Links (data-turbo-method)
```erb
<%# Turbo creates a hidden form under the hood %>
<%= link_to "Delete", item_path(@item),
    data: { turbo_method: :delete, turbo_confirm: "Are you sure?" } %>
```

Under the hood: Turbo constructs an invisible `<form>` with the method and submits it.

## Custom Confirmation Dialog
```javascript
// Replace browser confirm() with custom dialog
Turbo.config.forms.confirm = (message, element) => {
  // Return a Promise that resolves to true/false
  return new Promise((resolve) => {
    // Show your custom dialog here
    resolve(window.confirm(message))  // Default behavior
  })
}
```

## Form Submission Events
```javascript
// Track submission state for UX feedback
addEventListener("turbo:submit-start", (event) => {
  event.detail.formSubmission.submitter.disabled = true
})

addEventListener("turbo:submit-end", (event) => {
  event.detail.formSubmission.submitter.disabled = false
})
```

## Opt-In Form Mode (for legacy apps)
```javascript
// Disable Turbo form handling globally, enable per-form
Turbo.setFormMode("optin")
```
```erb
<%# Only this form uses Turbo %>
<%= form_with model: @item, data: { turbo: true } do |f| %>
<% end %>
```

# Legacy Migration

Gradual adoption strategy for existing applications:

## Step 1: Install but Disable
```javascript
Turbo.session.drive = false       // Turn Turbo Drive off
Turbo.session.history.stop()      // Disable history cache
Turbo.setFormMode("optin")        // Make form handling opt-in
```

## Step 2: Selective Enablement
```erb
<%# data-turbo nesting controls enablement %>
<div data-turbo="false">
  <%# All links/forms use full page load %>
  <div data-turbo="true">
    <%# This section uses Turbo Drive %>
  </div>
</div>

<%# Turbo is auto-enabled inside frames %>
<%= turbo_frame_tag "search" do %>
  <%# Turbo Drive active here %>
<% end %>

<%# Scope Drive to a URL subsection %>
<meta name="turbo-root" content="/app">
```

## Migration Path (7 steps)
1. Introduce Turbo Frames, Streams, and Stimulus locally
2. Expand Frame usage, remove `data-turbo="false"` exceptions
3. Move `<script>`/`<style>` tags from `<body>` to `<head>`
4. Enable Turbo beyond Frames with `data-turbo="true"`
5. Scope Turbo Drive to URL paths with `turbo-root` meta tag
6. Enable full page morphing on ready pages
7. Enable Turbo Drive globally — migration complete

Each step delivers value independently. Pause at any step.

## Visit Direction
During navigation, `<html>` gets `data-turbo-visit-direction`:
- `forward` - navigating forward
- `back` - navigating back
- `none` - replace action

Useful for CSS transitions:
```css
html[data-turbo-visit-direction="back"] .page {
  animation: slide-right 0.3s;
}
```

# Additional Drive Features

## Ignored Paths
URLs with `.` in the final path component are ignored by Turbo (e.g., `/files/doc.pdf`) unless the extension is `.htm`, `.html`, `.xhtml`, or `.php`.
- Workaround: add trailing `/`
- `data-turbo="true"` does **not** override ignored paths

## Dynamic Asset Tracking
```html
<!-- Remove element if absent from new page (CSS only, not scripts) -->
<style data-turbo-track="dynamic">...</style>
```
Differs from `"reload"` which forces full page reload on change.

## Cache Client API
```javascript
Turbo.cache.exemptPageFromCache()    // never cache this page
Turbo.cache.exemptPageFromPreview()  // cache but don't show as preview
Turbo.cache.resetCacheControl()      // reset meta tag cache control
Turbo.cache.clear()                  // clear all cached pages
```

## View Transitions API
Requires meta tag on **both** current AND next page:
```html
<meta name="view-transition" content="same-origin">
```
Turbo sets `data-turbo-visit-direction` on `<html>` for CSS targeting.

## Custom Confirmation Method
```javascript
// Replace browser confirm() with custom dialog
Turbo.config.forms.confirm = (message, element) => {
  // Must return Promise<boolean>
  return new Promise((resolve) => {
    showCustomDialog(message, resolve)
  })
}
```

## Progress Bar
`.turbo-progress-bar` div auto-inserted after 500ms delay (configurable):
```javascript
Turbo.config.drive.progressBarDelay = 200  // ms
```
Set `visibility: hidden` in CSS to disable.
