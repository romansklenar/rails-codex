---
title: "Stimulus Targets & Values Reference"
description: "Target/value generated properties, type defaults, change callbacks, TypeScript declarations"
source:
  type: documentation
  title: "Stimulus Handbook"
  author: "Hotwire / Basecamp"
  url: "https://stimulus.hotwired.dev"
tags: [stimulus, targets, values, javascript, typescript]
---

# Stimulus Targets & Values Reference

Complete API for targets and values.

## Targets

## Definition & HTML
```javascript
static targets = [ "query", "errorMessage", "results" ]
```
```html
<div data-controller="search">
  <input data-search-target="query" type="text">
  <div data-search-target="errorMessage"></div>
  <div data-search-target="results"></div>
</div>
```

## Generated Properties
For target `results`:
- `this.resultsTarget` → first Element (throws if none)
- `this.resultsTargets` → Array of all matching Elements
- `this.hasResultsTarget` → Boolean

## Multiple Targets on Same Element
```html
<div data-search-target="item messages" data-other-target="highlight">
```

## Shared Targets Across Controllers
```html
<form data-controller="search checkbox">
  <input data-search-target="projects" data-checkbox-target="input">
  <input data-search-target="messages" data-checkbox-target="input">
</form>
```

## Target Connected/Disconnected Callbacks
```javascript
static targets = [ "item" ]

itemTargetConnected(element) {
  this.sortElements(this.itemTargets)
}

itemTargetDisconnected(element) {
  this.sortElements(this.itemTargets)
}
```
- Fires before `connect()`/`disconnect()`
- MutationObserver paused during callback (no re-triggers)

## Always Check Optional Targets
```javascript
if (this.hasResultsTarget) {
  this.resultsTarget.textContent = "Found"
}
```

---

## Values

## Definition
```javascript
static values = {
  url: String,
  interval: Number,
  params: Object,
  active: Boolean,
  tags: Array
}
```
```html
<div data-controller="loader"
     data-loader-url-value="/messages"
     data-loader-interval-value="5000">
</div>
```

## Generated Properties
For value `url`:
- `this.urlValue` → typed getter
- `this.urlValue = "..."` → setter (writes to data attribute)
- `this.hasUrlValue` → Boolean

## Type Defaults
| Type | Default |
|------|---------|
| String | `""` |
| Number | `0` |
| Boolean | `false` |
| Object | `{}` |
| Array | `[]` |

## Custom Defaults
```javascript
static values = {
  url: { type: String, default: "/bill" },
  interval: { type: Number, default: 5 },
  active: Boolean  // uses type default (false)
}
```

## Change Callbacks
```javascript
urlValueChanged(value, previousValue) {
  console.log(`Changed from ${previousValue} to ${value}`)
}
```
- Invoked at initialization
- Invoked when value changes via setter or data attribute mutation

## Removing Values
```javascript
this.urlValue = undefined  // removes data attribute
```

## Naming Convention
- Definition: `camelCase` (`contentType`)
- HTML: `kebab-case` (`data-loader-content-type-value`)
- Property: `camelCase` (`this.contentTypeValue`)

---

## TypeScript Declarations
```typescript
export default class MyController extends Controller<HTMLFormElement> {
  static targets = [ "input" ]
  static values = { code: String }

  declare codeValue: string
  declare readonly hasCodeValue: boolean
  declare readonly inputTarget: HTMLInputElement
  declare readonly inputTargets: HTMLInputElement[]
  declare readonly hasInputTarget: boolean
}
```
