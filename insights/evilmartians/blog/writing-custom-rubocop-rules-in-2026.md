---
title: "Writing Custom RuboCop Rules in 2026"
description: "Modern guide to authoring RuboCop cops using the new plugin system, requires_gem API, InternalAffairs linting, safe autocorrection patterns, and cop distribution"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Nikita Mishchenko"
  url: "https://evilmartians.com/chronicles/writing-custom-rubocop-rules-in-2026"
  date: '2026-02-18'
tags: [ruby, rubocop, linting, static-analysis, code-style, autocorrection, plugins]
---

# Writing Custom RuboCop Rules in 2026

A comprehensive guide to writing and shipping modern custom RuboCop cops with the 2026 plugin system, `requires_gem` API, InternalAffairs validation, and robust autocorrection patterns.

## RuboCop Architecture Basics

- All cops inherit from `RuboCop::Cop::Base` (not `RuboCop::Cop::Cop`, which is deprecated since RuboCop v2)
- Cops are organized into departments: `Style`, `Lint`, `Performance`, `Rails`, etc. — department is the first segment of the cop name
- A cop class named `RuboCop::Cop::MyDept::MyCop` registers as `MyDept/MyCop` in `.rubocop.yml`
- Each cop implements `on_<node_type>` callback methods invoked by the AST traversal engine
- `add_offense(node, message: '...')` records a violation at a node location

## The New Plugin System (RuboCop 1.70+)

- RuboCop's built-in plugin system replaces the old `require:` gem loading mechanism
- Define a plugin class inheriting `RuboCop::Plugin` and declare it in the gemspec via `metadata['rubocop_plugin_class']`
- Plugin class registers cops and extensions: `config_obsoletion`, `default_configuration`, `cop_classes`
- Consumers enable a plugin in `.rubocop.yml` with `plugins: [rubocop-myplugin]` — no more `require:` directives
- Plugins can bundle default configuration shipped alongside the gem, reducing user setup to a single `plugins:` line

## The `requires_gem` API

- Introduced in RuboCop 1.63 — allows a cop to declare that it only applies when specific gems are present
- Syntax: `requires_gem 'rails', '>= 7.0'` inside the cop class body
- RuboCop skips the cop automatically when the gem is absent — no `Enabled: false` workaround needed
- Supports version constraints using standard RubyGems version requirement syntax
- Replaces fragile `def on_new_investigation; return unless ... end` gem-presence guards

## Writing Node Pattern Matchers

- `NodePattern` is RuboCop's DSL for matching Ruby AST nodes — compile with `RuboCop::NodePattern.new('(send nil? :method_name ...)')`
- `(send (const nil? :ClassName) :method_name ...)` matches `ClassName.method_name(args)`
- Use `#node_matcher` and `#node_search` macros in cop class to define reusable matchers
- `...` matches any number of children; `_` matches exactly one arbitrary child; `{a b}` matches `a` or `b`
- `^node` accesses parent node; `$node` captures a node for extraction in the match block
- Test patterns interactively with `rubocop --debug` or the `rubocop-ast` console helpers

## InternalAffairs Department

- `rubocop-internal_affairs` is a built-in RuboCop plugin that lints cop source code itself
- Enable in your cop gem's `.rubocop.yml`: `plugins: [rubocop-internal_affairs]`
- Catches: using deprecated `Cop` base class, missing `MSG` constant, improper `add_offense` usage
- Enforces use of `prefer_single_line_format` for offense messages
- Reports when cops use `node.source` instead of preferred AST accessors
- Running IA against your cop gem catches API misuse before downstream users hit runtime errors

## Safe vs Unsafe Autocorrection

- Declare autocorrection capability with `extend AutocorrectLogic` and override `autocorrect(corrector, node)`
- Mark a cop as safe-autocorrect with `self.autocorrect_incompatible_with = []` and `restrict_on_send`
- Use `corrector.replace(node.source_range, new_code)` for simple replacements
- `corrector.insert_before`, `corrector.insert_after`, `corrector.remove` for surgical edits
- **Safe autocorrection**: semantics-preserving changes (e.g., `Array.new` → `[]`) — set `self.autocorrect_incompatible_with = []`
- **Unsafe autocorrection**: may change behavior (e.g., reordering method calls) — set `self.autocorrect_incompatible_with = [:some_cop]` and use `--autocorrect-all` flag

## Testing Cops with RuboCop::RSpec

- Use `rubocop-rspec` helpers — include `RuboCop::RSpec::ExpectOffense` in spec
- `expect_offense` DSL with `^` markers pinpoints exact violation location in source strings
- `expect_no_offenses(source)` asserts clean code passes
- `expect_correction(corrected_source)` validates autocorrect output
- Test edge cases: nested nodes, multiline expressions, heredocs, frozen string literals
- Use `described_class` and `subject(:cop) { described_class.new(config) }` for cop instantiation

## Cop Design Trade-offs

- Prefer broad node matching + manual filtering over overly narrow patterns — easier to extend later
- Avoid false positives: add `return if inside_heredoc?(node)` and `return if in_string_interpolation?` guards
- Respect `# rubocop:disable MyDept/MyCop` comments — they are handled automatically by the framework
- Support `AllowedMethods:` and `AllowedPatterns:` configuration keys for user escape hatches
- Document each cop with `# @example` blocks in YARD format — these appear in `rubocop --no-color` output
- Performance: avoid `O(n²)` traversal by using `on_send` callbacks instead of full-tree searches in `on_begin`

## Distribution and Configuration

- Ship cops as a gem; use `bundle gem rubocop-myapp` scaffold
- Add `metadata['rubocop_plugin_class'] = 'RuboCop::Plugin::MyApp'` to gemspec
- Bundle a `config/default.yml` with sensible defaults (typically `Enabled: true`, `Safe: true`)
- Publish to RubyGems; add `rubocop-gradual` for incremental adoption in legacy codebases
- Pin RuboCop version range in gemspec: `rubocop >= 1.63, < 2.0` to avoid unexpected breakage
- Expose configuration docs via RuboCop's `--show-cops MyDept/MyCop` flag by adding proper YARD tags
