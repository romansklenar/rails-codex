---
title: "The Art of Turbo Mount: Hotwire Meets Modern JS Frameworks"
description: "How to integrate React, Vue, or Svelte components into Hotwire Rails apps using the turbo-mount gem, with importmaps or Vite, and custom Stimulus controllers"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Svyatoslav Kryukov"
  url: "https://evilmartians.com/chronicles/the-art-of-turbo-mount-hotwire-meets-modern-js-frameworks"
  date: '2024-06-11'
tags: [hotwire, turbo, stimulus, react, vue, svelte, importmaps, vite, rails]
---

# The Art of Turbo Mount: Hotwire Meets Modern JS Frameworks

Turbo Mount bridges Hotwire's server-rendered simplicity with the interactivity of modern JS frameworks (React, Vue, Svelte) by eliminating per-component boilerplate Stimulus controllers.

## The Problem: Integrating React Components Manually

- Standard React initialization hooks into `DOMContentLoaded`, but Hotwire fires custom Turbo events (`turbo:load`, frame events), making this fragile
- The correct manual approach uses a Stimulus controller with `connect()` / `disconnect()` lifecycle to mount/unmount React via `createRoot`
- Stimulus `values` API passes props: `data-workbook-props-value="<%= props.to_json %>"`
- The manual controller calls `this.root = createRoot(this.element)` in `connect()` and `this.root.unmount()` in `disconnect()`
- Works but produces per-component boilerplate that multiplies as the app grows

## Importmaps and Dependency Limitations

- Rails 7 default: manage JS deps with `importmaps` via `bin/importmap pin <package>`
- Importmaps struggle with transitive dependency resolution; complex packages like `@fortune-sheet/react` require manual CDN overrides in `config/initializers/importmap.rb`
- Example workaround: pin `immer` to `https://cdn.skypack.dev/immer@9.0.21` to fix `process is not defined` errors
- Importmaps cannot support build-step-dependent frameworks like Svelte or custom React/Vue components
- For complex dependency graphs, Vite is the recommended upgrade path

## Installing Turbo Mount

- Add the gem: `bundle add turbo-mount`
- Run the generator: `bin/rails generate turbo_mount:install`
- Generator prompts for framework choice (`react`, `vue`, or `svelte`)
- Creates `app/javascript/turbo-mount-initializer.js`, appends to `application.js`, pins to importmap
- Auto-pins all framework dependencies (react, react-dom, scheduler) via `bin/importmap pin`

## Registering Components and the turbo_mount Helper

- Register components in `turbo-mount-initializer.js` using `registerComponent(turboMount, "Workbook", Workbook)`
- The `TurboMount` instance is created once and shared across all registrations
- In Rails views, replace manual mounting with: `<%= turbo_mount("Workbook", props: {data:}) %>`
- `turbo_mount` helper handles all lifecycle wiring automatically — no custom Stimulus code needed
- Props are serialized to JSON and passed via HTML data attributes by the library

## Customizing with Custom Stimulus Controllers

- Extend `TurboMountController` to add interactivity beyond prop-passing
- Define `get componentProps()` to merge additional props (e.g., `onChange` callbacks)
- Use `static targets = ["input", "mount"]` to wire React component output back to HTML form fields
- Use `this.setComponentProps({})` to update component props without re-rendering the entire element
- Register both the component and the custom controller together: `registerComponent(turboMount, "HexColorPicker", HexColorPicker, HexColorPickerController)`

## Block Syntax for Custom Controllers

- The `turbo_mount` helper accepts a block yielding `controller_name` for Stimulus targets:
  ```erb
  <%= turbo_mount("HexColorPicker", props: { color: palette.colors[i] }) do |controller_name| %>
    <div data-<%= controller_name %>-target="mount"></div>
    <%= form.hidden_field :colors, data: { "#{controller_name}-target": "input" } %>
  <% end %>
  ```
- This pattern lets server-rendered form fields stay in sync with React-controlled values
- Suitable for color pickers, date pickers, or any interactive widget backed by a hidden input

## Auto-loading with Vite and registerComponents

- With Vite, use `import.meta.glob` to auto-discover and register components and controllers
- `registerComponents` helper from `turbo-mount/registerComponents/vite` wires everything automatically
- Components glob: `import.meta.glob("/components/**/*.jsx", { eager: true })`
- Controllers glob: `import.meta.glob("./**/*_controller.js", { eager: true })`
- Controller naming convention: `turbo_mount_color_picker_controller.js` maps to `ColorPicker` component
- Switching frameworks is trivial: import the Vue or Svelte plugin and update the glob pattern

## Multi-framework Support

- Supports React, Vue, and Svelte in the same application simultaneously
- Import the appropriate plugin: `turbo-mount/react`, `turbo-mount/vue`, `turbo-mount/svelte`
- With `registerComponents`, each framework can register from its own directory
- Demo: all 3 frameworks used in the same app via separate `registerComponents` calls
- Framework-agnostic design means adopting Turbo Mount doesn't lock you into one choice

## Changelog and Versioning Notes

- v1.1.1 (2024-06-29): Added `setComponentProps` method to the Stimulus controller
- v1.1.0 (2024-06-17): Added ESBuild support note; upgraded auto-loading syntax for Turbo Mount 0.3.1+
- `import.meta.glob` requires `{ eager: true }` option; for Vite < 5.0 use `import.meta.globEager`
- The `turbo-mount` gem and `turbo-mount` npm package must be kept in sync
