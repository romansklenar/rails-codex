---
title: "Hotwire Native: Path Configuration"
description: "Path Configuration is a server-served JSON file that lets Hotwire Native control how each URL is rendered natively — which context (default vs modal), which fragment/presentation, and platform-specific behaviours — without releasing a new app version."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://masterhotwire.com"
  date: "2026-02-01"
tags: [hotwire-native, path-configuration, navigation, ios, android]
---

# Hotwire Native: Path Configuration

Path Configuration is a server-served JSON file that lets Hotwire Native control how each URL is rendered natively — which context (default vs modal), which fragment/presentation, and platform-specific behaviours — without releasing a new app version.

## What Path Configuration Is

- A JSON file with two top-level keys: `settings` and `rules`.
- `settings` — arbitrary key/value store for your own app; Hotwire Native itself ignores it; useful when building custom native screens.
- `rules` — an array of rule objects evaluated in order against every full-page URL visit.
- Each rule has two keys: `patterns` (array of regexes) and `properties` (key/value map applied to matching visits).
- Rules are additive and ordered: later rules override earlier ones for the same property key; design rules from most-general to most-specific.
- Only full-page visits are intercepted and evaluated against path configuration; Turbo Frame navigations are not.

## JSON Structure

```json
{
  "settings": {},
  "rules": [
    {
      "patterns": [
        "/new$",
        "/edit$"
      ],
      "properties": {
        "context": "modal"
      }
    }
  ]
}
```

## Pattern Matching

- Each entry in `patterns` is a regular expression matched against the URL.
- By default on iOS, the regex is matched against both the path **and** the query string; a URL like `/tickets/new?state=open` will not match `/new$` because `?state=open` follows.
- iOS fix: set `Hotwire.config.pathConfiguration.matchQueryStrings = false` to match path only.
- Android has no equivalent config flag; write more permissive regexes instead, e.g. `/new(\?.*)?$` to allow optional query strings.
- A catch-all rule `".*"` matches every URL and is useful as a base rule on Android to explicitly declare default behaviour that later rules can override.
- Pattern `"/edit$"` matches cleanly without the query-string issue because RESTful edit URLs carry no query params.

## Properties Reference

| Property | Values | Notes |
|---|---|---|
| `context` | `"default"`, `"modal"` | Controls navigation stack placement |
| `uri` | `"hotwire://fragment/web"` | Specifies Android fragment type; use with `context: "default"` as base rule |
| `pull_to_refresh_enabled` | `true`, `false` | Android only; off by default on Android, on by default on iOS; turn off for modals (pull-down dismisses modal on Android) |

## Context Values and Navigation Behaviour

- `"default"` — pushes the page onto the main navigation stack; slides in from the right.
- `"modal"` — presents the page as a native modal; slides up from the bottom on both platforms; shows an "×" close button (Android) instead of a back arrow.
- When a modal visit navigates to a URL whose resolved context is `"default"`, Hotwire Native automatically dismisses the modal and navigates the main screen — this is the mechanism that closes modals on successful form submission.

## Serving Path Configuration: Remote vs Bundled

- **Bundle locally** — include a JSON file in the app build so configuration is available immediately on first launch before any network request completes.
- **Serve remotely** — load from a server endpoint; the remote version overrides the bundled version when received; enables changing routing rules without submitting a new app version or waiting for users to upgrade.
- Best practice: do both — bundle a sensible default, load remote on startup.
- Configuration is loaded once at app boot; changes require an app restart to take effect (hot reload is not supported at runtime).

## Endpoint Versioning Strategy

- Maintain separate endpoints per platform and per version: `ios_v1`, `android_v1`, `ios_v2`, etc.
- Version explicitly so breaking changes to path configuration do not break users on older app versions still fetching the old endpoint.
- Retire old endpoints only after all users have upgraded past the version that depended on them.
- iOS and Android rules often diverge (different property support, different regex needs), so separate endpoints prevent one platform's config from polluting the other.
- Build the hashes with Ruby if you want to DRY shared portions across platform configs.

## iOS Setup

```swift
// ios/Hotboard/Hotboard/AppDelegate.swift
import HotwireNative
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Hotwire.config.pathConfiguration.matchQueryStrings = false
        Hotwire.loadPathConfiguration(from: [
            .server(rootURL.appending(path: "configurations/ios_v1.json"))
        ])
        return true
    }
}
```

- Configure in `AppDelegate` — runs before `SceneDelegate` is instantiated, guaranteeing configuration is ready before the first request.
- `matchQueryStrings = false` — makes regex patterns match path only, not path+query; simplifies patterns for RESTful URLs with query params.
- Pass `.server(url)` to `loadPathConfiguration(from:)` for remote loading; pass a bundled file URL for local loading.

## Android Setup

