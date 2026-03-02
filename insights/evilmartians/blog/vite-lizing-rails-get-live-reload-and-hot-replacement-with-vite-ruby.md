---
title: "Vite-lizing Rails: Get Live Reload and Hot Replacement with Vite Ruby"
description: "Migrating a Rails app from jsbundling/esbuild to Vite Ruby for live reload, Stimulus HMR, and full-reload on ERB changes, including Dockerized and hybrid dev setups"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/vite-lizing-rails-get-live-reload-and-hot-replacement-with-vite-ruby"
  date: '2022-06-28'
tags:
- vite
- rails
- hmr
- live-reload
- stimulus
- docker
- webpack
- javascript
- dx
---

# Vite-lizing Rails: Get Live Reload and Hot Replacement with Vite Ruby

A practical guide to migrating a Rails 7 app from jsbundling-rails/esbuild to Vite Ruby, gaining Stimulus HMR, full-reload on ERB changes, and a clean Dockerized development workflow.

## Rails Asset Pipeline Context

- Sprockets introduced asset compilation to Rails; Webpacker followed during the frontend revolution
- Rails 7 retired Webpacker; new options: importmaps, `jsbundling-rails`, `cssbundling-rails`, `tailwindcss-rails`
- All official Rails 7 options are build-oriented (Sprockets-like) — no instant feedback during development
- `webpack-dev-server` provided instant feedback; the Rails 7 ecosystem lacks a direct equivalent
- Vite fills this gap: "Instant Server Start" and "Lightning Fast HMR" as core value propositions

## Migration from jsbundling-rails to Vite Ruby

- Install gem: add `vite_rails` to `Gemfile`
- Run installation: `bundle exec vite install` — sets up `vite.json`, `vite.config.ts`, updates Rails helpers
- Replace `javascript_include_tag` with `vite_javascript_tag`; replace `stylesheet_link_tag` with `vite_stylesheet_tag`
- Update `vite.json`: set `sourceCodeDir` to match your JS directory (e.g., `frontend` instead of `app/javascript`)
- Vite Ruby's auto-build feature compiles assets on demand without running a dev server — works like Sprockets in development

## Fixing Glob Imports for Stimulus Controllers

- `esbuild-rails` supports glob imports natively (`import './**/*_controller.js'`), but Vite does not support this syntax
- Vite replacement: `import.meta.glob("./**/*_controller.js", { eager: true })` returns a path-to-module map
- Manual registration loop: iterate the map, extract controller name via regex, call `application.register(name, module.default)`
- Preferred: use `stimulus-vite-helpers` plugin with `registerControllers(application, controllers)` — single-line replacement
- For Vite < 5.0: use `import.meta.globEager` instead of `import.meta.glob` with `{ eager: true }`

## Auto-Build Mode vs. Dev Server Mode

- Auto-build mode: Vite Ruby compiles one output file per entrypoint on first request — no separate process needed
- Dev server mode: run `bin/vite dev` to start a Vite development server that serves uncompiled ES modules
- Dev server loads only the modules needed for the current page — no full bundle on every change
- Dev server uses Rollup for source processing and esbuild for pre-compiling third-party NPM packages
- "Instant Server Start": the server starts immediately; modules are compiled on first import, not upfront

## Hot Module Replacement (HMR)

- HMR: updates specific JavaScript modules in the running browser without a full page reload — preserves application state
- Requires framework-compatible code; Vue and React support HMR natively; Stimulus also supports HMR
- Add `vite-plugin-stimulus-hmr` to `vite.config.ts` plugins: `StimulusHMR()`
- With Stimulus HMR: editing a controller file reconnects the controller in-place without page reload; input field values preserved

## Live Reload for ERB Templates

- HMR cannot hot-replace HTML template changes (not JS modules)
- Use `vite-plugin-full-reload` for full-page reload when ERB files change
- Configuration: `FullReload(["app/views/**/*.erb"])` — watches all ERB templates
- Final `vite.config.ts` plugins array: `[RubyPlugin(), StimulusHMR(), FullReload(["app/views/**/*.erb"])]`

## Dockerizing Vite

- Add Docker volumes to persist Vite-compiled assets across container restarts:
  - `vite_dev:/app/public/vite-dev`
  - `vite_test:/app/public/vite-test`
- Define a `vite` Docker Compose service: same backend image, command `./bin/vite dev`, exposes port 3036
- Connect Rails to the Vite service via environment variable: `VITE_RUBY_HOST: ${VITE_HOST:-vite}`
- The `${VITE_HOST:-vite}` default allows overriding for hybrid local/Docker setup

## Hybrid Local Vite + Dockerized Rails

- Frontend teams often need local tooling (linters, git hooks, IDE extensions) that doesn't work well in Docker
- Solution: run Vite locally, Rails in Docker, connected via `host.docker.internal`
- Isolate `vite_rails` gem in a separate `gemfiles/frontend.gemfile` with only Vite dependencies
- Include it from main `Gemfile` using `eval_gemfile "gemfiles/frontend.gemfile"` — ensures helpers available in production
- Custom `bin/vite` wrapper: sets `BUNDLE_GEMFILE=./gemfiles/frontend.gemfile`, auto-installs, delegates to `bundle exec vite $@`
- Launch hybrid mode: `VITE_HOST=host.docker.internal dip rails s`
- Required: set `"host": "0.0.0.0"` in `config/vite.json` so the local Vite server is accessible from Docker containers
- Dip shortcut: `dip frontend rails` runs Rails server pointed at locally-running Vite dev server

## Changelog

- v1.1.0 (2024-05-21): Upgraded to Vite 5 compatibility (`import.meta.glob` with `{ eager: true }` instead of `import.meta.globEager`)
- `vite-plugin-ruby` is the core npm bridge between Vite and the `vite_rails` gem configuration
