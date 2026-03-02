---
title: "Hotwire Native Standards"
description: "Native apps, navigation routing matrix, Bridge Component API, Path Configuration properties, route decision handlers, Rails helpers"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [hotwire-native, ios, android, bridge-components, navigation]
---

# Hotwire Native Standards

## Overview

Hotwire Native is the third pillar of Hotwire (alongside Turbo and Stimulus), enabling web apps to be wrapped in native iOS/Android shells with native-feeling navigation and optional native components.

**Key terminology (as of September 2024):**
- **Hotwire Native** = merged Turbo Native + Strada (current name)
- **Bridge Components** = formerly Strada (JS ↔ native communication)
- Turbo Native and Strada names are **deprecated**

## Architecture

```
┌─────────────────────────────────────────────────┐
│                 Native App Shell                │
│  ┌───────────────────────────────────────────┐  │
│  │              WebView (Core)               │  │
│  │  ┌─────────────────────────────────────┐  │  │
│  │  │     Your Rails + Hotwire Web App    │  │  │
│  │  │         (Turbo Drive enabled)       │  │  │
│  │  └─────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────┘  │
│                                                 │
│   ┌─────────────┐    ┌─────────────────────┐    │
│   │   Native    │    │  Bridge Components  │    │
│   │   Screens   │◄──►│   (JS ↔ Native)     │    │
│   │  (Optional) │    │                     │    │
│   └─────────────┘    └─────────────────────┘    │
└─────────────────────────────────────────────────┘
```

**Core concept:** A WebView runs your web application. Hotwire Native enhances this WebView to:
1. Make web navigation feel native (Turbo Drive integration)
2. Provide tools for JavaScript ↔ native communication (Bridge Components)
3. Allow mixing web screens with native screens

## Navigation Routing

How navigation behaves depends on current state, target `context`, and `presentation`:

| Current State | Context | Presentation | Behavior |
|---------------|---------|--------------|----------|
| default | default | default | Push (or replace if same page, or pop if previous) |
| default | default | replace | Replace on main stack |
| default | modal | default | Present modal |
| modal | default | default | Dismiss modal, then push |
| modal | default | replace | Dismiss modal, then replace |
| modal | modal | default | Push on modal stack |
| modal | modal | replace | Replace on modal stack |
| any | any | pop | Pop current screen |
| any | any | refresh | Pop then refresh |
| any | any | clear_all | Dismiss modal, pop to root, refresh |
| any | any | replace_root | Dismiss modal, pop to root, replace |
| any | any | none | No navigation |

## Rails Navigation Helpers (turbo-rails)
```ruby
# In controllers — smart navigation for native context:
recede_or_redirect_to(url)   # Pop modal if present, then pop screen
refresh_or_redirect_to(url)  # Pop modal if present, then reload screen
resume_or_redirect_to(url)   # Pop modal if present only
```
These helpers detect native context automatically and fall back to standard `redirect_to` on web.

## Turbo Drive Integration

Hotwire Native integrates with Turbo Drive to transparently convert web page navigation into native screen transitions. This is automatic when:

```ruby
# Your Rails app already uses Turbo Drive (default in Rails 7+)
# Links and forms automatically trigger native navigation
```

```erb
<%# Standard Turbo links become native screen pushes %>
<%= link_to "Profile", user_path(@user) %>

<%# Disable native navigation for specific links %>
<%= link_to "External", "https://example.com", data: { turbo: false } %>
```

## Bridge Components

Bridge Components enable communication between web JavaScript and native code.

**Anatomy:** Controller (web side) + Component (native side)

```javascript
// app/javascript/controllers/bridge/submit_button_controller.js
import { BridgeComponent } from "@hotwired/hotwire-native-bridge"

export default class extends BridgeComponent {
  static component = "submit-button"  // Must match native component name

  connect() {
    // send(event, data, callback) - callback called when native replies
    this.send("connect", { title: this.bridgeElement.title }, () => {
      this.bridgeElement.click()  // Simulate click when native button pressed
    })
  }

  disconnect() {
    this.send("disconnect")  // Clean up native UI
  }
}
```

