---
title: "Hotwire Native: Architecture, Setup, and Web-Driven Enhancements"
description: "Hotwire Native wraps a Hotwire-powered Rails web app into a native iOS/Android application by embedding a WebView, injecting a custom Turbo adapter, and strategically layering native UI on top of the existing mobile web experience."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [hotwire-native, ios, android, navigation, architecture, webview]
---

# Hotwire Native: Architecture, Setup, and Web-Driven Enhancements

Hotwire Native wraps a Hotwire-powered Rails web app into a native iOS/Android application by embedding a WebView, injecting a custom Turbo adapter, and strategically layering native UI on top of the existing mobile web experience.

## What Hotwire Native Is

- Hotwire Native takes a mobile-friendly web app, embeds it inside a native app shell via a WebView (an embedded mobile browser), and enhances it selectively with native UI — without discarding the existing mobile web investment.
- Everything that already works on the mobile web — Turbo Drive, Turbo Frames, Turbo Streams, Stimulus, ActionCable broadcasts — continues to work inside a Hotwire Native app with zero additional work.
- The core philosophy: reuse the mobile web UI by default; apply native UI only where it meaningfully improves UX.
- This approach dramatically reduces the effort to launch and maintain a native app because most product changes land automatically when the web app is updated, with no native release required.
- For many projects, Hotwire Native alone is sufficient; for projects needing truly custom native screens, the Hotwire Native mental model is enough to collaborate effectively with a pure native mobile developer.

## Historical Context: From Turbo Native and Strada to Hotwire Native

- **Turbo Native** was first released in early 2019 (Android first, iOS a year later) as a bare-bones library for wrapping web apps in native shells.
- **Strada** was released in September 2023 at Rails World 2023 as a companion library introducing "Strada Components": web-driven elements that render native UI.
- **Hotwire Native** launched September 25, 2024, the day before Rails World 2024, by merging the Turbo Native and Strada codebases: Strada was renamed to "Hotwire Native Bridge Components" and merged into Turbo Native alongside additional improvements.
- Turbo Native and Strada are now effectively deprecated; all new development targets Hotwire Native exclusively.
- When searching online resources, be aware that older content refers to Turbo Native or Strada — those concepts map directly to Hotwire Native today.

## How Mobile UI Differs from the Web

- On the web, navigation produces "pages" that form a browsing history; on native, navigation produces "screens" that stack on top of each other — this distinction is fundamental to how Hotwire Native behaves.
- Forward navigation in a native app pushes a new screen onto the stack (keeping the previous screen in memory); returning pops the screen. The back button is a visible, prominent UI element — unlike browser history navigation, which is largely invisible to users.
- A standard Hotwire Native app maintains at least two simultaneous screen stacks: the **main stack** for primary app content and the **modal stack** for native popup modals — superficially similar to multiple browser tabs, but always appearing as a single app instance.
- In mobile web, forward vs. backward navigation is nearly invisible to users; in native apps, each full-page navigation leaves a visible trace (slide-in animation, back button).
- Turbo Frames and Turbo Streams do not manipulate the native screen stack because they do not trigger full-page Turbo Drive visits; only full-page navigations affect the stack.
- Key mental model: **different URLs = different screens**. Following a link to a new URL pushes a screen; navigating back to the previously visited URL pops a screen.
- The trailing slash on root URLs matters: `http://localhost:3000/` vs `http://localhost:3000` are treated as different URLs by Turbo, causing spurious screen pushes if the app's `rootURL` is inconsistent with redirect destinations.

## Architecture: How Hotwire Native Works Under the Hood

