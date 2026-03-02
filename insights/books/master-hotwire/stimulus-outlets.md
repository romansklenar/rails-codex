---
title: "Stimulus Outlets Reference"
description: "Cross-controller outlets API, callbacks, namespace handling, conditional registration"
source:
  type: documentation
  title: "Stimulus Handbook"
  author: "Hotwire / Basecamp"
  url: "https://stimulus.hotwired.dev"
tags: [stimulus, outlets, javascript]
---

# Stimulus Outlets Reference

Cross-controller communication via CSS selectors.

## Definition & HTML
```javascript
export default class ChatController extends Controller {
  static outlets = [ "user-status" ]

  connect() {
    this.userStatusOutlets.forEach(status => status.markAsSelected())
  }
}
```
```html
<div data-controller="chat" data-chat-user-status-outlet=".online-user">
  ...
</div>

<!-- Anywhere on page -->
<div class="online-user" data-controller="user-status">...</div>
```

## Generated Properties
For outlet `user-status`:
- `this.hasUserStatusOutlet` → Boolean
- `this.userStatusOutlet` → first Controller (throws if none)
- `this.userStatusOutlets` → Array of Controllers
- `this.userStatusOutletElement` → first Element
- `this.userStatusOutletElements` → Array of Elements

## Access Outlet Members
```javascript
this.userStatusOutlet.idValue           // outlet's values
this.userStatusOutlet.imageTarget       // outlet's targets
this.userStatusOutlet.markAsSelected()  // outlet's methods
```

## Outlet Callbacks
```javascript
userStatusOutletConnected(outlet, element) {
  console.log("Outlet connected")
}

userStatusOutletDisconnected(outlet, element) {
  console.log("Outlet disconnected")
}
```

## Namespace Handling
```javascript
// For "admin--user-status" controller
static outlets = [ "admin--user-status" ]

// Omit namespace delimiters in property names:
this.adminUserStatusOutlets  // ✅
```

## Requirements
- Outlet element **must** have matching `data-controller` attribute
- Throws error if outlet not found — use `hasXOutlet` to check
- Selector is a CSS selector (class, ID, attribute, etc.)

## Conditional Registration
```javascript
class UnloadableController extends Controller {
  static get shouldLoad() {
    return window.someFeatureEnabled  // false = skip registration
  }
}
```

## Post-Registration Hook
```javascript
class SpinnerButton extends Controller {
  static afterLoad(identifier, application) {
    // Runs after controller registered, before any connect()
    // Use for legacy element upgrades
  }
}
```

## Error Handling
```javascript
// Global error handler for all Stimulus errors
Stimulus.handleError = (error, message, detail) => {
  console.warn(message, detail)
  ErrorTrackingSystem.captureException(error)
}
```
