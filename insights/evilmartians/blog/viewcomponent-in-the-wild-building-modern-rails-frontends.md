---
title: "ViewComponent in the Wild I: Building Modern Rails Frontends"
description: "Why and how to adopt the ViewComponent library in Rails MVC apps, covering component principles, testing, context patterns, slots, and design best practices"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Alexander Baygeldin"
  url: "https://evilmartians.com/chronicles/viewcomponent-in-the-wild-building-modern-rails-frontends"
  date: '2022-10-12'
tags:
- viewcomponent
- rails
- ruby
- frontend
- components
- testing
- hotwire
---

# ViewComponent in the Wild I: Building Modern Rails Frontends

ViewComponent brings the component-based architecture of frontend frameworks to Rails' server-rendered MVC view layer, eliminating the testability and maintainability problems of partials and view helpers.

## Why Server-Driven MVC Still Makes Sense

- Maintaining separate frontend and backend apps doubles team size, code volume, infrastructure complexity, and communication overhead
- GitHub — one of the most complex Rails apps in the world — still uses ERB templates for most views and is widely considered reliable and usable
- Hotwire (pioneered by Phoenix LiveView) enables responsive web interfaces without JavaScript, making SPAs unnecessary for many projects
- The right question isn't "why use classic MVC?" but "why wouldn't you?" — SPAs are often overkill
- The Rails asset pipeline (Propshaft, esbuild, Vite Ruby) has caught up with frontend tooling; the missing piece was design patterns

## Problems with Partials and View Helpers

- Partials violate basic code quality standards: tightly-coupled code, implicit arguments, unpredictable dataflow, magic constants
- View helpers make testing conditional branches deep in the view chain extremely difficult
- No sane way to write a healthy test pyramid using partials — forces reliance on slow, brittle system/request tests
- "Integrated tests are a scam" — coverage is never enough and tests are orders of magnitude slower
- Same problems frontend had in the jQuery-spaghetti era, now on the backend

## What ViewComponent Provides

- Core idea: a view component is a Ruby object with an associated template (ERB, Slim, etc.)
- Render a component by instantiating it with explicit constructor arguments and passing it to Rails' `#render`
- Brings full Ruby OOP to the view layer — inheritance, modules, encapsulation
- GitHub's codebase: ViewComponent unit tests are **over 100x faster** than equivalent controller tests
- Components are isolated, easily testable, reusable, and composable — the same qualities frontend frameworks popularized
- Reduces learning curve for frontend developers contributing to backend views (parity of mental model)
- Originated from Evil Martians' own "Evil Front" custom solution before ViewComponent was available

## Testing Components

- Test the public interface — the template — not internal helper methods (treat them like private methods)
- Use `render_inline(component)` in specs to render components in isolation without HTTP requests or a full browser
- Assert on behavior and content (`have_link`, `have_content`), not exact markup
- Cover conditional logic and string interpolations — the same things you'd test in any Ruby unit test
- Example structure: `describe Menu::Component`, `render_inline`, `context "when current_user is present"`, etc.
- For dynamic JS behavior: use ViewComponent previews loaded via system tests (`visit("/rails/view_components/my_component/default")`)
- Tests are "crazy fast" because they check static HTML output without HTTP requests

## Using Context to Pass Global State

- Problem: "popular" data (like `current_user`) must be drilled down every level of the component tree as arguments
- Solution: context — a shared object accessible by any component without explicit argument passing
- `dry-effects` gem implements algebraic effects for Ruby: set a value up the call stack, read it anywhere downstream
- Example: set `current_user` in the controller, access it in any view component
- Don't abuse context — the more implicit dependencies, the harder tracking data flow and writing tests becomes

## Avoiding Deep Nesting with Slots

- Deeply nested component trees cause argument drilling and tight coupling between parent and child components
- When child has different data requirements than parent, pass components down rather than data
- ViewComponent provides `content` accessor and **slots** (`renders_one`, `renders_many`) for this purpose
- Slot example: `Feed::Component` with `renders_one :pinned` and `renders_many :posts` — caller renders what goes in each slot
- Benefit: swap out child components freely without modifying parent; get reusability for free
- Trade-off: slot syntax is more verbose than passing data directly, but the decoupling is worth it for complex UIs

## General-Purpose vs App-Specific Components

- Separate **presentational** (general-purpose) components from **container** (app-specific) components
- Presentational: how things look, no knowledge of the app's data model, no `ActiveRecord` objects
- Container: how things work, uses the palette of presentational components to render actual application data
- Passing an `ActiveRecord` object to a component signals it's app-specific
- This separation maximizes reuse across the app and keeps UI consistent
- Possible to open-source your general-purpose component library (e.g., GitHub's Primer ViewComponents)

## Single Responsibility and Component Size

- Large templates (even 100 lines) are a code smell — everything in a template is connected, making coupling subtle
- Deeply nested, large component trees are hard to understand, refactor, and reuse — the coupling compounds over time
- Stick to the **single-responsibility principle**: each component does one thing
- Decomposing large trees takes effort but keeps complexity manageable long-term
- "Low coupling, high cohesion" applies to components just as it does to modules and classes

## Avoiding Database Queries in Components

- Views are for rendering data, not fetching it — fetch in controllers, preload associations eagerly
- DB queries in views lead to N+1 problems that arise reliably and are difficult to track down
- As a proactive measure, consider prohibiting components from making DB queries entirely during development (setup shown in Part II)
- Separation of concerns makes testing easier: components that receive plain data are trivial to unit test
