---
type: insight
title: "Hotwire Native v1.2"
description: "The biggest Hotwire Native update since launch — RouteDecisionHandlers, built-in server-driven historical location commands, and official native bottom tabs for iOS and Android"
resource: "https://dev.37signals.com/announcing-hotwire-native-v1-2/"
tags:
- hotwire
- hotwire-native
- ios
- android
- mobile
- navigation
- turbo-rails
- routing
timestamp: "2026-07-17"
source:
  type: blog
  title: "Announcing Hotwire Native v1.2"
  author: "Jay Ohms"
  url: "https://dev.37signals.com/announcing-hotwire-native-v1-2/"
  date: '2025-04-23'
---

# Hotwire Native v1.2

The largest Hotwire Native release since the initial launch — adding cross-platform API consistency, configurable URL routing, native bottom tabs, and refreshed demo apps for iOS and Android.

## Route Decision Handlers

- `RouteDecisionHandler` concept brought to iOS (previously Android-only) — a flexible, composable way to decide how each URL is routed
- Four built-in handlers registered out of the box:
  - **`AppNavigationRouteDecisionHandler`** — routes all internal URLs on the app's own domain through the native app
  - **`SafariViewControllerRouteDecisionHandler`** (iOS) — routes external `http`/`https` URLs to an `SFSafariViewController`
  - **`BrowserTabRouteDecisionHandler`** (Android) — routes external `http`/`https` URLs to a Custom Tab
  - **`SystemNavigationRouteDecisionHandler`** — routes remaining external URLs (`sms:`, `mailto:`, …) through the device's system navigation
- Register custom `RouteDecisionHandler` implementations to override the default behavior for app-specific needs

## Server-Driven Historical Location URLs

- `turbo-rails` historical location routes now work with built-in support in v1.2 — no extra path configuration needed:
  - `recede_or_redirect_to(url, **options)` — pops the visible screen off the navigation stack
  - `refresh_or_redirect_to(url, **options)` — refreshes the visible screen
  - `resume_or_redirect_to(url, **options)` — resumes the visible screen with no further action
- These "command" URLs let the server manipulate the native navigation stack directly
- Improved to dismiss `modal` screens automatically

## Native Bottom Tabs

- Official answer to one of the most common Hotwire Native questions — native bottom tab navigation
- `HotwireTabBarController` for iOS and `HotwireBottomNavigationController` for Android
- Demo apps updated on both platforms to show setup end to end

## New Demo Apps

- Fresh iOS and Android demo apps, plus a brand-new Rails web app for the native apps to consume
- Demo app improvements contributed by Joe Masilotti (author of *Hotwire Native for Rails Developers*)
- Documentation and guides at `native.hotwired.dev`

## Applicable Takeaway

- v1.2 closes the gap between server-rendered web navigation and native UX expectations: URL routing, back/refresh commands, and tab bars are now first-class and consistent across iOS and Android
- Rails apps drive native navigation from the server via `turbo-rails` helpers, keeping mobile behavior in the web layer rather than duplicating it natively
