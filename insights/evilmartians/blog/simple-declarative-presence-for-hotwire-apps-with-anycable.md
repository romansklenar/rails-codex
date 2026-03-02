---
title: "Simple Declarative Presence for Hotwire Apps with AnyCable"
description: "Adding real-time user presence tracking to Hotwire Rails apps using AnyCable's turbo-cable-presence-source custom element and the @anycable/turbo-stream package"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Irina Nazarova, Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/simple-declarative-presence-for-hotwire-apps-with-anycable"
  date: '2025-03-18'
tags:
- anycable
- hotwire
- websockets
- real-time
- presence
- turbo
- rails
- action-cable
---

# Simple Declarative Presence for Hotwire Apps with AnyCable

AnyCable v1.6+ introduces a declarative `<turbo-cable-presence-source>` custom HTML element that tracks user presence in Hotwire apps with minimal code and no custom Action Cable channels.

## What Presence Tracking Is

- Shows which users are currently viewing a page or resource in real-time
- Examples: Slack/Discord online dots, Google Docs avatar clusters, "X people viewing" e-commerce banners, collaborative form field indicators
- Presence tracking requires knowing when users join and leave a resource — reliably handling browser disconnects, multiple tabs, network drops
- Pure Action Cable presence tracking is difficult (not covered here; see "Presence ain't perfect" talk for history)

## Prerequisites

- AnyCable server v1.6+ (open-source, MIT-licensed; available via Docker, DockerHub, or `plus.anycable.io` managed offering)
- AnyCable Pro adds additional commercial features on top of the open-source server
- Rails app using `@anycable/turbo-stream` npm package as the Hotwire Action Cable client adapter
- AnyCable JavaScript client (`@anycable/web`) replaces the default Rails Action Cable client

## Setting Up the AnyCable Client

- Replace the default Action Cable client with the AnyCable one for better subscription race condition handling, TypeScript support, and modular architecture
- Import and start in the JS entrypoint:
  ```
  import "@hotwired/turbo"
  import { start } from "@anycable/turbo-stream"
  import { createCable } from "@anycable/web"
  const cable = createCable({ protocol: 'actioncable-v1-ext-json' })
  start(cable, { presence: true })
  ```
- The `{ presence: true }` option activates presence support in the AnyCable Turbo Stream adapter

## The turbo-cable-presence-source Element

- Drop a `<turbo-cable-presence-source>` tag on the page to activate presence tracking for that stream
- Required attributes: `signed-stream-name` (signed stream identifier, same signing as `turbo_stream_from`) and `presence-id` (unique identifier for the current user's presence)
- `signed-stream-name`: use `signed_stream_name([post, :presence])` Rails helper with a namespaced key
- `presence-id`: use `dom_id(user, :presence)` to generate a unique, stable ID per user
- The element acts as a container for both the presence UI and the Turbo Stream action template

## The Template for Join/Leave Actions

- The `<template>` child element inside `<turbo-cable-presence-source>` contains Turbo Stream actions triggered on join
- On join: the template's Turbo Stream action fires — typically `turbo_stream.append` to add the user to a list element
- On leave: the element with the matching `presence-id` is automatically removed from the DOM
- Multiple Turbo Stream actions can be placed in one template
- Template example: appends a user avatar card to `dom_id(post, :presence_list)` on join

## De-duplication of Multiple Sessions

- The `presence-id` attribute is used server-side to de-duplicate: join fires only when the user first enters the set (e.g., first browser tab)
- Leave fires only when all sessions for that user are closed (last tab closed or disconnected)
- This prevents duplicate entries when a user opens multiple tabs

## Presence Counter

- Add `data-presence-counter` attribute to any element inside `<turbo-cable-presence-source>`
- The library automatically updates that element's text content with the current count of present users
- No JavaScript required; purely declarative via HTML attribute

## Ignoring the Current User

- Add `ignore-self` boolean attribute to the `<turbo-cable-presence-source>` element
- Prevents the current user from appearing in their own presence list — shows only other online users
- Standard UX pattern for collaborative tools where self-presence is implied

## Extensibility via AnyCable Presence API

- The HTML interface (attributes) can be extended with new features like custom leave templates for cleanup actions beyond DOM removal
- For advanced use cases, use the underlying AnyCable Presence API for Action Cable directly
- Full example: `anycable/anycasts_demo#17` on GitHub

## Language and Framework Agnosticism

- `<turbo-cable-presence-source>` is a custom HTML element — works with any backend language, not just Rails
- AnyCable and Hotwire can be combined outside of Rails
- The AnyCable JS client (`@anycable/web`) is framework-agnostic
- Protocol used: `actioncable-v1-ext-json` — an extended version of the Action Cable protocol

## AnyCable vs. Action Cable for Presence

- Action Cable presence tracking is problematic: process-bound state, no built-in de-duplication, disconnect detection unreliable
- AnyCable server handles presence at the infrastructure level — reliable across multiple Rails processes and dynos
- AnyCable JS client improvements over the official Rails client: subscription race condition fixes, modular architecture, TypeScript support, extended protocol support