## BridgeComponent Properties
```javascript
this.platformOptingOut  // Boolean: opted out for current platform
this.enabled            // Boolean: component supported by native app
this.bridgeElement      // Wrapped version of this.element
this.send(event, data, callback)  // Send message to native component
```

## BridgeElement API

| Method/Property | Returns | Purpose |
|-----------------|---------|---------|
| `title` | string | `data-bridge-title` > `aria-label` > `textContent`/`value` |
| `disabled` | boolean | Check if disabled |
| `enabled` | boolean | Opposite of disabled |
| `enableForComponent(component)` | void | Remove disabled attribute |
| `hasClass(className)` | boolean | Check class membership |
| `attribute(name)` | string | Get attribute value |
| `bridgeAttribute(name)` | string | Get `data-bridge-*` attribute |
| `setBridgeAttribute(name, value)` | void | Set `data-bridge-*` attribute |
| `removeBridgeAttribute(name)` | void | Remove `data-bridge-*` attribute |
| `click()` | void | Platform-safe click simulation |

## Bridge Data Attributes
```html
<button data-bridge-title="Save"           <!-- Custom title for element -->
        data-bridge-disabled="false"       <!-- true | false | ios | android -->
        data-bridge-custom="value">        <!-- Custom bridge attributes -->
</button>
```

Platform-specific opt-out:
```html
<div data-controller="bridge--form"
     data-controller-optout-ios>           <!-- Disable on iOS only -->
</div>
```

## Automatic Attachment via shouldLoad
Bridge controllers only attach when:
1. Running inside a Hotwire Native app
2. Native app has registered the matching bridge component

The library checks `User-Agent` for component names:
```
Hotwire Native Android; bridge-components: [submit-button, cancel-button]; ...
```

## Hiding Web Elements When Native Active
```css
/* Hide when native component is available */
[data-bridge-components~="submit-button"]
[data-controller~="bridge--submit-button"] {
  display: none;
}

/* General hide-on-native class */
html.hotwire-native .hide-on-native {
  display: none;
}
```

## HTML Attributes Set by Bridge
On `<html>` element when native app detected:
- `data-bridge-components` - space-separated list of registered components
- `data-bridge-platform` - "android" or "ios"

```erb
<%# HTML triggers native button rendering %>
<div data-controller="bridge--submit-button">
  <button data-bridge-title="Save">Save</button>
</div>
```

## PWA vs Native Decision

Choose **PWA** when:
- No hardware access needed (camera, GPS, NFC, contacts)
- Offline functionality not required
- App store listing not needed
- Example: 37signals Campfire

Choose **Hotwire Native** when:
- Hardware features required (camera, microphone, GPS, NFC)
- Contact access needed
- Specific screens must work offline
- App store distribution required
- Push notifications (native) needed

## Offline Strategy

The WebView cannot work offline. Use a **hybrid approach:**

```
┌─────────────────────────────────────────┐
│           Offline-Critical?             │
└────────────────┬────────────────────────┘
                 │
        ┌────────┴────────┐
        ▼                 ▼
   ┌────────┐        ┌────────┐
   │  Yes   │        │   No   │
   └────┬───┘        └────┬───┘
        │                 │
        ▼                 ▼
   Native Screen     WebView Screen
   (Works offline)   (Requires network)
```

**Example:** Concert ticket app
- Browsing concerts → WebView (needs server data)
- Displaying purchased tickets → Native screen (must work at venue entrance)

## Web App Best Practices for Native Readiness

Following standard Hotwire patterns prepares your app for native:

## 1. Use Turbo Drive (Default)
```erb
<%# Turbo Drive is enabled by default - don't disable it %>
<%# Each page load becomes a native screen transition %>
```

## 2. Semantic Navigation
```erb
<%# Clear navigation hierarchy helps native nav stack %>
<%= link_to "Back", :back, data: { turbo_action: "replace" } %>
```

## 3. Mobile-Friendly Forms
```erb
<%= form_with model: @item do |f| %>
  <%# Use appropriate input types for native keyboards %>
  <%= f.email_field :email, inputmode: "email" %>
  <%= f.telephone_field :phone, inputmode: "tel" %>
  <%= f.number_field :quantity, inputmode: "numeric" %>
<% end %>
```

