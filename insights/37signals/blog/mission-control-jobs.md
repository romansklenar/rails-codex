---
title: Mission Control -- Jobs
description: "Dashboard for background job monitoring, queue management, bulk retry/discard, recurring tasks"
source:
- type: blog
  title: Mission Control -- Jobs
  author: Rosa Gutierrez
  url: https://dev.37signals.com/mission-control-jobs/
  date: '2024-01-30'
- type: blog
  title: Mission Control -- Jobs 1.0 released
  author: Rosa Gutierrez
  url: https://dev.37signals.com/mission-control-jobs-v1-0/
  date: '2024-12-04'
tags:
- rails
- jobs
---

# Mission Control -- Jobs

Dashboard and operational tooling for background jobs. Works with Solid Queue and Resque.

## Core Features

- **Queue management** -- pause, resume, and inspect queues from a web UI
- **Job filtering** -- filter by job class, queue name, status
- **Bulk operations** -- retry or discard jobs in batches (safe by default, using delays to avoid overwhelming the system)
- **Recurring task management** -- view and trigger Solid Queue recurring tasks on demand
- **Failed job diagnostics** -- cleaned backtraces for faster debugging
- **Immediate dispatch** -- push scheduled or blocked jobs to run now

## Safety-First Design

- Batch operations use delays and pagination to avoid loading millions of jobs at once
- Operations are "safe by default" -- designed to prevent accidental mass actions

## Authentication

- Basic HTTP authentication enabled by default (1.0+)
- Access is initially closed unless explicitly configured or disabled
- Mount in routes with authentication constraint:

```ruby
# config/routes.rb
authenticate :user, ->(u) { u.admin? } do
  mount MissionControl::Jobs::Engine, at: "/jobs"
end
```

## Integration with Solid Queue

- Extends Active Job with a query API for filtering and managing jobs
- Recurring tasks visible and executable from the dashboard
- Plans to upstream extensions to Active Job and become a Rails default

## When to Use

- You run Solid Queue and need operational visibility into job state
- You need to retry/discard failed jobs without a Rails console
- You want a production dashboard for recurring tasks
