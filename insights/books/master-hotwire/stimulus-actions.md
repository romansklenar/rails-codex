---
title: "Stimulus Actions Reference"
description: "Action descriptors, keyboard filters, global events, action options, parameters with type casting"
source:
  type: documentation
  title: "Stimulus Handbook"
  author: "Hotwire / Basecamp"
  url: "https://stimulus.hotwired.dev"
tags: [stimulus, actions, events, javascript]
---

# Stimulus Actions Reference

Complete action descriptor syntax and event handling.

## Action Descriptor Format
```
[event]->[identifier]#[method]:[options]
```
```html
<button data-action="click->gallery#next:prevent">Next</button>
```

## Default Events (Shorthand)
Omit event name for common elements:

| Element | Default Event |
|---------|---------------|
| `<a>` | click |
| `<button>` | click |
| `<details>` | toggle |
| `<form>` | submit |
| `<input>` | input |
| `<input type=submit>` | click |
| `<select>` | change |
| `<textarea>` | input |

```html
<!-- These are equivalent: -->
<button data-action="click->dialog#close">Close</button>
<button data-action="dialog#close">Close</button>
```

## Keyboard Event Filters
```html
<div data-action="keydown.esc->modal#close">
<div data-action="keydown.enter->search#query">
<div data-action="keydown.ctrl+a->listbox#selectAll">
```

**Supported filters:** `enter`, `tab`, `esc`, `space`, `up`, `down`, `left`, `right`, `home`, `end`, `page_up`, `page_down`, single chars `[a-z]`/`[0-9]`, modifiers `alt`/`ctrl`/`meta`/`shift`.

## Global Events
```html
<div data-action="resize@window->gallery#layout">
<div data-action="scroll@document->table#updatePositions">
```

## Action Options
```html
<div data-action="scroll->gallery#layout:!passive">
<img data-action="click->gallery#open:capture">
<div data-action="click->modal#close:once">
<a data-action="click->nav#follow:stop:prevent">
<div data-action="click->modal#close:self">
```

| Option | Effect |
|--------|--------|
| `:capture` | Use capture phase |
| `:once` | Fire only once |
| `:passive` | Passive listener |
| `:!passive` | Non-passive listener |
| `:stop` | Call `stopPropagation()` |
| `:prevent` | Call `preventDefault()` |
| `:self` | Only if `event.target === element` |

Options are chainable: `click->nav#follow:stop:prevent`

## Multiple Actions
```html
<input data-action="focus->field#highlight input->search#update">
```
Execute left-to-right. Call `event.stopImmediatePropagation()` to stop chain.

## Action Parameters
```html
<button data-action="item#upvote"
        data-item-id-param="12345"
        data-item-url-param="/votes"
        data-item-payload-param='{"value":"1234567"}'
        data-item-active-param="true">
</button>
```

```javascript
upvote({ params: { id, url, payload, active } }) {
  // id: 12345 (Number)
  // url: "/votes" (String)
  // payload: { value: 1234567 } (Object)
  // active: true (Boolean)
}
```

**Auto type casting:** numeric strings → `Number`, JSON → `Object`, `"true"`/`"false"` → `Boolean`, else `String`.

## Naming Convention
Use verb-based names describing what happens, not the event:
- ❌ `click->profile#click`
- ✅ `click->profile#showDialog`
