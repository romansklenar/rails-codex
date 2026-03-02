---
title: "Stimulus Composition"
description: "Combining controllers via HTML, custom events, and outlets with decision guide"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [stimulus, composition, patterns, javascript]
---

# Stimulus Composition

Three ways to combine Stimulus controllers.

## 1. Indirect (via HTML)
Controllers act independently on shared HTML:
```erb
<%# Two controllers, no direct connection %>
<div data-controller="counter validator">
  <input data-counter-target="input" data-validator-target="field">
</div>
```
One controller changes HTML → other reacts via callbacks. Preferred when possible.

## 2. Custom Events
```javascript
// Emitting controller
this.element.dispatchEvent(new CustomEvent("app:saved", {
  bubbles: true,
  cancelable: true,
  detail: { id: this.idValue }
}))

// Listening controller (via connect)
connect() {
  this.element.addEventListener("app:saved", this.handleSaved)
}
disconnect() {
  this.element.removeEventListener("app:saved", this.handleSaved)
}
handleSaved = (event) => { /* ... */ }  // arrow function for `this` binding
```

```erb
<%# Or via data-action %>
<div data-controller="list"
     data-action="app:saved->list#refresh">
</div>
```

**When to use events:**
- Changes significant for whole page
- Emitter doesn't care about side-effects
- Multiple listeners may exist

## 3. Stimulus Outlets
```javascript
// Calling controller
export default class extends Controller {
  static outlets = ["form"]

  submit() {
    this.formOutlet.submit()  // call method on outlet controller
  }
}
```

```erb
<%# CSS selector finds the outlet %>
<div data-controller="panel"
     data-panel-form-outlet="#main-form">
</div>

<form id="main-form" data-controller="form">...</form>
```

**Outlet methods:**
- `this.formOutlets` - all matching
- `this.formOutlet` - first match (throws if none)
- `this.hasFormOutlet` - boolean check

**When to use outlets:**
- Clear parent-child relationship
- Receiver doesn't care if it's called
- Need direct method invocation

## Decision Guide
| Mechanism | Coupling | Best for |
|-----------|----------|----------|
| HTML indirect | None | Independent features |
| Events | Loose | Page-wide notifications |
| Outlets | Direct | Parent calling child |
