---
title: "Ruby Bytes, or Generating Standalone Generators"
description: "Introduction to ruby-bytes (rbytes), a toolkit for building composable, testable, standalone Ruby and Rails application templates that work with or without Rails"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/ruby-bytes-or-generating-standalone-generators"
  date: '2023-04-04'
tags: [ruby, rails, generators, application-templates, thor, rbytes, railsbytes, tooling]
---

# Ruby Bytes, or Generating Standalone Generators

Ruby Bytes (`rbytes`) is a toolkit for building, testing, and distributing composable Ruby and Rails application templates that can be installed with or without Rails, supporting template partials, conditional code injection, and one-command publication to RailsBytes.

## The Problem with Rails Application Templates

- Rails application templates use `Thor` as the underlying engine — many actions (e.g., `#file`, `#inject_into_file`) come from Thor
- Rails adds `Rails::Generators::Actions` on top — actions like `gem`, `route`, `initializer` only work within Rails
- Templates written for Rails cannot be reused in plain Ruby projects without hacks
- Large templates become monolithic — no built-in support for composition from smaller reusable pieces
- Testing templates requires running `rails new` — slow and cumbersome; no unit test harness existed
- Distributing templates requires a URL or local path — no package registry integration

## Ruby Bytes Core Concepts

- `rbytes` gem provides a `RubyBytes::Template` base class that works with both Rails and plain Ruby projects
- Templates are plain `.rb` files using ERB-like directives for conditional rendering and partial inclusion
- `#include 'partial_name'` injects the contents of a partial template inline — enables composition
- `#code` method allows injecting dynamic content based on local variables defined in the template
- Templates can be compiled into standalone files using `rbytes compile` — single-file distribution
- Install from URL: `rails app:template LOCATION=https://railsbytes.com/script/<id>` or `ruby <template.rb>`

## Template Partials and Composition

- Partials are separate `.rb` template files stored alongside the main template
- `#include 'gemfile'` pulls in a `gemfile.rb` partial — Gemfile modifications are kept isolated
- Partials can themselves include other partials — arbitrary nesting supported
- `#if_option?(:option_name)` and `#unless_option?` provide conditional inclusion based on user choices
- Options are declared with `option :name, default: 'value'` and collected via interactive prompts
- Composed templates allow a "meta-template" (like Ruby on Whales) to include separate Docker, RuboCop, and CI partials

## Thor and Rails Integration

- `rbytes` adds partial support to standard Thor and Rails template actions
- Actions like `#inject_into_file`, `#append_to_file`, `#prepend_to_file` work unchanged
- `gem 'name', version: '...'` works in both Rails and non-Rails contexts
- The `#run` action executes shell commands — use for `bundle install`, `yarn add`, etc.
- `#rails_command` falls back gracefully when Rails is not present
- Template authors write once; `rbytes` detects the host environment and dispatches correctly

## Testing Templates

- `rbytes` ships with a test helper for RSpec and Minitest: `RubyBytes::TestHelper`
- `generate_app(template_path, options: {...})` runs the template against a temp Rails (or Ruby) app
- Assertions: `assert_file 'path/to/file'`, `assert_gem 'gemname'`, `assert_file_contains 'file', /pattern/`
- Tests run in isolated temp directories — no leftover state between test cases
- Mock interactive prompts by passing `options:` hash — no TTY needed in CI
- Template unit tests run in seconds (no `rails new` overhead) using the test helper's app skeleton

## CLI and Publishing

- `rbytes` gem installs a `rbytes` CLI command for template management
- `rbytes compile template.rb > compiled.rb` — inlines all partials into a single distributable file
- `rbytes publish` — publishes to RailsBytes via API or triggers a configured GitHub Action
- GitHub Action provided: push to `main` → auto-compile → auto-publish to RailsBytes
- Published templates are listed at `railsbytes.com` and installable with the standard `rails app:template` command
- Version constraints can be embedded in templates: warn and abort if Rails version is incompatible

## Real-World Template: Ruby on Whales

- Ruby on Whales Docker setup is distributed as a Ruby Bytes template at `railsbytes.com/public/templates/z5OsoB`
- The template prompts for Ruby version, Node.js version, PostgreSQL version, Redis inclusion
- Generates `.dockerdev/Dockerfile`, `.dockerdev/compose.yml`, `dip.yml`, and `.env.example`
- Each environment configuration (Dockerfile, Compose, dip) is a separate partial — independently maintainable
- The template composes partials for Sidekiq, Redis, and ChromeDriver based on user selections

## Ecosystem and Adoption

- `palkan/rbytes` on GitHub — MIT licensed, maintained by Vladimir Dementyev
- `rubocoping-generator` (Evil Martians) — a Ruby Bytes template for setting up RuboCop with Standard
- RailsBytes marketplace at `railsbytes.com` hosts community templates installable with one command
- Templates can be hosted anywhere (GitHub raw URL, Gist, S3) — RailsBytes registration is optional
- `gem 'ruby-bytes'` added to the template's own Gemfile is not needed by consumers — only by template authors during development
