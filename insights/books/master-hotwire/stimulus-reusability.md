---
title: "Stimulus Reusability"
description: "HTML as source of truth, value/target callbacks, conditional registration, error handling"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [stimulus, patterns, javascript, reusability]
---

# Stimulus Reusability

Principles for building reusable Stimulus controllers.

## HTML as Source of Truth
Store state in HTML, not controller instances:
```javascript
// BAD: state in controller
connect() {
  this.count = 10
  setInterval(() => this.counterTarget.textContent = this.count--, 1000)
}

// GOOD: state in HTML via values
static values = { count: Number }

connect() {
  setInterval(() => { if (this.countValue > 0) this.countValue-- }, 1000)
}

countValueChanged(current) {
  this.counterTarget.textContent = current
}
```

## Use Callbacks, Not connect()
```javascript
// BAD: setup in connect, assumes targets exist
connect() {
  if (this.hasCounterTarget) {
    this.setupCounter()
  }
}

// GOOD: setup when target appears
counterTargetConnected() {
  this.setupCounter()
}

counterTargetDisconnected() {
  this.cleanupCounter()
}
```

## Value Change Callbacks
```javascript
// Called on init AND when data-attribute changes
openValueChanged(current, previous) {
  this.contentTarget.hidden = !current
}
```
Benefits:
- Immediate render on page load
- Reacts to external HTML changes (Turbo, other controllers)
- Only fires when value actually changes

## Eliminating Assumptions
```javascript
static values = {
  url: String,
  delay: { type: Number, default: 300 }  // default = optional
}
```
- Use value defaults for reasonable fallbacks
- Keep controllers narrow/focused (single responsibility)
- Check state, degrade gracefully when elements missing

## Conditional Registration
```javascript
class UnloadableController extends Controller {
  static get shouldLoad() {
    return window.someFeatureEnabled  // false = skip entirely
  }
}
```

## Post-Registration Hook
```javascript
class SpinnerButton extends Controller {
  static afterLoad(identifier, application) {
    // Runs after registration, before any connect()
    // Useful for upgrading legacy elements
    document.querySelectorAll(".legacy-spinner").forEach(el => {
      el.setAttribute(application.schema.controllerAttribute, identifier)
    })
  }
}
```

## Custom Schema Overrides
```javascript
import { Application, defaultSchema } from "@hotwired/stimulus"

const customSchema = {
  ...defaultSchema,
  actionAttribute: "data-stimulus-action"  // override default attributes
}

const app = Application.start(document.documentElement, customSchema)
```

## Global Error Handling
```javascript
Stimulus.handleError = (error, message, detail) => {
  console.warn(message, detail)
  Sentry.captureException(error)
}
```
Prevents unhandled Stimulus errors from breaking other controllers.

## Debugging
```javascript
window.Stimulus.debug = true  // enable detailed logging
```
