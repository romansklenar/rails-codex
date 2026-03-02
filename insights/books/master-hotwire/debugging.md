---
title: "Debugging Hotwire Applications"
description: "A practical reference for diagnosing and fixing bugs in Turbo Drive, Turbo Frames, Turbo Streams, Stimulus, and Hotwire Native using browser DevTools, breakpoints, debug modes, and platform-specific inspection tools."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
  date: "2026-02-01"
tags: [debugging, turbo, stimulus, hotwire-native, devtools, logging]
---

# Debugging Hotwire Applications

A practical reference for diagnosing and fixing bugs in Turbo Drive, Turbo Frames, Turbo Streams, Stimulus, and Hotwire Native using browser DevTools, breakpoints, debug modes, and platform-specific inspection tools.

## Essential Browser DevTools Tabs

- **Elements tab** — inspect and manipulate the live DOM; use the top-left picker icon to select elements directly on the page; right-click any element to access "Break on" mutation breakpoints.
- **Console tab** — execute JavaScript in page context; inspect Turbo configuration objects; `console.log` output and warnings appear here; while paused at a debugger breakpoint the console runs in the current execution context, so you can inspect local variables at that stack frame directly.
- **Sources tab** — browse and search loaded JS assets including `turbo.js`; click a line number to set a breakpoint; use the Call Stack panel in the debugger sidebar to navigate up and down the stack and inspect local variables at each frame.
- **Network tab** — records all HTTP requests and WebSocket frames; click any request to open Headers, Preview, Response, and (for WebSockets) Messages subtabs.
- All examples use Chrome DevTools; all modern browsers have equivalent panels, possibly in slightly different locations in the UI.

## Switching to Unminified Turbo Source

- Debugging into minified Turbo code is impractical — switch the importmap to the unminified build before starting any investigation:
  ```ruby
  # config/importmap.rb
  # Before:
  pin "@hotwired/turbo-rails", to: "turbo.min.js"
  # After:
  pin "@hotwired/turbo-rails", to: "turbo.js"
  ```
- After this change the full, readable Turbo source is visible in the Sources tab under `assets/turbo.js`.
- Use the in-browser search (Cmd/Ctrl+F) inside the Sources tab to jump to specific method names or string snippets — more reliable than following source links that may drift across Turbo versions.

## Debugging Turbo Page Updates (General)

- Use **Break on → subtree modifications** (right-click element in Elements tab) to pause execution the moment Turbo modifies a section of the DOM; DevTools switches to Sources and highlights the exact Turbo line responsible.
- Use **Break on → attribute modifications** to catch cases where Turbo or Idiomorph changes element attributes rather than children.
- Use **Break on → node removal** to catch elements being unexpectedly removed from the DOM.
- Recommended playbook when Turbo does not update the page as expected:
  1. Re-read the relevant official docs or book chapter to refresh your mental model.
  2. Reproduce the issue reliably — this is a prerequisite for any deeper investigation.
  3. Find the target element in the Elements tab and set a "Break on" mutation breakpoint.
  4. Trigger the reproduction steps to fire the breakpoint.
  5. Walk the Call Stack to understand exactly which Turbo code path executed.

## Debugging Turbo Morphing

- Morphing is the most complex page-update path; all three "Break on" mutation breakpoint types are relevant:
  - **subtree modifications** — Idiomorph descends the DOM recursively, so breaking here lets you step through each node's morphing sequence.
  - **attribute modifications** — especially useful for remote-loaded Turbo Frames inside morphed content, which have a more complex lifecycle than plain nodes.
  - **node removal** — if a node is removed when you expect it to survive, the most likely cause is that it is absent from the new HTML response; anything else is a morphing library bug.
- To avoid mutation breakpoints firing on unrelated changes before the reproduction step, first pause execution at the start of morphing, then set element breakpoints while paused:
  - Search `turbo:morph` in Turbo source → the surrounding `renderElements` method is where actual morphing runs; place a breakpoint at its start.
  - Search `shouldMorphPage =` → lands in `PageView#renderPage`, the entry point for rendering any server response; use this if the `renderElements` breakpoint is never reached.
  - Search `linkClicked=` → entry point where Turbo intercepts link clicks; use this if the request never reaches the server at all.
- Individual breakpoints in the Sources sidebar can be toggled on/off without removing them — useful when iterating across multiple reproduction runs.
- A minimal reproducible example is less critical for morphing bugs than usual; debug effectively with the full page present and produce a minimal example only after identifying the root cause (useful for filing a bug report).

