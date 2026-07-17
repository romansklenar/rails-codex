---
type: insight
title: "Vite on Rails Without the Proxy"
description: "How rails_vite integrates the Vite dev server with Propshaft using a redirecting stub file in app/assets/builds instead of a Rack proxy, plus an optional gem mode that emits vite_tags from a JSON dev-server descriptor."
resource: "https://evilmartians.com/chronicles/now-you-see-it-vite-on-rails-without-the-proxy"
tags: [rails, vite, propshaft, asset-pipeline, hmr, jsbundling, tailwind, frontend, build-tools, javascript, css, stimulus]
timestamp: "2026-07-17"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Svyatoslav Kryukov"
  url: "https://evilmartians.com/chronicles/now-you-see-it-vite-on-rails-without-the-proxy"
  date: '2026-04-14'
---

# Vite on Rails Without the Proxy

`rails_vite` bridges Vite's dev server and Propshaft's file-on-disk contract without a Rack proxy — either invisibly via a redirecting stub file, or explicitly via a `vite_tags` gem helper that reads a JSON descriptor.

## The Core Problem

- **Vite runs a dev server**; in development there are no files on disk — just an HTTP server compiling modules on the fly and pushing updates over a WebSocket.
- **Propshaft** (Rails' asset pipeline) expects files on disk in `app/assets/builds/`; it fingerprints whatever it finds and serves it.
- Prior solutions (`vite_ruby`/Vite Ruby) reconciled the two with a **Rack proxy, a shared config file, and a binstub** — extra moving parts the author considered more ceremony than the problem warranted.
- Laravel's integration is the inspiration: a Vite plugin writes the dev-server address to a file, a server-side helper reads it — no proxy, no shared config, no binstub.

## Why Vite At All (over importmaps / jsbundling)

- **HMR for JS** — React/Vue components update without losing state; Stimulus controllers hot-reload via `vite-plugin-stimulus-hmr`.
- **Instant CSS feedback** — edit a color, styles swap with no page reload and no flash of unstyled content; modals stay open, scroll position preserved.
- **One process** — Vite handles JavaScript, CSS, PostCSS, and Tailwind in a single dev server, replacing the separate JS + CSS watchers of a `jsbundling-rails` + Tailwind Procfile.
- **Code splitting for free** — dynamic `import()` splits bundles automatically.
- **Ecosystem** — first-class React/Vue/Svelte plugins, built-in TypeScript/JSX; Vite 8 ships **Rolldown**, a Rust-based bundler for dramatically faster production builds.
- Propshaft + importmaps remains a perfectly good default; none of this requires abandoning Rails conventions.

## jsbundling Mode: The Stub Mechanism

- **Key realization:** Propshaft never *reads* the asset file — it only needs it to *exist* so it can resolve the name and serve it. The browser executes the content. So the content can point elsewhere.
- The plugin plants a stub in `app/assets/builds/application.js` that redirects the browser from Propshaft's world to Vite's:

```js
// rails-vite dev stub – DO NOT EDIT
import "http://localhost:5173/@vite/client";
import "http://localhost:5173/app/javascript/application.css";
import "http://localhost:5173/app/javascript/application.js";
```

- Propshaft serves the stub; the browser loads it as a module script, follows the `import`s to Vite's dev server, and from there Vite owns the experience (HMR, fast refresh). Neither side compromises.
- The stub replaces the whole vite_ruby layout ceremony (`vite_client_tag`, `vite_react_refresh_tag`, `vite_javascript_tag` in the right order) — `@vite/client`, the React Refresh preamble, and entry points are all handled in one place.
- **When Vite stops**, the stubs are cleaned up; if Rails is still running you get a loud `MissingAssetError`, not a silent failure.

## jsbundling Mode: The CSS Trick

- The stub's `import "http://localhost:5173/app/javascript/application.css"` imports CSS *from JavaScript*.
- Vite responds not with raw CSS but with a tiny JS module that injects a `<style>` tag into the DOM.
- The on-disk `application.css` stub in `app/assets/builds/` is **empty** — it exists only so `stylesheet_link_tag` doesn't raise.
- Because the CSS lives in Vite's module graph via the JS import, `@vite/client` swaps the `<style>` tag on every stylesheet edit — CSS HMR for free.
- **Production differs entirely**: Vite builds real CSS files, served via normal `<link>` tags through Propshaft.

## jsbundling Mode: The Production Double

- In production Vite outputs content-hashed chunks to `public/assets/`; the plugin writes a **double** (`app/assets/builds/application.js`) that re-exports the hashed bundle.
- Propshaft sees the expected name; the browser follows the import to the real file — over HTTP/2 that's one extra request on the same connection (negligible for most apps).
- The double also fixes **module identity**: Propshaft fingerprints filenames (`application-abc123.js`), but the same module loaded from two paths becomes two modules with separate state. The double chains both the fingerprinted path and the original name to the same content-hashed chunk.

## Migration: esbuild → Vite

Three changes — an npm package, a config file, a Procfile update:

```bash
npm install -D rails-vite-plugin vite
```

```ts
// vite.config.ts
import { defineConfig } from "vite";
import jsbundling from "rails-vite-plugin/jsbundling";
export default defineConfig({
  plugins: [
    jsbundling(),
  ],
});
```

```diff
web: bin/rails server -p 3000
- js: yarn build --watch
+ vite: npx vite
```

- **Tailwind via `cssbundling-rails`**: swap `@tailwindcss/cli` for `@tailwindcss/vite`, add it to the Vite config, drop `cssbundling-rails` from the Gemfile — the separate CSS watcher goes away.

```ts
// vite.config.ts
import { defineConfig } from "vite";
import jsbundling from "rails-vite-plugin/jsbundling";
import tailwindcss from "@tailwindcss/vite";
export default defineConfig({
  plugins: [
    jsbundling(),
    tailwindcss(),
  ],
});
```

- **Deployment is unchanged** — `jsbundling-rails` still hooks the build into `assets:precompile`; just set `"build": "vite build"` in `package.json`. CI, Docker, Kamal/Capistrano/Heroku all stay as-is.

## Migration Gotchas

- Adding `"type": "module"` to `package.json` (required for Vite 8) makes Node treat `.js` as ES modules — rename `postcss.config.js` (and `tailwind.config.js` on Tailwind v3) to `.cjs` if they use `module.exports`.
- Stimulus controllers loaded via esbuild glob imports must switch to Vite's `import.meta.glob` with `stimulus-vite-helpers` — which also grants controller HMR.
- The plugin watches `app/views/` and `app/helpers/` by default; editing an ERB template triggers a browser reload. Source maps are served, so DevTools breakpoints map to original files.
- **Importmaps migration is a bigger step** — you'll need a JS runtime; `bundlebun` can bundle Bun without a system install.

## Gem Mode (Explicit `vite_tags`)

- Opt in when the stub tradeoffs matter:

```bash
bundle add rails_vite
bin/rails generate rails_vite:install
```

```erb
<%= vite_tags "application.js" %>
```

- Instead of stubs, the Vite plugin writes its dev-server URL, source directory, and entry points to **`tmp/rails-vite.json`** (the Laravel idea). The gem reads that file and `vite_tags` emits script tags pointing straight at Vite:

```html
<script src="http://localhost:5173/@vite/client" type="module"></script>
<script src="http://localhost:5173/app/javascript/application.js" type="module"></script>
```

- In production it reads the Vite manifest and emits real tags:

```html
<link rel="modulepreload" href="/vite/assets/vendor-b3c4d5e6.js" />
<script src="/vite/assets/application-a1b2c3d4.js" type="module"></script>
<link rel="stylesheet" href="/vite/assets/application-x9y8z7w6.css" />
```

- No stubs and no translation layer — the browser talks to Vite directly. Adds `vite_image_tag`, `vite_asset_path` for manifest-resolved images, `modulepreload` hints, and CSP nonce support.

## Mode Tradeoffs

| Concern | jsbundling (stub) mode | gem (`vite_tags`) mode |
|---|---|---|
| Setup | npm pkg + config + Procfile; no gem, no layout edits | `bundle add` + generator + `vite_tags` in layout |
| Dev indirection | one extra hop (stub → Vite) | browser talks to Vite directly |
| Prod indirection | one extra import (the double) | none (direct manifest tags) |
| `rails new -j vite` potential | yes — acts like esbuild/rollup | n/a |
| Manifest images (`vite_image_tag`, `vite_asset_path`) | not available | available |
| CSP nonces on dev CSS | injected `<style>` bypasses `stylesheet_link_tag`, so nonces don't apply | supported |
| `modulepreload` hints | — | emitted for chunks |

- **Migrating from vite_ruby?** Gem mode gives familiar helpers (`vite_tags`, `vite_javascript_tag`, `vite_image_tag`) without the Rack proxy. But vite_ruby works fine for thousands of apps — if the proxy is the only friction, try vite_ruby's `skipProxy` option first.
- `rails_vite` runs in production on Evil Martians client projects and ships as the default in the Inertia Rails starter kits.