## 4. Touch-Friendly Targets
```css
/* Minimum 44x44px touch targets (Apple HIG) */
.btn, .link-action {
  min-height: 44px;
  min-width: 44px;
  padding: 12px 16px;
}
```

## 5. Detect Native Context
```javascript
// Check if running in Hotwire Native app
const isNative = navigator.userAgent.includes("Hotwire Native")

// Or check for bridge availability
const hasNativeBridge = window.HotwireNative !== undefined
```

```erb
<%# Conditional rendering in views %>
<% if native_app? %>
  <%# Show native-optimized UI %>
<% else %>
  <%# Show web UI %>
<% end %>
```

```ruby
# app/helpers/application_helper.rb
def native_app?
  request.user_agent&.include?("Hotwire Native")
end
```

## 6. Path Patterns for Native Routing
```ruby
# config/routes.rb
# Use RESTful routes - native apps use URL patterns for screen routing
resources :posts do
  resources :comments
end

# Native app can configure:
# /posts/* -> Push new screen
# /posts/*/edit -> Present modal
```

## Path Configuration

JSON file loaded at app boot that controls per-URL-path native behavior.

## Structure
```json
{
  "settings": {},
  "rules": [
    {
      "patterns": [".*"],
      "properties": {
        "context": "default",
        "uri": "hotwire://fragment/web",
        "pull_to_refresh_enabled": true
      }
    },
    {
      "patterns": ["/new(\\?.*)?$", "/edit$"],
      "properties": {
        "context": "modal",
        "pull_to_refresh_enabled": false
      }
    }
  ]
}
```

- **Rules are ordered**: later rules override earlier rules for matching paths
- **Patterns**: regex matched against URL path (and query on Android)
- **`context: "modal"`**: opens page as native modal instead of push
- iOS: `Hotwire.config.pathConfiguration.matchQueryStrings = false` to ignore query

## Properties Reference

**Common properties:**

| Property | Default | Values | Purpose |
|----------|---------|--------|---------|
| `context` | `default` | `default`, `modal` | Navigation stack placement |
| `presentation` | `default` | `default`, `push`, `pop`, `replace`, `replace_root`, `clear_all`, `refresh`, `none` | Navigation style |
| `pull_to_refresh_enabled` | iOS: `true`, Android: `false` | `true`, `false` | Pull-to-refresh |
| `animated` | `true` | `true`, `false` | Animate navigation transitions |

**Android-specific:**

| Property | Required | Purpose |
|----------|----------|---------|
| `uri` | **Yes** | Target destination URI (maps to `HotwireDestinationDeepLink` annotation) |
| `fallback_uri` | No | Fallback for older app versions missing the `uri` destination |
| `title` | No | Default toolbar title (web screens use `<title>` tag instead) |

**iOS-specific:**

| Property | Default | Values | Purpose |
|----------|---------|--------|---------|
| `view_controller` | — | identifier string | Native `UIViewController` (must conform to `PathConfigurationIdentifiable`) |
| `modal_style` | `large` | `large`, `medium`, `full`, `page_sheet`, `form_sheet` | Modal presentation style |
| `modal_dismiss_gesture_enabled` | `true` | `true`, `false` | Allow swipe-down dismiss |

**Settings (app-level config):**
```json
{
  "settings": {
    "feature_flags": [{"name": "new_flow", "enabled": true}],
    "cable": {"script_url": "https://example.com/cable.js"}
  },
  "rules": [...]
}
```
Use `settings` for feature flags, app configuration, or any sandbox data. Version your path configuration on breaking changes.

## Remote Loading (Updatable Without App Release)
```ruby
# app/controllers/configurations_controller.rb
class ConfigurationsController < ApplicationController
  def ios_v1
    render json: { settings: {}, rules: [...] }
  end

  def android_v1
    render json: { settings: {}, rules: [...] }
  end
end
```

```ruby
# config/routes.rb
resources :configurations, only: [] do
  collection do
    get :ios_v1
    get :android_v1
  end
end
```

