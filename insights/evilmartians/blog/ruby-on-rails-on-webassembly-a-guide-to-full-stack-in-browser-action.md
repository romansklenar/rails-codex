---
title: "Ruby on Rails on WebAssembly: A Guide to Full-Stack In-Browser Action"
description: "Complete guide to compiling and running a full Rails application in the browser using ruby.wasm, wasmify-rails, SQLite Wasm, and virtual filesystem packaging with wasi-vfs"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/ruby-on-rails-on-webassembly-a-guide-to-full-stack-in-browser-action"
  date: '2025-02-18'
tags: [webassembly, wasm, ruby, rails, ruby-wasm, wasi, sqlite, in-browser, full-stack]
---

# Ruby on Rails on WebAssembly: A Guide to Full-Stack In-Browser Action

A step-by-step guide to running a fully functional Rails application — Puma server, ActiveRecord, SQLite database — entirely inside a browser tab using WebAssembly, with no backend server required.

## WebAssembly and Ruby Fundamentals

- Ruby (MRI) gained WASI 0.1 support in 2022 — the Ruby interpreter itself can be compiled to `.wasm`
- WASI (WebAssembly System Interface) provides a POSIX-like syscall layer for WASM modules running outside the browser
- `ruby.wasm` project maintains pre-built WASM binaries of CRuby including the standard library
- WASI 0.2 introduces the Component Model — still alpha status; the guide uses WASI 0.1
- Browser execution uses a JavaScript shim that maps WASI syscalls to browser APIs (fetch, localStorage, etc.)

## The wasmify-rails Gem

- `wasmify-rails` (Evil Martians) is the orchestration gem for building Rails-on-WASM bundles
- Add to `Gemfile`: `gem 'wasmify-rails'` — provides Rails generators and the `wasmify` CLI
- `rails wasmify:install` generates configuration files and patches needed for WASM compilation
- `rails wasmify:build` executes the two-step build: `rbwasm build` followed by `wasi-vfs pack`
- The gem patches Puma and Rack internals to run synchronously inside the WASM event loop
- Compatible with Rails 7.1+ and Ruby 3.2+; requires `ruby-wasm-wasi` gem as a dependency

## Build Process: Step 1 — rbwasm

- `rbwasm build` cross-compiles the Ruby interpreter and all gems to a single `ruby.wasm` binary
- Downloads Ruby source for the target version, then compiles using the WASI SDK toolchain
- Each gem that has C extensions must be compiled for `wasm32-wasi` target — many are pre-built in registries
- Gems with incompatible C extensions (e.g., native DB drivers) must be excluded or replaced with WASM-compatible alternatives
- Output: a monolithic `ruby.wasm` binary (~tens of MBs) containing interpreter + gems + stdlib
- Build cache: subsequent builds skip unchanged components — initial build takes 5–15 minutes

## Build Process: Step 2 — wasi-vfs pack

- `wasi-vfs` embeds directories into the WASM binary as a virtual filesystem (VFS)
- `wasi-vfs pack ruby.wasm --mapdir /app::./app --mapdir /config::./config ...` — maps host dirs into WASM VFS
- Application files (models, controllers, views, config) become part of the binary — truly self-contained
- Output: a single `app.wasm` file that contains interpreter + gems + application code + assets
- The WASM module's file reads go through the VFS layer — no network requests needed for application files
- Asset files (JS, CSS) can be pre-built and embedded; Sprockets/Propshaft pipelines run at build time

## Database: SQLite Wasm

- Standard `sqlite3` gem (C extension) is replaced with a WASM-compatible SQLite adapter
- `wasmify-rails` provides an `ActiveRecord` adapter backed by `SQLite3 Wasm` (compiled to WASM)
- SQLite Wasm stores data in the browser's `Origin Private File System` (OPFS) — persistent across page reloads
- Migrations run normally via `ActiveRecord::Tasks::DatabaseTasks.migrate` at application boot inside WASM
- Data is isolated per browser origin — each site/port gets its own SQLite database
- For ephemeral demos, use in-memory SQLite (`database: ':memory:'`) — data resets on page reload

## Rack and Puma Integration

- Rails' Rack stack runs inside the WASM module — requests are processed synchronously
- A JavaScript fetch interceptor routes HTTP requests to the in-WASM Rack application
- `Puma` is patched by `wasmify-rails` to run in single-threaded synchronous mode (no threads in WASM)
- The JS service worker or main thread calls `wasm.instance.exports.rack_handle(env)` for each request
- Response body, status, and headers are serialized back from WASM memory to JavaScript
- Asset requests (CSS, JS, images) bypass the Rack handler and are served from embedded VFS or a CDN

## Unsupported Rails Features in WASM

- No background jobs — Sidekiq, GoodJob require threads/processes unavailable in browser WASM
- No ActionCable WebSockets — browser WASM has no TCP socket access (use Server-Sent Events workaround)
- No file uploads to disk — use in-memory storage or browser File API for WASM-side file handling
- ActionMailer: can generate emails in-memory but cannot send (no SMTP) — save to a log or display in UI
- No multi-process features — `fork`, `Process.spawn` are unavailable in WASI 0.1
- Some gems with system-level C extensions will fail to compile for WASM — audit with `rbwasm` dry-run

## Deployment and Distribution

- The final `app.wasm` can be hosted on any static file host (CDN, GitHub Pages, S3, Vercel)
- Serve with `Content-Type: application/wasm` and `Cross-Origin-Embedder-Policy: require-corp` headers
- A minimal HTML shell loads the WASM module via `WebAssembly.instantiateStreaming(fetch('app.wasm'), ...)`
- `wasmify-rails` provides a JavaScript bootstrap module that wires fetch interception and WASM initialization
- Total bundle size: typically 30–80MB depending on gem count — gzip compression helps significantly
- Use HTTP range requests for large WASM files to support streaming instantiation in browsers

## Use Cases and Limitations

- Interactive demos and tutorials — run Rails apps without provisioning a server
- Offline-capable tools — works without network once loaded (PWA pattern)
- Educational environments — `TutorialKit.rb` builds interactive Rails tutorials using this stack
- Not suitable for production multi-user apps — no shared database, no persistent sessions across users
- Performance: Ruby in WASM is slower than native (~5–10x) — acceptable for demos, not for high-throughput apps
- `wasmify-rails` open-sourced at `evilmartians/wasmify-rails` on GitHub
