---
title: "Hotwire Debugging"
description: "Debug techniques for Turbo, Stimulus, broadcasts, and Hotwire Native apps"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [debugging, turbo, stimulus, hotwire-native]
---

# Hotwire Debugging

Techniques for debugging Turbo, Stimulus, and Hotwire Native applications.

## Enable Readable Turbo Source
```ruby
# config/importmap.rb
pin "@hotwired/turbo-rails", to: "turbo.js"  # NOT turbo.min.js
```

# Debugging Turbo Page Updates

## DOM Breakpoints (Chrome DevTools)
Right-click element in Elements tab → "Break on":
- **subtree modifications** - break when children change
- **attribute modifications** - break when attributes change
- **node removal** - break when element removed

## Key Turbo Source Breakpoints
```javascript
// Find in Sources tab → turbo.js:

// 1. Morphing entry point - search for:
"turbo:morph"

// 2. Page rendering decision - search for:
shouldMorphPage =

// 3. Link click interception - search for:
linkClicked=
```

## Debug Morphing Issues
1. Set breakpoint at morph entry point
2. Use DOM breakpoints on problem elements
3. Step through idiomorph execution

# Debugging Turbo Network Issues

## Check Turbo Cache
```javascript
// Disable cache to isolate issues
Turbo.session.history.stop()
```

## Frame Missing Errors
Track in error monitoring:
```javascript
addEventListener("turbo:frame-missing", (event) => {
  let status = event.detail.response.status
  if (status >= 500 && status <= 599) return  // Already logged server-side

  let payload = {
    target: event.target.outerHTML,
    originUrl: document.location.toString(),
    requestUrl: event.detail.response.url,
    responseStatus: status,
    responseContentType: event.detail.response.headers.get("content-type"),
  }
  event.detail.response.text().then((responseBody) => {
    payload.responseBody = responseBody
    console.log(payload)  // Or send to error tracker
  })
})
```

## Debug Turbo Streams
1. Check `Content-Type: text/vnd.turbo-stream.html`
2. Verify stream action target IDs match DOM
3. Set breakpoint in StreamActions class methods

# Debugging Broadcasts

## Inspect WebSocket Messages
1. DevTools → Network → Socket filter
2. Find "cable" request → Messages tab
3. Filter out pings: `^(?!.*"type":"ping").*$`

# Debugging Stimulus

## Enable Debug Mode
```javascript
// app/javascript/application.js
Stimulus.debug = true
```

Prints lifecycle events:
- `application #starting`, `#start`
- `controller #initialize`, `#connect`, `#disconnect`
- `controller #methodName` (when actions fire)

## Common Issues
- **Controller does nothing**: Check data-controller spelling, controller file name
- **Action doesn't fire**: Check data-action syntax, verify event type
- **Target not found**: Check data-*-target spelling

## Useful Tools
- [Hotwire Dev Tools](https://github.com/leonvogt/hotwire-dev-tools) - Browser extension
- [Stimulus LSP](https://github.com/marcoroth/stimulus-lsp) - VSCode/Zed support

# Debugging Hotwire Native

## Enable Debug Logging
```swift
// iOS - AppDelegate.swift
Hotwire.config.debugLoggingEnabled = true
```

```kotlin
// Android - Application.kt
Hotwire.config.debugLoggingEnabled = BuildConfig.DEBUG
Hotwire.config.webViewDebuggingEnabled = BuildConfig.DEBUG
```

## Inspect WebView
- **iOS**: Safari → Develop → Simulator → select page
- **Android**: Chrome → `chrome://inspect/#devices` → inspect

## Bridge Component Messages
Look for `bridgeDidReceiveMessage` in logs with component, event, and jsonData.