- A Hotwire Native app is a native iOS/Android app containing a WebView component — an embedded mobile browser that fetches and renders the web app over HTTP exactly as a real browser would.
- **iOS**: WebView uses the `WKWebView` component from WebKit (same engine as mobile Safari — WebKit rendering + Nitro JS engine).
- **Android**: WebView uses the `WebView` component from the Webkit Android library (same engine as Chrome for Android — Chromium rendering + V8 JS engine).
- WebView engine versions track the platform browser engines closely; only cutting-edge or experimental browser features may be disabled to maximise stability in the embedded context.
- Hotwire Native injects a bundled `turbo.js` file directly into the running WebView instance; this file creates a `TurboNative` object and registers it as Turbo's adapter via `Turbo.registerAdapter`, replacing the default `BrowserAdapter`.
- **The critical interception point**: Turbo calls `visitProposedToLocation` on its adapter for every full-page visit; the Hotwire Native adapter intercepts this to decide whether Turbo handles the navigation normally or the native code takes over to manipulate the screen stack.
- Turbo Frame and Stream visits bypass the adapter entirely — the native code never sees them; they are handled entirely within the running WebView JS context.
- **iOS messaging**: injected JS communicates with native code via the `postMessage` mechanism (same as cross-frame iframe messaging).
- **Android messaging**: injected JS communicates via `addJavascriptInterface` on WebView, which injects a global `TurboSession` object whose method calls are routed to a Kotlin `Session` instance.
- The injected JS handles timing uncertainty by attempting adapter registration immediately, then listening for `turbo:load`, then falling back to a timeout (Android: 4 seconds; iOS: 30 seconds) — Android's shorter timeout can cause loading issues that iOS won't exhibit.
- Source files: `Source/Turbo/WebView/turbo.js` (iOS repo) and `core/src/main/assets/js/turbo.js` (Android repo) — nearly identical, differing only in JS↔native messaging mechanism.
- Each `Session` object manages one WebView instance and one native screen; two sessions exist by default (main and modal). Additional sessions can be created for fully native screens (e.g. an offline-capable ticket viewer that stores data locally).
- All WebViews across sessions share the same cookies and session state — a user logging in on one part of the app is immediately authenticated everywhere in the app, including across restarts.

## Scaffolding a New iOS App

- Requires Xcode 15 or newer; project type: **iOS → App**, interface: **Storyboard**, language: **Swift**, testing: **None**.
- Recommended bundle identifier convention: reverse-domain notation, e.g. `com.masterhotwire.Hotboard`; this identifier uniquely identifies the app on the App Store.
- Add Hotwire Native as a Swift package: `File → Add Package Dependencies`, URL: `https://github.com/hotwired/hotwire-native-ios`.
- The minimal working setup replaces the entire `SceneDelegate.swift` with:

```swift
import HotwireNative
import UIKit

let rootURL = URL(string: "http://localhost:3000/")!

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let navigator = Navigator(configuration: Navigator.Configuration(
        name: "main",
        startLocation: rootURL
    ))

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        window?.rootViewController = navigator.rootViewController
        navigator.start()
    }
}
```

- `Navigator` is the central object managing WebView navigation from the native side; `name: "main"` is the conventional identifier for the primary session.
- `navigator.rootViewController` wraps the WebView into a UIKit view controller and takes control of the screen; `navigator.start()` triggers the initial page load at `startLocation`.
- The trailing `/` on `rootURL` is critical: Rails root path redirects include it; a mismatch causes an unintended screen push when the app navigates back to root.
- Swift key concepts for Rails developers: `let` = constant, `var` = mutable variable, `func` = method (`def`), `import` = `require`; `?` suffix on a type = nullable (may be `nil`), `!` suffix on a value = force-unwrap (crash if nil, used when you are certain the value exists).

## Scaffolding a New Android App

- Requires Android Studio Ladybug or later; project template: **Phone and Tablet → Empty Views Activity**; language: **Kotlin**; minimum SDK: **API 28** (Hotwire Native minimum); build config: **Kotlin DSL**; `compileSDK` must be 35 or higher.
- Recommended package name: reverse-domain notation, e.g. `com.masterhotwire.hotboard`.
- Add Hotwire Native Gradle dependencies in `android/app/build.gradle.kts` (check `https://github.com/hotwired/hotwire-native-android/releases` for the latest version):

```kotlin
implementation("dev.hotwire:core:1.2.3")
implementation("dev.hotwire:navigation-fragments:1.2.3")
```

- Replace `activity_main.xml` with a `FragmentContainerView` hosting the Hotwire Native `NavigatorHost`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.fragment.app.FragmentContainerView
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/main_nav_host"
    android:name="dev.hotwire.navigation.navigator.NavigatorHost"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    app:defaultNavHost="false" />
