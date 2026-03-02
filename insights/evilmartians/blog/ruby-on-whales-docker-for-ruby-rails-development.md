---
title: "Ruby on Whales: Dockerizing Ruby and Rails Development"
description: "Complete Docker development environment setup for Ruby on Rails using .dockerdev directory structure, Docker Compose, and the dip CLI for simplified container interaction"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development"
  date: '2022-08-04'
tags:
- docker
- rails
- ruby
- development-environment
- docker-compose
- dip
- devops
- containers
---

# Ruby on Whales: Dockerizing Ruby and Rails Development

Evil Martians' production-grade Docker development environment configuration for Ruby on Rails, featuring a `.dockerdev/` structure, multi-stage Dockerfile, Docker Compose service registry, and the `dip` CLI for ergonomic container interaction.

## Core Architecture

- All Docker-related files live in a hidden `.dockerdev/` directory at the project root — keeps root directory clean
- `compose.yml` acts as a services registry, not an `up` launcher — services are started on-demand via `dip`
- `Dockerfile` inside `.dockerdev/` defines the development image build — not the same as a production Dockerfile
- Separate services for `web`, `sidekiq`, `postgres`, `redis`, and optionally `chrome` (for system tests)
- Gems and node modules stored in named Docker volumes, not bind-mounted — prevents cross-OS permission issues

## Dockerfile Structure

- Uses `ARG RUBY_VERSION`, `ARG PG_MAJOR`, `ARG NODE_MAJOR`, `ARG BUNDLER_VERSION`, `ARG YARN_VERSION`
- Base image: `ruby:${RUBY_VERSION}-slim` (Debian-based slim variant)
- Common system deps installed via `apt-get`: `build-essential`, `curl`, `git`, `libpq-dev`, `libyaml-dev`
- NodeSource repo added for modern Node.js; PostgreSQL client installed to match `PG_MAJOR`
- `BUNDLE_PATH=/bundle` env var routes gems to a named volume mount point
- `ENV HISTFILE /app/.bash_history` persists shell history across container restarts via bind mount

## Docker Compose Configuration

- `x-app: &app` YAML anchor defines shared config (build context, env, volumes) reused across services
- `environment:` block reads from `.env` file — `RAILS_ENV`, `NODE_ENV`, `DATABASE_URL` etc.
- Named volumes: `bundle`, `node_modules`, `rails_cache`, `bootsnap` — each persisted between restarts
- `web` service overrides `command: bash` so it doesn't auto-start Rails — `dip rails s` starts it explicitly
- `postgres` service uses `postgres:${PG_MAJOR}-alpine` pinned image with a named volume for data persistence
- `chrome` service runs `browserless/chrome` or `selenium/standalone-chrome` for remote system tests

## The dip CLI Tool

- `dip` (Docker Interaction Program) wraps `docker compose run` with a project-level `dip.yml` config
- Install: `gem install dip` (not added to `Gemfile` — it's a host-level tool)
- `dip.yml` defines named commands: `dip rails`, `dip rake`, `dip rspec`, `dip bash`, `dip psql`
- `dip provision` runs the full setup: `dip compose build`, then `bundle install`, `yarn install`, `db:setup`
- `dip rails s` starts the Rails server interactively (not daemonized) — debugger attachable via TTY
- `dip compose up -d postgres redis` starts backing services in the background; app runs on-demand

## Environment Variables and Secrets

- `.env` file at project root (gitignored) stores local overrides for `RAILS_ENV`, `DATABASE_URL`, API keys
- `.env.example` is committed with placeholder values — new developers copy to `.env` and fill in
- `compose.yml` uses `env_file: .env` to inject variables into all service containers
- `DATABASE_URL` constructed from `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB` service vars
- Never hardcode credentials in `compose.yml` — always reference env vars or `.env` file

## Bundle and Gem Caching

- `BUNDLE_PATH=/bundle` inside the container maps to the named `bundle` volume
- `bundle install` is run in `dip provision`, not inside the Dockerfile `RUN` layer — avoids stale gem layers
- `gem install bundler -v ${BUNDLER_VERSION}` runs in Dockerfile to pin bundler version
- Bootsnap cache stored in a named `bootsnap` volume: `BOOTSNAP_CACHE_DIR=/bundle/bootsnap`
- On Gemfile changes, run `dip bundle install` — no image rebuild needed since gems go to the volume

## Development Workflow Commands

- `dip bash` — opens interactive shell inside the app container with full env loaded
- `dip rails c` — Rails console with correct environment variables and database connection
- `dip rspec spec/models/` — runs specs inside container; outputs to host terminal
- `dip psql` — connects to the PostgreSQL container directly via `psql` CLI
- `dip rails db:reset` — resets development database; also available as `dip rake db:reset`
- Hot reload works natively: code changes on host bind-mount are reflected instantly (no restart needed)

## System Tests with Remote Chrome

- Add a `chrome` service to `compose.yml` using `browserless/chrome` or `selenium/standalone-chrome`
- Set `BROWSER_URL: http://chrome:4444/wd/hub` (Selenium) or `CUPRITE_URL: http://chrome:9222` (Cuprite/CDP)
- The `web` service and `chrome` service share a Docker network — `Capybara.app_host` must use the container IP
- Bind-mount `tmp/screenshots` to a host directory to inspect failure screenshots without entering the container
- Run system tests via `dip rspec spec/system/` — the web server and Chrome both run in containers

## Onboarding with the Generator

- `rails app:template LOCATION=https://railsbytes.com/script/z5OsoB` applies the Ruby on Whales template
- The template creates `.dockerdev/`, `dip.yml`, and the `compose.yml` interactively via prompts
- Prompts ask for Ruby version, Node.js version, PostgreSQL version, and optional Redis/Sidekiq inclusion
- After running the template: `dip provision` sets up the full environment in one command
- The `evilmartians/ruby-on-whales` GitHub repo contains the canonical example configuration
