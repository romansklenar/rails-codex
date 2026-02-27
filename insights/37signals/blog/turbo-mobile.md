---
title: Turbo for Mobile
source:
  type: blog
  title: Speeding up mobile development with Turbo
  author: Fernando Olivares
  url: https://dev.37signals.com/speeding-up-mobile-development-with-turbo/
  date: '2024-02-22'
tags:
- hotwire
- native
---

# Turbo for Mobile

Deliver web content in native apps via Turbo-iOS/Android. Deploy features without App Store review.

## When Web vs Native

| Use web (Turbo) | Use native |
|----------------|------------|
| List views, reports, settings | Multi-touch gestures |
| Feature-light interfaces | Complex animations |
| Frequently changing UI | Performance-critical rendering |

## Requirements

- Mobile-aware responsive CSS is mandatory
- Turbo 8 page caching makes web views feel native-speed
- Server-side updates deploy instantly without app recompilation
