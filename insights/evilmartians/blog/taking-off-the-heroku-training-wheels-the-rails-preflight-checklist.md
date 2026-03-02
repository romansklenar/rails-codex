---
title: "Taking Off the Heroku Training Wheels: The Rails Preflight Checklist"
description: "A comprehensive deployment checklist for Rails teams going live on Heroku, covering pipelines, Procfiles, slugs, review apps, CDN configuration, and production-readiness"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/taking-off-the-heroku-training-wheels-the-rails-preflight-checklist"
  date: '2022-08-09'
tags: [heroku, rails, deployment, infrastructure, review-apps, cdn, sidekiq, active-storage]
---

# Taking Off the Heroku Training Wheels: The Rails Preflight Checklist

A practical checklist for small Rails teams deploying to Heroku for the first time, covering pipelines, processes, review apps, CDN, and SEO configuration.

## Heroku Alternatives to Know

- `Render`, `Fly.io`, `Hatchbox` are solid alternatives worth evaluating before committing to Heroku
- `Kuby` gem enables managed Kubernetes clusters for Rails apps as another alternative
- Heroku simplifies DX at the cost of higher bills at scale — Heroku is built on top of AWS

## Pipelines Setup

- Use Heroku Pipelines from the start: group apps into `staging`, `production`, (and optionally `development` / `review`) stages
- Create a production application early to configure DNS/SSL before launch day; use maintenance mode (`heroku maintenance:on`) while in development
- Enable automatic deploy for staging to track the `main` branch at all times
- For production: use `Promote to production` feature — code goes live immediately, no rebuild needed
- Caution with `Promote to production`: build-time env vars (e.g., API keys injected during `assets:precompile`) differ between staging and production
- Use `do-not-build` custom buildpack to prevent non-promotion deployments when promotion is the sole deploy method

## Making Rails Heroku-Ready

- `heroku-buildpack-ruby` auto-detects configuration and add-ons (e.g., database) on initial push
- Ensure `production.rb` respects `RAILS_LOG_TO_STDOUT` and `RAILS_SERVE_STATIC_FILES` env vars set by Heroku
- Enable Dyno Metadata: `heroku labs:enable runtime-dyno-metadata` to access `HEROKU_APP_NAME`, `HEROKU_RELEASE_VERSION`, etc.

## Procfile and Process Configuration

- Define `web` and `worker` processes explicitly in `Procfile`; do not rely on implicit defaults
- Use the `env X=Y` trick in the `Procfile` to set per-process env vars without affecting global config:
  ```
  web: bundle exec rails server -p $PORT -b 0.0.0.0
  worker: env RAILS_MAX_THREADS=$WORKER_MAX_THREADS bundle exec sidekiq
  ```
- Set `WORKER_MAX_THREADS=10` in Heroku config; use `RAILS_MAX_THREADS` in `sidekiq.yml` via ERB interpolation
- Sidekiq typically needs 10–20 threads; Active Record pool size should match thread count

## Release Phase with Custom Rake Tasks

- Use Heroku Release Phase (command runs before app goes live) for database migrations
- Prefer a custom `heroku:release` Rake task over running `rails db:migrate` directly:
  ```ruby
  # lib/tasks/heroku.rake
  namespace :heroku do
    task release: ["db:migrate"]
  end
  ```
- Extend `heroku:release` for data migrations, Slack notifications, or skipping migrations for non-Rails dynos (e.g., AnyCable gRPC)

## Slug Size Management

- Heroku slug max size is 500MB; exceeding it blocks deployment
- Add `.slugignore` to exclude repo files not needed at runtime (e.g., `dockerdev`, `.github`, `docs`)
- Install `heroku-buildpack-post-build-clean` and add `.slug-post-clean` to remove build-only artifacts (e.g., `node_modules`, `tmp`) after build

## Instrumentation Without Full APM

- Enable Ruby runtime metrics (official Heroku docs) for built-in performance visibility
- In production, add the `barnes` gem and initialize it in `puma.rb` with `Barnes.start` inside `before_fork`
- Free New Relic tier covers basic monitoring and log aggregation for small setups

## Class-Based Configuration with anyway_config

- Use `anyway_config` gem for class-based configuration; avoids raw env var access scattered through code
- Define `HerokuConfig` to access `HEROKU_APP_NAME`, `HEROKU_RELEASE_VERSION`, `HEROKU_PR_NUMBER`, etc.
- Define `MyAppConfig` for hostname, port, `ssl?`, `asset_host`, `seo_enabled` settings
- Compute derived values (e.g., `asset_host` from SSL + host) inside config classes
- Set `action_mailer.default_url_options` from `MyAppConfig.host` rather than raw env vars

## Review Apps Configuration

- Heroku review apps provide per-PR isolated environments — most powerful feature for teams
- `app.json` file controls buildpacks, dyno types, add-ons, and lifecycle scripts for review apps
- Store sensitive config (API keys) in pipeline settings (`Review apps config vars`), not in `app.json`
- Add `config/environments/staging.rb` (`require_relative "production"` + overrides) and set `RAILS_ENV=staging` for staging/review
- Create staging credentials: `rails credentials:edit -e staging`
- Set `DISABLE_DATABASE_ENVIRONMENT_CHECK=1` in review app config vars to allow schema loads
- Use `async` Active Job adapter in review apps to skip Sidekiq worker dynos:
  ```ruby
  config.active_job.queue_adapter = config.heroku.review_app? ? :async : :sidekiq
  ```

## Review App Lifecycle Hooks

- Define `heroku:review:setup` (runs `db:schema:load` + `db:seed`) and `heroku:review:destroy` Rake tasks
- Map to `postdeploy` and `pr-predestroy` scripts in `app.json`
- Use `db:schema:load` instead of `db:migrate` in review app setup for speed
- `heroku:review:destroy` can clean up S3 buckets, search indexes, or other resources

## Sharing Resources with Review Apps

- Reuse the staging S3 bucket (Bucketeer add-on or direct AWS) across all review apps — Active Storage uses UUIDs, no collision risk
- Reuse ElasticSearch instances using `app_name` as a namespace prefix
- Reuse Redis instances across review apps safely

## DNS, SSL, and CDN

- Configure a CDN to serve all application traffic — prevents static assets from occupying Rails (Puma) threads
- Cloudflare: easiest option (free plan), handles DNS + SSL + distribution in a few clicks
- CloudFront: more flexible, better for advanced users with time to configure
- Use `<xxx>.herokudns.com` in CNAME records, not `<yyy>.herokuapp.com`
- Use Cloudflare Full encryption mode + Origin certificate between CDN and Heroku
- Set cache headers in `production.rb`:
  ```ruby
  config.public_file_server.headers = {
    "Cache-Control" => "public, s-maxage=31536000, max-age=15552000",
    "Expires" => 1.year.from_now.to_formatted_s(:rfc822)
  }
  config.force_ssl = true
  ```

## SEO and Crawler Control

- Add `Disallow: /` to `robots.txt` for staging/review apps to prevent indexing
- Mount a dynamic Rack app at `get "robots.txt"` to serve environment-aware robots content
- Add `X-Robots-Tag: none` response header via `config.action_dispatch.default_headers` for all non-SEO environments

## Final Production Checklist Items

- Add `rack-timeout` gem to avoid Heroku H12 timeout errors
- Enable Preboot for zero-downtime deployments (watch for database/Redis connection limit increases)
- Use Rails Autoscale calculator before enabling Preboot to size connection pools correctly
