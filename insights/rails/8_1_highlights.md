---
type: insight
title: Rails 8.1 Highlights
description: "Resumable jobs (Continuations), structured Event Reporting, local CI via bin/ci, Markdown rendering, credentials-fetch for Kamal, deprecatable associations"
resource: "https://guides.rubyonrails.org/8_1_release_notes.html"
tags:
- rails
- release-notes
- active-job
- observability
- ci
timestamp: "2026-07-17"
source:
  type: guide
  title: Ruby on Rails 8.1 Release Notes
  author: Rails Core Team
  url: https://guides.rubyonrails.org/8_1_release_notes.html
  date: 2025-10-22
---

# Rails 8.1 Highlights

Rails 8.1 leans into operability: jobs that survive restarts, machine-readable events, and CI you run on your own laptop. Curated from the official release notes.

## Headline Features

### Active Job Continuations
- Break a long job into discrete `step`s; after a restart execution resumes from the last completed step instead of the beginning.
- Directly motivated by Kamal deploys, which give job containers ~30s to shut down by default.
- Steps support a **cursor** saved on interruption: `step.advance! from: record.id` inside `find_each(start: step.cursor)`.
- `include ActiveJob::Continuable`; steps can be block form or method form.

```ruby
class ProcessImportJob < ApplicationJob
  include ActiveJob::Continuable

  def perform(import_id)
    @import = Import.find(import_id)
    step :initialize do
      @import.initialize
    end
    step :process do |step|
      @import.records.find_each(start: step.cursor) do |record|
        record.process
        step.advance! from: record.id
      end
    end
    step :finalize   # method form
  end

  private
    def finalize = @import.finalize
end
```

### Structured Event Reporting
- `Rails.event` — unified interface for machine-readable structured events, complementing the human-readable logger.
- Emit: `Rails.event.notify("user.signup", user_id: 123, email: "...")`.
- **Tags**: `Rails.event.tagged("graphql") { ... }` adds `tags: { graphql: true }`.
- **Context**: `Rails.event.set_context(request_id: "abc123", shop_id: 456)` attaches to all events.
- Register **subscribers** implementing `#emit(event)` to control serialization/output — the event hash carries `:name`, `:payload`, `:source_location`, tags, and context.

### Local CI (`bin/ci`)
- CI declaration DSL in `config/ci.rb`, run by `bin/ci` — treats a many-core dev machine as the CI runner, removing the cloud CI dependency for small/mid apps.
- `CI.run do step "...", "..." end`; `success?` / `failure` gate a final step.
- Optional `gh signoff` integration (via `basecamp/gh-signoff`) makes a passing local CI run a merge prerequisite.

### Markdown Rendering
- First-class Markdown responses: `format.md { render markdown: @page }` where the object responds to `#to_markdown`.
- Framed as embracing Markdown as "the lingua franca of AI" — serve the same resource as HTML or MD.

### Command-line Credentials Fetching
- `rails credentials:fetch kamal.registry_password` — Kamal can pull secrets straight from the encrypted Rails credentials store.
- Low-fi alternative to an external secret store; only needs the master key present.

### Deprecated Associations
- Mark an association deprecated to surface lingering usage before removal: `has_many :posts, deprecated: true`.
- Catches direct calls (`author.posts`, `author.posts = ...`), `preload(:posts)`, nested attributes, etc.
- Three modes: `:warn` (default), `:raise`, `:notify`; backtraces optional (off by default), location always reported.

### Registry-Free Kamal Deployments
- Kamal 2.8 uses a **local registry** by default for simple deploys — no Docker Hub / GHCR needed to get a first Hello World deploy live. Remote registry still recommended at scale.

## Notable Changes

- **Verbose redirect logs in development** for new apps (`config.action_dispatch.verbose_redirect_logs = true` to opt in on existing apps).
- **`schema.rb` columns are now sorted alphabetically** — expect a one-time large diff on first dump.

## Deprecations & Removals (upgrade watch-list)

- **Deprecated** — order-dependent finders (`#first` etc.) without an explicit `order`; `insert_all`/`upsert_all` with unpersisted associated records; `WITH`/`WITH RECURSIVE`/`DISTINCT` in `update_all`; `ActiveRecord::Base.signed_id_verifier_secret` → `Rails.application.message_verifiers`; `String#mb_chars` & `ActiveSupport::Multibyte::Chars`; `ActiveSupport::Configurable`; `config.active_support.to_time_preserves_timezone`; built-in `sidekiq` adapter (now the gem's); Trix-specific Action Text classes.
- **Removed** — `bin/rake stats`, `STATS_DIRECTORIES`; `:azure` Active Storage service; `:retries` SQLite3 option; `:unsigned_float`/`:unsigned_decimal` MySQL columns; `Benchmark.ms` (moved to `benchmark` gem); semicolon query-string separator; leading-bracket param-name skipping.

## Upgrade Notes

- Upgrade to **Rails 8.0 first**, confirm the app runs, then move to 8.1.
- `to_time` now always preserves the receiver's timezone (system-local behavior removed) — audit any `to_time` relying on the old semantics.

→ Full details: [Rails 8.1 Release Notes](https://guides.rubyonrails.org/8_1_release_notes.html)
