---
title: "Turbo Events Reference"
description: "All Turbo events with detail properties, custom rendering, pause/resume patterns"
source:
  type: documentation
  title: "Turbo Handbook"
  author: "Hotwire / Basecamp"
  url: "https://turbo.hotwired.dev"
tags: [turbo, events, javascript, reference]
---

# Turbo Events Reference

All events dispatched by Turbo, with `event.detail` properties.

## Document Events (on `<html>`)

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:click` | Link clicked | `url`, `originalEvent` |
| `turbo:before-visit` | Before visit (not restore) | `url`; cancel with `preventDefault()` |
| `turbo:visit` | Visit started | `url`, `action` |
| `turbo:before-cache` | Before page cached | — |
| `turbo:before-render` | Before rendering | `render` (customizable), `resume()` |
| `turbo:render` | After rendering | `renderMethod` |
| `turbo:load` | After initial + every visit | `url`, `timing` |
| `turbo:reload` | Before full page reload | `reason` |

## Morphing Events

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:morph` | After morph | `currentElement`, `newElement` |
| `turbo:before-morph-element` | Before morphing element | cancel to skip |
| `turbo:before-morph-attribute` | Before morphing attribute | `attributeName`, `mutationType` |
| `turbo:morph-element` | After morphing element | — |

## Form Events (on `<form>`)

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:submit-start` | Submission starting | `formSubmission` |
| `turbo:submit-end` | Submission complete | `formSubmission`, `success`, `fetchResponse`, `error` |

## Frame Events (on `<turbo-frame>`)

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:before-frame-render` | Before frame render | `render` (customizable), `resume()` |
| `turbo:frame-render` | After frame render | `fetchResponse` |
| `turbo:frame-load` | Navigation complete | — |
| `turbo:frame-missing` | Response missing frame | cancel + custom handling |

## Stream Events (on `<turbo-stream>`)

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:before-stream-render` | Before stream action | `render` (customizable), `newStream` |

## HTTP Events

| Event | When | Key Detail Properties |
|-------|------|-----------------------|
| `turbo:before-fetch-request` | Before network request | `fetchOptions`, `resume()` |
| `turbo:before-fetch-response` | After network response | `fetchResponse` |
| `turbo:before-prefetch` | Before prefetch | cancel with `preventDefault()` |
| `turbo:fetch-request-error` | Network error | `request`, `error` |

## Common Patterns

## Custom rendering (morph)
```javascript
addEventListener("turbo:before-render", (event) => {
  event.detail.render = (currentBody, newBody) => {
    Idiomorph.morph(currentBody, newBody)
  }
})
```

## Pause rendering for animation
```javascript
addEventListener("turbo:before-render", async (event) => {
  event.preventDefault()
  await animateOut()
  event.detail.resume()
})
```

## Add auth headers to requests
```javascript
addEventListener("turbo:before-fetch-request", async (event) => {
  event.preventDefault()
  const token = await getSessionToken()
  event.detail.fetchOptions.headers["Authorization"] = `Bearer ${token}`
  event.detail.resume()
})
```

## Prepare page for caching
```javascript
addEventListener("turbo:before-cache", () => {
  // Reset forms, collapse UI, tear down widgets
})
```

## Detect preview
```javascript
if (document.documentElement.hasAttribute("data-turbo-preview")) {
  // Disable expensive operations during preview
}
```
