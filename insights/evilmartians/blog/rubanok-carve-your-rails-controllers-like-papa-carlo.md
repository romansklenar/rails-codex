---
title: "Rubanok: Carve Your Rails Controllers Like Papa Carlo"
description: "Rubanok provides a params-based transformation DSL (Processor classes with map/match rules) to extract filtering, sorting, and pagination logic from Rails controllers into dedicated, testable objects"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/rubanok-carve-your-rails-controllers-like-papa-carlo"
  date: '2019-02-12'
tags:
- rails
- controllers
- params
- filtering
- sorting
- pagination
- dsl
- ruby
---

# Rubanok: Carve Your Rails Controllers Like Papa Carlo

`rubanok` is a parameters-based transformation DSL that moves filtering, sorting, searching, and pagination logic out of Rails controllers into dedicated Processor classes — keeping `index` actions thin and making param-driven collection transformations testable.

## The Problem: Fat Index Actions

- REST `index` actions accumulate logic for filtering, sorting, searching, and pagination based on params
- Typical result: 20–50 lines of `if params[:q]`, `case params[:sort_by]`, `order(...)` in the controller
- This logic is untestable without an HTTP request and hard to reuse across controllers
- Moving it to the model as scopes helps somewhat but still ties query logic to param structure
- `rubanok` provides a dedicated abstraction: the Processor class — a pure Ruby transformation object

## Core Concept: Processor Classes

- A Processor is a plain Ruby class inheriting `Rubanok::Processor`
- Describes all param-driven transformations for a collection using a declarative DSL
- Two DSL primitives: `map` (always applies when param is present) and `match` (conditional on param values)
- Processor receives the raw collection and params hash; returns the transformed collection
- Located in `app/processors/` (or `app/planes/` — older naming convention)
- Name convention: `EventsProcessor` handles param transformations for the events collection

## The `map` Rule

- `map :param_name` applies a transformation whenever `params[:param_name]` is present and non-blank:
  ```ruby
  class EventsProcessor < Rubanok::Processor
    map :q do |q:|
      raw.where("title ILIKE ?", "%#{q}%")
    end
  end
  ```
- `raw` refers to the current state of the collection being transformed
- Multiple `map` rules are applied in order — output of one feeds into the next
- Return value of the block becomes the new `raw` for subsequent rules
- `map` with multiple params: `map :start_date, :end_date do |start_date:, end_date:| ... end`

## The `match` Rule

- `match` applies conditional transformations based on specific param values:
  ```ruby
  match :sort_by, :sort, activate_on: :sort_by do
    having "name", "asc" do
      raw.order(name: :asc)
    end
    having "name", "desc" do
      raw.order(name: :desc)
    end
    default do |sort_by:, sort: "asc"|
      raw.order(sort_by => sort)
    end
  end
  ```
- `having` matches exact param values; `default` is the fallback
- `activate_on:` specifies which param must be present to activate the match block at all
- Prevents executing sorting logic when `sort_by` param is absent

## Rails Controller Integration

- Include `Rubanok::Rails::Controller` in `ApplicationController` (or specific controllers)
- Use `rubanok_process` in controller actions:
  ```ruby
  class EventsController < ApplicationController
    def index
      @events = rubanok_process(Event.all, params, with: EventsProcessor)
    end
  end
  ```
- Implicit processor resolution: `rubanok_process(Event.all, params)` infers `EventsProcessor` from controller name
- `planish` is the older alias for `rubanok_process` — still works, renamed for clarity

## Accessing Applied Params in Views

- `rubanok_scope` helper returns the params that were actually used by the processor
- Useful for rendering active filter state in the UI:
  ```ruby
  # In controller:
  @events = rubanok_process(Event.all, params, with: EventsProcessor)
  @filters = rubanok_scope  # => { q: "ruby", sort_by: "name" }
  ```
- Enables rendering "active filters" chips, query parameter badges, or filter form pre-population
- Only params that matched a `map` or `match` rule appear in `rubanok_scope`

## Testing Processors in Isolation

- Processors are plain Ruby objects — test without Rails, without an HTTP request:
  ```ruby
  RSpec.describe EventsProcessor do
    subject { described_class.call(Event.all, q: "ruby") }
    it { is_expected.to include(ruby_event) }
    it { is_expected.not_to include(python_event) }
  end
  ```
- No controller setup, no `params` wrappers, no `get :index` overhead
- Test each `map` and `match` rule independently with different param combinations
- Controller tests become thin: just assert the processor is called with the right collection and params

## Integration with Pagination

- Processors compose with pagination gems: `pagy`, `kaminari`, or `will_paginate`
- Add pagination as the last `map` rule in the processor:
  ```ruby
  map :page, :per_page do |page:, per_page: 25|
    raw.page(page).per(per_page)  # kaminari syntax
  end
  ```
- Or keep pagination in the controller after `rubanok_process` — either approach works
- Recommended: keep pagination outside the processor so the controller controls page metadata

## Real-World Patterns

- `rubanok` pairs well with `ransack` for complex filtering: processor maps ransack params to scopes
- Works with any ORM returning a chainable relation: ActiveRecord, Sequel, ROM-rb relations
- Non-Rails usage: `MyProcessor.call(array, params)` — works with plain Ruby arrays if blocks return arrays
- Nested processors: compose processors for shared filtering logic across multiple resources
- `rubanok` is intentionally minimal — no magic auto-detection, no meta-programming beyond the DSL
- Sorbet/RBS type signatures available for Processor classes via `sorbetting` the gem