## Debugging Turbo Drive Requests

- Common symptoms: request arrives with wrong HTTP verb (e.g., GET instead of POST/PATCH), or Turbo does not intercept the request at all.
- Every potential Turbo navigation passes through `proposeVisit` on the `Navigator` class — set a breakpoint here to intercept all candidates regardless of origin.
- For **link clicks**, set a breakpoint in `linkClicked` on `LinkInterceptor`:
  - Step into `shouldInterceptLinkClick` to understand why Turbo is skipping interception.
  - Step into `linkClickIntercepted` to diagnose a wrong HTTP verb or malformed request parameters.
- Disable the Turbo cache to rule it out as the source of unexpected responses — the cache behaves like a network request but never hits the server:
  ```js
  Turbo.session.history.stop()
  ```
  If the bug disappears after disabling cache, the cache is the cause; if it persists, the cache is not involved.

## Debugging Turbo Frame Failures

- Most common failure: frame renders `Content missing...` because the server response does not contain the expected `<turbo-frame>` element.
- First check in the Network tab: the request should carry a `Turbo-Frame` HTTP request header set to the frame's `id` — verify the value matches what you expect.
- If the header is correct, inspect the raw response HTML in the Network → Response tab to confirm whether the target `<turbo-frame id="...">` element is present.
- If the frame is missing from the response, switch to Rails server logs and debug the controller/view as a standard Rails rendering issue.
- Listen for the `turbo:frame-missing` event to capture full diagnostics automatically; production-ready handler:
  ```js
  addEventListener("turbo:frame-missing", (event) => {
    let status = event.detail.response.status
    if (status >= 500 && status <= 599) return // already logged server-side

    let payload = {
      target: event.target.outerHTML,
      originUrl: document.location.toString(),
      requestUrl: event.detail.response.url,
      responseStatus: status,
      responseContentType: event.detail.response.headers.get("content-type"),
    }
    event.detail.response.text().then((responseBody) => {
      payload.responseBody = responseBody
      console.log(payload) // or send to error tracker
    })
  })
  ```
- Sending `turbo:frame-missing` payloads to an error tracker (Sentry, Honeybadger, etc.) surfaces corner-case frame ID mismatches in production automatically.

## Debugging Turbo Stream Failures

- For a pure Turbo Stream response, verify the response `Content-Type` is exactly `text/vnd.turbo-stream.html` — any other content type causes Turbo to ignore stream actions entirely.
- Inspect the raw stream HTML in the Network → Response tab and check for typos in action names, target IDs, or CSS selectors (quick check even when using view helpers).
- If the response and content type look correct but the DOM is not updated, set a breakpoint inside the relevant method of the `StreamActions` class in Turbo source — method names match action names (e.g., `append`, `replace`, `remove`).
- Inside `StreamActions` methods, inspect `this.targetElements` — if it is empty, the `target` attribute ID or `targets` CSS selector does not match any element currently in the DOM; Turbo silently does nothing in this case, which is why the debugger is required to catch it.

## Debugging Turbo Broadcasts (Action Cable)

- Turbo broadcasts use Action Cable WebSockets; inspect messages in Network tab → filter by **Socket** → click the `cable` request → open the **Messages** subtab (Firefox: Response tab).
- Most messages are server-alive pings; filter them out to reveal real stream payloads using this regex in the Messages filter field:
  ```
  ^(?!.*"type":"ping").*$
  ```
  Firefox syntax (wrap in slashes): `/^(?!.*"type":"ping").*$/`
- If relevant Turbo Stream messages are **absent** from the Messages subtab, the broadcast is not being sent from the backend — debug the Rails `broadcast` call, Active Record callbacks, or background job responsible for triggering it.
- If messages **are present** but the DOM is not updating, stream action execution is failing — apply the Turbo Stream debugging techniques above (content type, target ID, `StreamActions` breakpoint).

## Debugging Stimulus Controllers

- **Controller did something unexpected**: the issue is almost always in your own controller code — use `console.log` or set JS debugger breakpoints directly inside your controller methods; Stimulus itself is stable and does not perform actions autonomously.
- **Controller did nothing**: the most likely cause is a typo in a `data-controller`, `data-action`, `data-target`, or `data-outlet` attribute — Stimulus silently ignores unrecognized attribute values by design.
- Enable Stimulus debug mode to print lifecycle events to the console:
  ```js
  // app/javascript/application.js
  Stimulus.debug = true
  ```