```kotlin
// HotboardApplication.kt
class HotboardApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        Hotwire.loadPathConfiguration(
            context = this,
            location = PathConfiguration.Location(
                remoteFileUrl = "${rootURL}/configurations/android_v1.json"
            )
        )
    }
}
```

- Subclass `Application` and configure there instead of `MainActivity` to avoid initialisation race conditions.
- Register the custom Application class in `AndroidManifest.xml` via `android:name=".HotboardApplication"`.
- No `matchQueryStrings` equivalent on Android; use permissive regexes like `/new(\?.*)?$`.

## Recommended Android Base Rule Pattern

```json
{
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

- Start with a `".*"` base rule that explicitly declares defaults; later rules then selectively override only what differs.
- `pull_to_refresh_enabled: true` on the base rule enables pull-to-refresh globally (it is off by default on Android).
- `pull_to_refresh_enabled: false` on the modal rule disables it for modals because pulling down on Android conventionally dismisses a modal, making refresh a confusing gesture.

## Rails Backend Controller

```ruby
class ConfigurationsController < ApplicationController
  BASIC_CONFIGURATION = {
    settings: {},
    rules: [
      {
        patterns: ["/new$", "/edit$"],
        properties: { context: "modal" }
      }
    ]
  }.freeze

  def ios_v1
    render json: BASIC_CONFIGURATION
  end

  def android_v1
    render json: { ... } # platform-specific rules
  end
end
```

```ruby
resources :configurations, only: [] do
  collection do
    get :ios_v1
    get :android_v1
  end
end
```

## Making Links Trigger Full-Page Visits for Native

- Path configuration only applies to full-page navigation; Turbo Frame links bypass it entirely.
- Use the `hotwire_native_app?` helper to conditionally target `_top` so the native app sees a full-page visit while the web keeps its frame-based behaviour.

```erb
<%# New ticket link %>
<%= link_to "New ticket",
    new_ticket_path(state:),
    data: {
      turbo_frame: (hotwire_native_app? ? "_top" : new_ticket_dom_id(state))
    } %>

<%# Edit ticket link %>
<%= link_to "Edit this ticket",
    edit_ticket_path(ticket),
    data: { turbo_frame: ("_top" if hotwire_native_app?) } %>
```

- Leaving `turbo_frame` as `nil` (the `if` returns `nil`) keeps the default frame behaviour on web.
- Avoid over-peppering views with `hotwire_native_app?`; spot recurring patterns and extract them into app-specific helpers.

## Fixing Modal Form Submission Behaviour

- Turbo Frames inside modal screens submit within the frame by default; Hotwire Native cannot intercept those navigations.
- Fix: add `target: ("_top" if hotwire_native_app?)` to `turbo_frame_tag` so form submissions become full-page navigations that Hotwire Native intercepts.

```erb
<%# edit.html.erb %>
<%= turbo_frame_tag @ticket, target: ("_top" if hotwire_native_app?) do %>

<%# new.html.erb %>
<%= turbo_frame_tag new_ticket_dom_id(@ticket.state),
    target: ("_top" if hotwire_native_app?) do %>
```

- After submission the redirected URL is evaluated against path configuration; if its context is `"default"`, the modal is dismissed automatically and the main stack navigates to the redirect target.
- Redirect native form actions to an appropriate root/index path rather than the show page to land the user in the right place after the modal closes.

```ruby
def update
  if @ticket.update(ticket_params)
    redirect_target = hotwire_native_app? ? root_path : @ticket
    redirect_to redirect_target, notice: "Ticket was successfully updated.", status: :see_other
  else
    render :edit, status: :unprocessable_entity
  end
end

def create
  # ...
  format.turbo_stream do
    redirect_to root_path if hotwire_native_app?
  end
end
```

## Modal Dismissal Mechanism

- Hotwire Native compares the context of the incoming URL against the current navigation state.
- If the app is presenting a modal and the next full-page visit resolves to `context: "default"`, the native layer automatically closes the modal and pushes the new page onto the main stack.
- This means the dismiss-and-navigate behaviour requires no native code — it is driven entirely by path configuration rules on the server.

## Common Pitfalls

- Path configuration is loaded at boot only; rule changes require restarting the app during development.
- iOS default: regex matches path + query string — `/new$` will not match `/new?state=open`; set `matchQueryStrings = false` or widen the regex.
- Android has no `matchQueryStrings` flag; always write permissive regexes for URLs that carry query params.
- Turbo Stream responses inside modals refresh the modal page, not the background page; redirect instead of streaming when inside a native app.
- A Turbo Frame wrapping a form will swallow the redirect response back into the frame unless `target: "_top"` is set for native.
- Configuring Hotwire in `MainActivity` instead of a custom `Application` subclass can cause race conditions on Android; always use an `Application` subclass.
