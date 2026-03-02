---
title: "ViewComponent in the Wild II: Supercharging Your Components"
description: "Production ViewComponent setup with view_component-contrib, dry-initializer, dry-effects, CSS scoping, Stimulus integration, runtime DB query linting, and Lookbook storybook"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Alexander Baygeldin"
  url: "https://evilmartians.com/chronicles/viewcomponent-in-the-wild-supercharging-your-components"
  date: '2022-10-18'
tags:
- viewcomponent
- rails
- ruby
- view-component-contrib
- dry-rb
- stimulus
- lookbook
- css-modules
- testing
---

# ViewComponent in the Wild II: Supercharging Your Components

A deep-dive into the production ViewComponent setup used at Evil Martians, covering folder structure, helpers, effects, CSS scoping, JS integration, runtime linting, and Lookbook storybook configuration.

## Core Gem: view_component-contrib

- `view_component-contrib` gem is a collection of extensions and conventions built on top of ViewComponent
- Install via Rails app template: `rails app:template LOCATION="https://railsbytes.com/script/zJosO5"` — launches a configuration wizard
- Provides `ViewComponentContrib::Base`, `ViewComponentContrib::PreviewBase`, `ViewComponentContrib::StyleVariants`, and more
- Includes `dry-initializer` integration to eliminate `initialize` boilerplate in component classes
- Sidecar pattern support: collocates template, stylesheet, JS, preview, and test files in the component folder

## Folder Structure and Sidecar Pattern

- Store components in `app/views/components/` (not `app/components/`) to keep view code together
- Use sidecar pattern: `components/example/component.rb`, `component.html.erb`, `styles.css`, `controller.js`, `preview.rb`
- Add `append_view_path Rails.root.join("app/views/components")` to `ApplicationController` and `ApplicationMailer`
- Namespace components freely: `components/way_down/we_go/example/component.rb` → `WayDown::WeGo::Example::Component`
- Flat folder structure is sometimes better than deep nesting — evaluate case by case

## Helper for Rendering Components

- Default rendering is verbose: `render(Example::Component.new(title: "Hello World!"))`
- Define a `component` helper: `component "example", title: "Hello"` — converts slug to class name and calls `render`
- Nested components: `component "way_down/we_go/example", title: "Hello"` — slash-separated path becomes constant
- For relative rendering inside nested components: `component ".my-nested-component"` using dot-prefix notation
- Add `component_name` class method to base component to support relative lookup

## Base Classes with dry-initializer

- `ApplicationViewComponent < ViewComponentContrib::Base` with `extend Dry::Initializer` and `include ApplicationHelper`
- `dry-initializer` replaces manual `attr_reader`/`initialize`: `option :title` generates both
- `ApplicationViewComponentPreview < ViewComponentContrib::PreviewBase` with `abstract_class true` and shared layout
- Layouts are inherited by preview subclasses but can be overridden per preview
- I18n support built-in: use `t(".title")` inside templates, keys scoped to `view_components.namespace.component.title`

## Global State with dry-effects

- Use `dry-effects` gem for algebraic effects to inject context (e.g., `current_user`) without argument drilling
- In `ApplicationController`: `include DryEffects::Handler::Reader(:current_user)` + `around_action :with_current_user`
- In `ApplicationViewComponent`: `include DryEffects::Reader(:current_user, default: nil)`
- `current_user` method becomes available in any component without constructor arguments
- In RSpec config: include `DryEffects::Reader(:current_user, ...)` into `:view_component` type specs
- Use `with_current_user(user)` block in tests to set context for rendering
- Don't over-use context — every implicit dependency makes tests and data flow harder to trace

## CSS Scoping with PostCSS Modules

- CSS is global by nature; use naming conventions (BEM) or CSS Modules for isolation
- Configure `postcss-modules` with custom `generateScopedName` function: transforms `way_down/we_go/example` → `way-down--we-go--example`
- Skip transformation for files outside the components folder; disable `.css.json` generation (`getJSON: () => {}`)
- Add `identifier` class method to `ApplicationViewComponent`: `component_name.gsub("_", "-").gsub("/", "--")`
- Add `class_for(name)` instance helper for templates: `<div class="<%= class_for("container") %>">`
- With Tailwind CSS, CSS Modules are unnecessary — utility classes handle all styling per-component

## Stimulus JS Integration

- One Stimulus controller per component: `app/views/components/hello/controller.js`
- Infer controller name from folder path: `hello` → `data-controller="hello"`, `way_down/we_go` → `way-down--we-go`
- Auto-register controllers using Vite's `import.meta.globEager("./../../app/views/components/**/controller.js")`
- Build `controller_name` helper on the component: `identifier` method matching the CSS naming convention
- Template: `data-controller="<%= controller_name %>"` and `data-<%= controller_name %>-target="name"`
- Use `controller_name` to avoid hardcoding strings in templates — renaming components auto-updates attributes

## Runtime Linting: Prohibit DB Queries in Components

- Enable ViewComponent instrumentation: `config.view_component.instrumentation_enabled = true` in `config/application.rb`
- Add `config.view_component.raise_on_db_queries = true` in `development.rb` and `test.rb`
- Add `self.allow_db_queries = false` class-level flag to `ApplicationViewComponent`; override with `self.allow_db_queries = true` when needed
- Implement linter in `config/initializers/view_component.rb` using `ActiveSupport::Notifications.subscribe` on both `render.view_component` and `sql.active_record` events
- Use `Thread[:last_sql_query]` to correlate SQL events with component render events
- Raise descriptive error when a component (without `allow_db_queries = true`) fires a DB query during render

## Generators

- ViewComponent provides built-in generators: `bin/rails g component Example`
- `view_component-contrib` creates custom generators matching your sidecar folder structure
- Generators create component class, template, preview, and test files in one command

## Lookbook: Storybook for ViewComponent

- `lookbook` gem provides a Storybook-style UI for ViewComponent previews: live parameter editing, source display
- Add to Gemfile: `gem "lookbook", require: false`; conditionally require in `config/application.rb` based on `Rails.env.development?` or an env var
- Mount engine in routes: `mount Lookbook::Engine, at: "/lookbook" if Rails.application.config.lookbook_enabled`
- Previews with `@param title text` YARD-style annotations become editable fields in Lookbook UI
- Each component's `preview.rb` inherits from `ApplicationViewComponentPreview`; preview templates mirror real component usage exactly

## Lookbook: Previews for Mailers

- Create `MailerPreview < ApplicationViewComponentPreview` base class with `layout "mailer_preview"` and `@hidden` YARD tag
- Auto-infer mailer class from preview class name; call `mailer.public_send(action, **params)` to generate email object
- Pass `source:` key with TypeScript/language metadata for the Source tab display
- Register mailer preview paths: `config.view_component.preview_paths << Rails.root.join("app/views")`
- Inherit: `class TestMailer::Preview < MailerPreview; def test(body:); render_email :test, body:; end; end`

## Lookbook: Previews for React Components (Hybrid Apps)

- Mirror folder structure: `frontend/components/Example/preview.tsx` alongside `frontend/components/Example/preview.rb`
- Create `ReactPreview < ApplicationViewComponentPreview` base class with custom `render_with` that extracts component name and props
- Override ViewComponent internals to pass `component_name`, `component_preview`, and `component_props` as locals
- Use Vite's `import.meta.globEager('../components/*/preview.tsx')` to auto-load all React previews
- Layout `react_preview.html.erb` includes `vite_client_tag`, `vite_react_refresh_tag`, and a container div for React to mount into
- Monkey-patch Lookbook's Source tab to display the TypeScript source instead of the ERB template