```

- Replace `MainActivity.kt` entirely with:

```kotlin
package com.masterhotwire.hotboard

import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import dev.hotwire.navigation.activities.HotwireActivity
import dev.hotwire.navigation.navigator.NavigatorConfiguration
import dev.hotwire.navigation.util.applyDefaultImeWindowInsets

const val rootURL = "http://10.0.2.2:3000/"

class MainActivity : HotwireActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        enableEdgeToEdge()
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<View>(R.id.main_nav_host).applyDefaultImeWindowInsets()
    }

    override fun navigatorConfigurations() = listOf(
        NavigatorConfiguration(
            name = "main",
            startLocation = rootURL,
            navigatorHostId = R.id.main_nav_host
        )
    )
}
```

- Android emulator uses `10.0.2.2` to refer to the host machine's `localhost`; iOS simulator uses `localhost` directly.
- Enable HTTP access in `AndroidManifest.xml` for local development (production builds should use HTTPS and remove these):

```xml
<uses-permission android:name="android.permission.INTERNET" />
...
<application
    android:usesCleartextTraffic="true"
    ...>
```

- Kotlin key concepts for Rails developers: `val` = variable declaration, `const val` = compile-time constant, `fun` = method (`def`), `override` = explicit override keyword required by the compiler, `class Name : Parent()` = class with inheritance, `<View>` angle-bracket syntax = generic type parameter (the compiler interpolates the type into the function/class template).

## Enhancing the App Without Writing Native Code

- Hotwire Native automatically sets the native screen title from the HTML `<title>` tag — the visible on-page `<h1>` heading is redundant and should be hidden when rendering inside the native app.
- The `turbo-rails` gem provides a `hotwire_native_app?` helper that returns `true` when the request comes from a Hotwire Native app — detected by checking for `"Hotwire Native"` in the User Agent header (e.g. `Hotwire Native iOS; Turbo Native iOS; bridge-components: []`).
- **Preferred pattern — CSS class on `<html>`**: avoids scattering `hotwire_native_app?` calls across views and avoids doubling fragment cache key size:

```erb
<!-- app/views/layouts/application.html.erb -->
<html class="<%= "hotwire-native" if hotwire_native_app? %>">
```

```css
/* app/assets/stylesheets/application.css */
html.hotwire-native h1 {
  display: none;
}
```

- **Alternative pattern — inline conditional rendering**: appropriate for isolated, non-cached content; avoid in cached partials:

```erb
<% unless hotwire_native_app? %>
  <h1 class="font-bold text-4xl">Tickets</h1>
<% end %>
```

- Caveat: using `hotwire_native_app?` inside a cached partial requires including it in the cache key, which doubles cache storage — the CSS class approach avoids this entirely.
- Two general principles for context-specific rendering: (1) conditionally modify rendered content with `hotwire_native_app?`; (2) indirectly modify it via a top-level element class set with the same helper, then target with CSS.
- For sweeping style changes (e.g. an entirely different layout for native), conditionally include a dedicated CSS file only for native requests; for small adjustments (hiding titles, tweaking spacing), the top-level CSS class approach is simpler.

## Free Capabilities from WebView and Hotwire Native

- **Unified sessions across WebViews**: all WebView instances in the app share the same cookies and session state (like tabs of a single browser window) — a user logging in once is authenticated in every part of the app; no extra session management needed.
- **Native file upload UX**: an HTML `<input type="file">` automatically triggers the platform's native file picker (photo gallery, file browser, camera) — provided by the underlying browser engine, not Hotwire Native, but an automatic benefit of the WebView approach.
- **Cookie persistence across app restarts**: cookies with appropriate expiry settings survive app close and reopen, just as in desktop/mobile browsers. Enabling a "Remember me" login by default (permanent session cookie) is sufficient; Hotwire Native preserves the rest.
- **Real-time features work automatically**: ActionCable WebSockets and Server-Sent Events function inside WebView without any native-side configuration — a change made in a browser tab is immediately reflected in the running native app.
- **WebView engine parity with mobile browsers**: the embedded WebView uses the same rendering and JS engine as the platform's default browser, so CSS, JavaScript, and browser APIs behave identically to mobile web — only experimental features may be restricted to ensure stability in the embedded context.