**Best practice:** Separate endpoints per platform, versioned (`ios_v1`, `android_v2`). Only increment version on breaking changes.

## Loading in Native Apps
```swift
// iOS - AppDelegate.swift
Hotwire.config.pathConfiguration.matchQueryStrings = false
Hotwire.loadPathConfiguration(from: [
  .server(rootURL.appending(path: "configurations/ios_v1.json"))
])
```

```kotlin
// Android - Application.kt
Hotwire.loadPathConfiguration(
  context = this,
  location = PathConfiguration.Location(
    remoteFileUrl = "${rootURL}/configurations/android_v1.json"
  )
)
```

## Native Forms: Target `_top` for Native Interception
Hotwire Native only intercepts **full page visits**, not Turbo Frame navigations:
```erb
<%# Forms inside frames must break out for native modal navigation %>
<%= turbo_frame_tag @ticket,
    target: ("_top" if hotwire_native_app?) do %>
  <%= render "form", ticket: @ticket %>
<% end %>
```

```ruby
# Redirect to root after form submit in native context
def update
  if @ticket.update(ticket_params)
    redirect_target = hotwire_native_app? ? root_path : @ticket
    redirect_to redirect_target, notice: "Updated.", status: :see_other
  else
    render :edit, status: :unprocessable_content
  end
end
```

## Detecting Native Context
```ruby
# Built-in turbo-rails helper (checks User-Agent for "Hotwire Native")
hotwire_native_app?
```

Two approaches for conditional rendering:

```erb
<%# 1. Direct conditional (simple but doubles cache if in cached partials) %>
<% unless hotwire_native_app? %>
  <h1>Page Title</h1>
<% end %>

<%# 2. CSS class approach (preferred - no cache duplication) %>
<html class="<%= "hotwire-native" if hotwire_native_app? %>">
```

```css
html.hotwire-native h1 { display: none; }
html.hotwire-native .hide-on-native { display: none; }
```

## Free Native Enhancements
These work automatically with Hotwire Native:
- **Title**: HTML `<title>` tag becomes native screen title
- **File uploads**: Native photo gallery/camera picker for file inputs
- **Cookies**: Preserved across app restarts (remember-me sessions)
- **WebView sessions**: Shared across tabs (single login)

## Testing Native Behavior

```ruby
# spec/requests/native_spec.rb
RSpec.describe "Native app requests" do
  let(:native_user_agent) { "MyApp/1.0 Hotwire Native iOS" }

  it "returns appropriate content for native requests" do
    get posts_path, headers: { "User-Agent" => native_user_agent }
    expect(response).to be_successful
  end
end
```

## Route Decision Handlers

Default handlers (registered automatically, in priority order):
1. `AppNavigationRouteDecisionHandler` — Routes internal URLs through app
2. `SafariViewControllerRouteDecisionHandler` (iOS) / `BrowserTabRouteDecisionHandler` (Android) — External URLs in system browser
3. `SystemNavigationRouteDecisionHandler` — Device navigation (`sms:`, `mailto:`, etc.)

**Custom handlers** — Register in priority order; first matching handler wins:
```swift
// iOS
Hotwire.registerRouteDecisionHandlers([
    AppNavigationRouteDecisionHandler(),
    MyCustomExternalRouteDecisionHandler()
])
```
```kotlin
// Android
Hotwire.registerRouteDecisionHandlers(
    AppNavigationRouteDecisionHandler(),
    MyCustomExternalRouteDecisionHandler()
)
```

## Key Resources

- [Hotwire Native Documentation](https://native.hotwired.dev/)
- [Bridge Components Guide](https://native.hotwired.dev/bridge/)
- [Path Configuration](https://native.hotwired.dev/path-configuration/)

## Summary

To prepare for Hotwire Native:
1. **Use Turbo Drive** - enables automatic native navigation
2. **Follow Hotwire patterns** - Turbo Frames, Streams, Stimulus
3. **Design mobile-first** - touch targets, responsive layouts
4. **Keep views simple** - server-rendered HTML works best
5. **Plan native screens** - identify offline-critical features early