- Debug mode prints the following events:
  - Application-level: `#starting`, `#start`, `#stopping`, `#stop`
  - Per controller instance: `#initialize`, `#connect`, `#disconnect`
  - Per `data-action` invocation: the method name (e.g., `#remove`)
- Mental model for "controller did nothing": enumerate the lifecycle events you expected (e.g., `initialize`, then `connect`) and compare against what debug mode actually printed — look for missing events, unexpected events, or wrong order.
- Use the browser console's built-in search/filter to narrow debug output by controller name or method name when the UI produces many events.
- **Hotwire Dev Tool** browser extension — early-stage tool that visually overlays Turbo Frame boundaries and active Stimulus controller bindings on the page; useful for spotting missing or misattributed controllers at a glance.
- **Stimulus LSP** — language server implementation with first-class VSCode and Zed support; catches controller name mismatches and data attribute typos at edit time before you run the app.

## Debugging Hotwire Native — General Workflow

- First question: does the bug reproduce in the mobile web browser (not inside the native app)? If yes, debug it as a standard web issue and ignore the native layer entirely.
- If it does not reproduce on web, the root cause is in native code or in the native↔web bridge communication.
- Universal debugging workflow for both iOS and Android:
  1. Enable Hotwire Native debug logging in the native app code.
  2. Run the app in the platform simulator.
  3. Attach browser DevTools to the embedded WebView.
  4. Reproduce and isolate the issue using native logs combined with web DevTools.
  5. If the issue is confirmed to be in native code, use the platform IDE debugger (Xcode or Android Studio).
- Bridge component messages are the most common source of native-specific bugs on both platforms — pay special attention to them in the logs.

## Debugging Hotwire Native — iOS

- Enable debug logging by adding one line inside `application(_:didFinishLaunchingWithOptions:)` in `AppDelegate.swift`:
  ```swift
  Hotwire.config.debugLoggingEnabled = true
  ```
- Debug logs appear in the **Debug Area** panel at the bottom of Xcode.
- Example bridge log entry for a `connect` event from a `cancel-button` component:
  ```
  [Bridge] bridgeDidReceiveMessage Message(
    id: "1",
    component: "cancel-button",
    event: "connect",
    metadata: Optional(HotwireNative.Message.Metadata(
      url: "http://localhost:3000/tickets/42/edit")),
    jsonData: "{\"title\":\"Cancel\",\"metadata\":
      {\"url\":\"http:\/\/localhost:3000\/tickets\/42\/edit\"}}"
  )
  ```
- To attach Safari DevTools to the embedded WebView: open Safari → **Develop** menu → select the running simulator → select the relevant page instance (each navigation stack entry appears as a separate item, e.g., "localhost" for the main screen and "localhost - edit" for a modal).
- Once attached, full Safari DevTools are available (Elements, Console, Sources, Network) with the same capabilities as debugging the page directly in Safari.
- For native Swift code bugs: click a line number in Xcode to set a breakpoint; run the app (the default build is a debug build); the Xcode debugger is conceptually identical to the browser JS debugger — call stack navigation, variable inspection, and step controls all work the same way.

## Debugging Hotwire Native — Android

- Enable both debug logging and WebView remote debugging in `HotboardApplication.kt` inside `onCreate`:
  ```kotlin
  Hotwire.config.debugLoggingEnabled = BuildConfig.DEBUG
  Hotwire.config.webViewDebuggingEnabled = BuildConfig.DEBUG
  ```
- View logs in Android Studio via **View → Tool Windows → Logcat** (displayed at the bottom of the IDE window).
- Example bridge log entry for a `connect` event from a `submit-button` component:
  ```
  bridgeDidReceiveMessage ... [Message(id=1, component=submit-button,
    event=connect, metadata=Metadata(url=http://10.0.2.2:3000/tickets/42/edit),
    jsonData={"title":"Update Ticket","metadata":
    {"url":"http://10.0.2.2:3000/tickets/42/edit"}})]
  ```
- To attach Chrome DevTools to the embedded WebView: navigate to `chrome://inspect/#devices` in any Chromium-based browser while the simulator is running → find the WebView instance under **Devices** → click **inspect** → standard Chrome DevTools open with the live WebView content.
- For native Kotlin/Java code bugs: run a **Debug build** (Run → Debug, or click the bug icon next to the play button in Android Studio); click a line number to set a breakpoint; the Android Studio debugger is conceptually identical to the browser JS debugger.
