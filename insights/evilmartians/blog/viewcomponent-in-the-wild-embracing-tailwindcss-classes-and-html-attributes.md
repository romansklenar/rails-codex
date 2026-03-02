---
title: "ViewComponent in the Wild III: TailwindCSS Classes and HTML Attributes"
description: "Style Variants DSL for managing Tailwind class combinations in ViewComponent, HTML attribute bags with tag.attributes, and inline system test helpers with rails-intest-views"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/viewcomponent-in-the-wild-embracing-tailwindcss-classes-and-html-attributes"
  date: '2024-01-23'
tags: [viewcomponent, tailwindcss, rails, ruby, view-component-contrib, css, testing, html-attributes]
---

# ViewComponent in the Wild III: TailwindCSS Classes and HTML Attributes

Practical patterns for managing TailwindCSS class combinations with the Style Variants DSL, propagating arbitrary HTML attributes into components with `html_option`, and writing inline browser tests with `rails-intest-views`.

## The Problem with Conditional Tailwind Classes

- Components with multiple variants accumulate complex conditional logic: `if primary? then %w[bg-blue-600 text-white] elsif outline? ...`
- Conflicting Tailwind classes (e.g., `bg-blue-600` and `bg-slate-50`) cause silent styling bugs — later classes don't always win
- Scattered string arrays across ERB templates are hard to review, test, and maintain
- The naive `class_for` approach from Part II doesn't compose well with utility-first CSS

## Style Variants DSL

- `view_component-contrib` includes the Style Variants plugin providing a declarative `style do...end` block in component classes
- `base { %w[...classes...] }` — classes applied to all instances
- `variants { variant { primary { %w[...] }; outline { %w[...] } }; disabled { yes { %w[opacity-50 pointer-events-none] } } }` — conditional class sets
- `defaults { { variant: :primary, disabled: false } }` — default variant values applied when options are omitted
- `compound(variant: :outline, disabled: true) { %w[opacity-75 bg-slate-300] }` — classes applied only when multiple conditions are true simultaneously
- Call `style(variant:, disabled:)` in the ERB template: `class="<%= style(variant:, disabled:) %>"`
- Inspired by the Tailwind Variants and CVA (Class Variance Authority) projects from the JS ecosystem

## Style Variants: Full Button Example

- `option :variant, default: proc { :default }` and `option :disabled, default: proc { false }` via `dry-initializer`
- `base` includes shared layout classes: `%w[items-center justify-center px-4 py-2 text-sm font-medium border]`
- `variants.variant.primary` includes color classes: `%w[text-white bg-blue-600 hover:bg-blue-700 dark:bg-blue-700]`
- `variants.variant.outline` overrides color: `%w[bg-slate-50 hover:bg-slate-100 focus:ring-slate-600]`
- `variants.disabled.yes` adds `%w[opacity-50 pointer-events-none]`
- Template: `<button type="<%= type %>" class="<%= style(variant:, disabled:) %>"<%= " disabled" if disabled %>>`
- The `style(...)` call returns a single merged string of all applicable classes

## Integrating tailwind_merge

- Tailwind class conflicts (e.g., `bg-blue-600` from base + `bg-slate-50` from variant) need resolution
- `tailwind_merge` gem (`TailwindMerge::Merger`) intelligently resolves conflicting Tailwind utilities — last one wins by specificity rules
- Configure globally in `ApplicationComponent`: `style_config.postprocess_with { |classes| TailwindMerge::Merger.new.merge(classes.join(" ")) }`
- No per-component configuration needed after global setup — all `style(...)` calls automatically merge cleanly
- Works alongside compound variants: merge happens after all matching classes are collected

## HTML Attribute Propagation: The Problem

- Functional HTML attributes (`required`, `disabled`, `autocomplete`, `autofocus`, `placeholder`, `pattern`) vary by use case
- Enumerating every possible attribute as a component option is impractical and creates an explosion of options
- Standard practice: callers must be able to pass arbitrary HTML attributes to specific elements within a component
- Problem is especially acute for form inputs where dozens of native attributes exist

## Solution 1: Attribute Bags with tag.attributes

- Define `option :html_attrs, default: proc { {} }` and `option :input_attrs, default: proc { { autocomplete: "off", required: false }.merge(_1) }` (Ruby 2.7+ numbered block parameter)
- In template: `<span <%= tag.attributes(**html_attrs) %>>` and `<input <%= tag.attributes(**input_attrs) %>>`
- `tag.attributes(...)` is a Rails 7+ helper that renders a hash as HTML attribute string: `{placeholder: "x"} → placeholder="x"`
- Boolean attributes handled correctly: `{required: true}` → `required`, `{required: false}` → omitted
- Callers override defaults: `UIKit::Input::Component.new(name: "name", input_attrs: {placeholder: "Enter your name", autocomplete: "on"})`

## Solution 2: html_option DSL (view_component-contrib)

- `html_option :input_attrs, default: { autocomplete: "off", required: false }` — shorthand that handles merging automatically
- Enables a `dots(input_attrs)` template helper (named after JavaScript spread operator `...`): `<input <%= dots(input_attrs) %>>`
- Caller-provided values are deep-merged with defaults: extra keys are added, conflicting keys override defaults
- `dots` is just an alias for `tag.attributes` — the name conveys the spreading intent more clearly
- Available in `view_component-contrib` as a built-in extension to `ViewComponentContrib::Base`

## Inline System Tests with rails-intest-views

- Problem: testing dynamic JS behavior (click handlers, Stimulus controllers) currently requires either full system tests against preview URLs or dedicated storybook previews
- `rails-intest-views` gem provides `visit_template` helper for inline ERB templates in system tests
- No coupling to preview files or Lookbook — the template is defined right in the test spec
- Example: `visit_template <<~ERB; <form ...><%= render Button::Component.new(type: :submit) %>...</form>; ERB`
- Then use normal Capybara matchers: `click_on("Destroy me!")`, `expect(page).to have_no_text "..."`
- Avoids the need to maintain separate preview files just for system testing purposes

## Combining All Three Techniques

- Style Variants handles the "which Tailwind classes?" problem declaratively at the component class level
- HTML attribute bags (`html_option` + `dots`) solve the "how do callers customize element attributes?" problem
- `rails-intest-views` closes the gap for testing dynamic JS behavior without preview file maintenance overhead
- Together, these three patterns address the most common friction points when building design system components with ViewComponent + Tailwind

## Key Dependencies and Versions

- `view_component-contrib` gem — provides Style Variants, `html_option`, and `dots` helper
- `tailwind_merge` gem — conflict-aware Tailwind class merging (`TailwindMerge::Merger`)
- `dry-initializer` gem — `option` declarations replacing manual `initialize` boilerplate
- `rails-intest-views` gem — `visit_template` helper for inline system test templates
- Rails 7+ required for `tag.attributes` helper
- ViewComponent v3+ required for `erb_template <<~ERB` inline template syntax
