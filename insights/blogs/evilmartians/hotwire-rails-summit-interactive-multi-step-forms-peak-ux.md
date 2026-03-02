---
title: "The Hotwire-Rails Summit: Interactive Multi-Step Forms at Peak UX"
description: "Building a sophisticated multi-step form wizard in Hotwire Rails using morphing, form objects, nested form tricks, and View Transitions for SPA-like UX without React"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/hotwire-rails-summit-interactive-multi-step-forms-peak-ux"
  date: '2025-06-24'
tags: [hotwire, turbo, rails, forms, morphing, stimulus, view-transitions, form-objects, state-machine]
---

# The Hotwire-Rails Summit: Interactive Multi-Step Forms at Peak UX

A real-world case study (SumIt's custom reports wizard) demonstrating how to build a complex, interactive multi-step form in Hotwire Rails using morphing, `turbo:before-morph-attribute`, and View Transition API — without reaching for React.

## Feasibility Checklist Before Choosing Hotwire

- Key questions to answer before committing: How much client state is truly needed vs. server-controlled? Can existing Stimulus controllers be reused? Does the component library cover the required UI elements?
- If state can live in an HTML form and few new controllers are needed, Hotwire is the right choice
- SumIt stack: Rails + Hotwire, `View Components`, `TailwindCSS`, `Lookbook`, `Turbo Mount` for third-party JS components

## Modeling Multi-Step Forms the Rails Way

- Single form object encapsulates the entire wizard: no gem-based wizard libraries, no per-step controllers
- Use a state machine-like `step` attribute in the form object to describe flow
- Controller interface mimics standard CRUD: `def update` calls `@report_form.save`, redirects on completion, re-renders on validation failure or step advance
- Response status: `:created` (201) when moving to next step without errors; `:unprocessable_entity` (422) on validation failure
- The same controller actions work for both the wizard and a hypothetical single-form replacement — backend interface remains stable

## DOM Morphing for Smooth Form Updates

- Auto-submit on change triggers a background Turbo Stream `replace` to update the preview pane
- Full HTML swap causes visible lag and resets local UI state (open/closed accordions, focused inputs)
- Add `method: "morph"` to Turbo Stream template: `<%= turbo_stream.replace :reporting_custom_wizard, method: "morph" do %>`
- Morphing preserves local DOM state (CSS classes, data attributes) between server-driven updates

## Making Third-Party Stimulus Controllers Morphing-Ready

- Many third-party Stimulus controllers are not morphing-aware — verify and patch before relying on them
- Example: `checkbox-select-all` from `stimulus-components` needed a PR fix for morphing compatibility
- Key issue: controllers that store state only in HTML attributes (CSS classes, `data-*`) have that state overwritten by morph unless explicitly protected

## Preserving Local State with turbo:before-morph-attribute

- Introduce `data-turbo-morph-permanent-attrs` attribute to list space-separated HTML attributes that should not be touched by morphing
- Subscribe to `turbo:before-morph-attribute` event; read `event.detail.attributeName` and call `event.preventDefault()` to preserve the attribute
- Cache regex on the element via `event.target._permanentAttrsRegex` to avoid re-building the regex on every morph
- Example: `data-turbo-morph-permanent-attrs="data-accordion-open-value"` preserves the accordion's open/closed state
- Also implement `turbo:before-morph-element` handler to clean up the `_permanentAttrsRegex` cache when the target element changes

## Morphing and data-turbo-morph-permanent

- Custom `data-turbo-morph-permanent` attribute fixes a subtle bug: built-in `data-turbo-permanent` can leave stale elements on the page during morphing
- Implement via `turbo:before-morph-element`: if both `fromEl` and `toEl` have the attribute and IDs match, call `event.preventDefault()` to skip morphing
- Add `turbo:morph-element->accordion#contentChanged` Stimulus action to recalculate heights after child node changes
- AG Grid component wrapped in Stimulus uses `data-turbo-morph-permanent`; server passes updated data via HTML attribute, Stimulus value change callback calls `gridApi.setGridOption("rowData", ...)`

## Stimulus Values for Morphing-Ready Components

- `reportDataValueChanged()` in Stimulus fires automatically when `data-report-data-value` is updated by morphing
- No need to restart the Stimulus controller — the value callback replaces the `connect()`/`disconnect()` lifecycle
- Pattern: store server-driven data in a Stimulus value attribute; callback re-initializes only the affected sub-component

## Nested Forms Without Nested Form Tags

- HTML prohibits nested `<form>` elements — the outer form wins
- Solution: embed all inputs in a single `<form>` element; use `name` and `value` on submit buttons to activate different sub-form behaviors
- A submit button's `name`/`value` is only submitted when that button triggers the form — acts as an activation mechanism
- Example: `<button name="report[new_interval_type]" value="previous">Add</button>` passes the interval type to the controller
- `form.fields_for :new_previous_interval, allow_method_names_outside_object: true` builds nested attribute names without requiring `accepts_nested_attributes_for`
- The `new_interval_type` activation attribute in the form object routes to the correct `build_new_interval` branch

## HTML Button Tricks

- `formaction` attribute on a button overrides the form's action URL for that submission
- `formmethod` attribute on a button overrides the HTTP method (e.g., `formmethod="post"` on a DELETE form)
- `event.submitter` in JS gives the button that triggered the form submit — readable without extra state

## View Transitions for Directional Animations

- Use the browser-native View Transition API via the `turbo-view-transitions` npm library
- For Turbo Stream transitions: subscribe to `turbo:before-stream-render`, check `shouldPerformTransition()`, wrap `fallbackToDefaultActions` with `performTransition()`
- Apply `data-turbo-stream-transition="<transition-name>"` to elements to animate on Turbo Stream updates
- Directional transitions ("slide-left" vs "slide-right"): detect button via `event.submitter.value` in a Stimulus `handleSubmit` handler and update `el.dataset.turboStreamTransition` before the form submits
- Server-side form object's `wizard_action` attribute drives which direction is used (populated by button `name`/`value` trick)
- Transitions only animate when both old and new HTML have the same attribute value — ensures transition only fires on matching elements

## Key Reflections on Hotwire for Complex UIs

- Third-party library morphing incompatibilities require investigation and patching — not always zero-effort
- Aligning with the project's existing patterns (morphing setup, existing Stimulus libraries) reduces rework significantly
- Single HTML form + form object keeps backend interface stable regardless of frontend approach chosen later
- Inertia, React, or other frontends could replace the view layer without changing backend controllers or serializers
- HTML forms as universal interface: `formaction`, `formmethod`, button `name`/`value` replace the need for dedicated API endpoints
