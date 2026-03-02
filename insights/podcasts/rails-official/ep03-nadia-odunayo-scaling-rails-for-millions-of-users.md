---
title: "Nadia Odunayo: Scaling Rails for Millions of Users as a Solo Dev"
description: "How one developer built and scaled The StoryGraph to four million users using Rails, Turbo Native, Sidekiq, YugabyteDB, and a deliberate choice to stay solo."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17575580-nadia-odunayo-scaling-rails-for-millions-of-users-as-a-solo-dev"
  date: 2025-07-28
tags:
  - scaling
  - solo-developer
  - turbo-native
  - database
  - background-jobs
  - mobile
  - infrastructure
  - yugabytedb
---

# Nadia Odunayo: Scaling Rails for Millions of Users as a Solo Dev

One developer built The StoryGraph — a book tracking platform with over four million users — entirely on Rails, proving that the framework's ecosystem can carry a solo founder from bootcamp to production scale.

## Staying with Rails as a Solo Developer

- Nadia has used Rails since her bootcamp days and has never felt compelled to switch — the framework's conventions and batteries-included approach reduce the decision surface for a solo developer
- Rails' gem ecosystem is central to the solo model: Devise for authentication, Sidekiq for background jobs, and Makara for read/write splitting mean not building any of that infrastructure from scratch
- Rails positions itself as a "one-person framework" — Nadia's experience running a 4M+ user platform alone is a direct validation of that claim
- Leaning on the Rails community and ecosystem compounds the leverage a solo developer has; familiar conventions mean faster onboarding of contractors or contributors when needed

## Mobile Strategy: From PWA to Turbo Native

- The StoryGraph initially explored a Progressive Web App (PWA) approach for mobile delivery — it didn't work out due to limitations in app store distribution and UX expectations
- Shifted to Turbo Native (part of Hotwire), which allowed Nadia to ship iOS and Android apps sharing the same Rails backend without maintaining separate codebases
- 60% of StoryGraph users are on mobile apps, with Android leading — a non-obvious distribution for a reading app that shaped infrastructure priorities
- Turbo Native enabled a single developer to ship across web, iOS, and Android; the web view-backed model trades native performance for extreme development leverage
- In-app purchases introduced a significant complexity: reconciling Apple/Google purchase receipts with Rails user accounts requires careful data syncing between external payment systems and the Rails backend

## Background Jobs and Read/Write Splitting

- Sidekiq handles background job processing — essential at scale for deferring expensive operations (recommendation calculations, notifications, import processing) off the request path
- Makara provides database proxy-level master/replica load splitting, distributing read queries to replicas without requiring application-level routing logic
- These two tools together (Sidekiq + Makara) represent the primary scaling levers before moving to a distributed database

## Scaling the Database: Migrating from Postgres to YugabyteDB

- The StoryGraph ran on Heroku initially; as the user base grew toward millions, horizontal scalability became the bottleneck
- Migrated from standard Postgres to YugabyteDB — a Postgres-compatible distributed SQL database designed for horizontal scaling
- YugabyteDB's Postgres compatibility meant the Rails stack required minimal changes; ActiveRecord and existing queries continued to work
- CTEs (Common Table Expressions) are used to optimize queries across the distributed data nodes — a pattern that becomes important when data is sharded across multiple nodes
- The migration was a deliberate infrastructure investment made by a solo developer — evidence that a single person can own and execute a major database migration at this scale

## Moving Off Heroku and Owning Infrastructure

- The move off Heroku was part of the same scaling inflection point — Heroku's per-dyno pricing model and constraints become expensive at significant traffic levels
- Nadia chose to manage more of the infrastructure herself rather than hire a team to handle it — a conscious trade-off between operational complexity and headcount complexity
- Moving from managed Heroku to self-managed infrastructure with YugabyteDB is a significant operational step; taking it as a solo developer required deep familiarity with the stack

## The Solo Developer Choice

- Running StoryGraph solo is a deliberate, ongoing choice — not a temporary phase before hiring
- At 27:10 Nadia discusses why she continues to operate without a team despite the scale; the reasoning reflects a preference for autonomy and control over growth for its own sake
- Building trust with users during long development sprints (between major feature releases) requires explicit communication; the solo model demands a different cadence of expectation-setting
- Linear is used for project management — a lightweight tool appropriate for a single-person operation managing a complex product roadmap
- *Ruby Under a Microscope* by Pat Shaughnessy is cited as valuable reading for understanding Ruby internals — useful context for debugging performance issues at scale
