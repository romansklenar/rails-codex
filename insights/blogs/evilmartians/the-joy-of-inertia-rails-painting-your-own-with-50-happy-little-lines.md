---
title: "The Joy of Inertia Rails: Painting Your Own with 50 Happy Little Lines"
description: "Builds a working Inertia implementation from scratch — a ~50-line React client and 16-line Rails renderer — to show the entire wire format is one page object, one header, and every feature is that same format applied again."
source:
  type: blog
  title: "Martian Chronicles"
  author: "Svyatoslav Kryukov"
  url: "https://evilmartians.com/chronicles/the-joy-of-inertia-rails-painting-your-own-with-50-happy-little-lines"
  date: '2026-07-14'
tags:
- inertia
- rails
- react
- spa
- turbolinks
- turbo-drive
- hotwire
- wire-format
- csrf
- action-controller
- vue
- svelte
---

# The Joy of Inertia Rails: Painting Your Own with 50 Happy Little Lines

A from-scratch reimplementation of Inertia — a ~50-line React client and a 16-line Rails renderer — proving that Inertia "isn't a framework" but a tiny wire format (one page object + one header) where every feature is that same format applied again.

## The Core Premise: The Server Owns the Page

- **Turbolinks (2012) mechanics**: intercept click → fetch next page's HTML over XHR (today `fetch`) → swap `<body>` → keep the JS runtime alive → `pushState` to update the URL. No full navigation, so the app feels like an SPA while the server keeps routing, auth, rendering, redirects. No API layer, no client-side router, no state sync. Lives on today as Turbo Drive.
- **The radical premise**: the server owns the page.
- **Inertia's mutation** (Jonathan Reinink): *what is the smallest change to the Turbolinks idea that survives component views (React/Vue/Svelte)?* Turbolinks has no server-rendered `<body>` to swap when the view is a browser-side component.
- **A component is just a function of two things**: a name and its props. So: on the first visit render HTML as always; on every visit after, render JSON describing which component to draw with what props.

## The Wire Format: One Page Object, One Header

- **The page object** answers "what goes in the JSON?" — four fields: `component`, `props`, `url` (so the address bar can tell the truth), `version` (asset version, so the server notices a tab running last week's JS):

```json
{
  "component": "pages/about",
  "props": { "year": 2026 },
  "url": "/about",
  "version": "1"
}
```

- **The header** answers "how does the server know which visit this is?" — one request header `X-Inertia: true`:
  - **Present** → server returns the JSON page object.
  - **Absent** (first visit) → server returns a full HTML page with that same page object embedded in `<script type="application/json">` for the client to boot from.
- **That is the entire protocol**: one page object, one header, two representations of the same URL.
- **Inertia v3 grew but stayed additive**: each extra page-object field is optional, appears only when its feature does, and carries exactly one feature — `deferredProps` rides with lazy loading, `mergeProps` with pagination, `clearHistory` with logout. The minimal page object is still the same four fields.

## The Client in 50 Lines

- **`visit()` is the whole brush** — a "navigation" is five plain lines; no client-side router, no route table (the server still owns URLs):

```js
async visit(url, { replace = false } = {}) {
  const response = await fetch(url, {
    headers: { 'X-Inertia': 'true', 'X-Inertia-Version': this.page.version },
  })
  const page = await response.json()
  const method = replace ? 'replaceState' : 'pushState'
  history[method](page, '', page.url)
  this.setPage(page)
}
```

- **The rest is same-caliber bookkeeping**:
  - `<Link>` is an anchor that steps aside for modified/middle clicks (new tabs, downloads keep working), then `preventDefault()`s and calls `visit()`.
  - **String-to-component mapping is the app's job**, not the framework's — a small registry (or Vite glob import) resolves `'pages/about'` to the real component.
  - **Back/forward work** because each page object was pushed into `history.state`; restoring is one listener: `(event) => event.state && setPage(event.state)`.
  - **Boot** reads the server-left page object from the `<script>` tag, seeds it via `history.replaceState`, then renders.
  - `usePage()` returns the whole page object so components reach `url` and `version` too.
- **One honest shortcut**: `version: '1'` is hardcoded where the real gem digests the asset bundle.
- **Adapters**: the router and page object know nothing about React — hooks/JSX are just the rendering shell. A Vue adapter maps the same page object onto a reactive component; Svelte onto `mount`. An "adapter" is the same technique on a different canvas; the official client ships all three over one shared core.

## The Rails Half in 16 Lines

- **The server's entire job is answering that one header** — done via `ActionController::Renderers.add` (the same public API behind `render json:`, present since Rails 3):

```ruby
# config/initializers/inertia.rb
ActiveSupport.on_load(:action_controller) do
  ActionController::Renderers.add :inertia do |component, options|
    page = {
      component: component,
      props: options.fetch(:props, {}),
      url: request.original_fullpath,
      version: '1',
    }
    if request.headers['X-Inertia']
      response.set_header('X-Inertia', 'true')
      render json: page
    else
      render html: helpers.tag.script(page.to_json.html_safe, type: 'application/json', id: 'page') + helpers.tag.div(id: 'app'), layout: true
    end
  end
end
```

- This is not an approximation — it is the same mechanism the real gem registers in its engine, down to calling `render` from inside the renderer block.
- **`render inertia:` becomes a first-class sibling of `render json:`**. The HTML branch renders the page object into `<script type="application/json">` beside an empty `<div id="app">` mount, dropped into the regular app layout (`layout: true`) — exactly what the client's boot reads.

## Convention Over Configuration in 3 Lines

- `render inertia: 'pages/about', props: { year: 2026 }` works but repeats what Rails already knows. Override `default_render` (Rails' "the action finished without rendering" hook):

```ruby
class ApplicationController < ActionController::Base
  def default_render
    render inertia: "#{controller_path}/#{action_name}", props: view_assigns.symbolize_keys
  end
end
```

- Now a controller is bare Rails: set an instance variable, done. Component name is derived from `controller_path`/`action_name`; props are the ivars; the explicit `render inertia:` still works.

```ruby
class PagesController < ApplicationController
  def about
    @year = 2026
  end
end
```

- **Gotcha**: *every* ivar becomes a prop, `@current_user` included — and a model prop serializes through `as_json`, meaning every column, password digest and all. Use serializers to control this.
- **Debugging is plain HTTP** — the entire surface fits in curl:

```
$ curl -H 'X-Inertia: true' -H 'X-Inertia-Version: 1' localhost:5190/about
{"component":"pages/about","props":{"year":2026},"url":"/about","version":"1"}
```

## Every Feature Is the Same Format Applied Again

- **Deploy refresh (+3 client lines)**: the page object already carries `version` and the client echoes it in a header, so a stale version gets `409 Conflict` + an `X-Inertia-Location` header. The client's entire reaction:

```js
if (response.status === 409) {
  return (window.location = response.headers.get("X-Inertia-Location"));
}
```

  One real page load fetches fresh JS. Server side is a three-line branch; plain first visits carry no version and skip it. The one deliberate moment the "canvas dries."

- **Forms (+6 client lines)**: teach `visit()` a method and JSON body, send Rails' CSRF token in `X-CSRF-Token` (from the `csrf-token` meta tag; forgery protection stays on, tokenless POST still gets 422). The controller is 20-year-old Rails — validate, stash errors, redirect:

```ruby
def create
  message = Message.new(name: params[:name].presence || "Anonymous", message: params[:message])
  unless message.save
    session[:inertia_errors] = { message: message.errors[:message].first }
  end
  redirect_to "/guestbook", status: :see_other
end
```

  - **`status: :see_other` (303)** keeps PRG safe beyond POST — tells the browser to follow with a GET no matter the original method. `fetch` replays PUT/PATCH/DELETE against a plain 302 target, so the gem's middleware rewrites those to 303.
  - `fetch` follows the 303 on its own and re-sends headers, so the arriving response is already the *next* page's JSON — the existing swap path consumes it unchanged.
  - **Errors ride the session** across the redirect and arrive as one more prop — the whole delivery mechanism is one renderer line: `props: options.fetch(:props, {}).merge(errors: session.delete(:inertia_errors) || {}),`

- **Partial reloads**: look like a data-fetching layer with dependency tracking; on the wire it is a header pair — client sends `X-Inertia-Partial-Data: messages` plus `X-Inertia-Partial-Component` (mismatch → full response), and the server filters the props hash *before evaluating it*. Write props as lambdas (`props: { messages: -> { Message.all.as_json }, users: -> { User.all.as_json } }`) so unrequested ones never run (query and serialization both skipped). Actual mechanism: `props.slice`.

- **External redirects** (OAuth, Stripe) — the whole implementation is two lines you've already met, the deploy-refresh mechanism aimed at a different URL:

```ruby
def inertia_location(url)
  headers['X-Inertia-Location'] = url
  head :conflict
end
```

- **Deferred props**: look like suspense-and-streaming; the server leaves the prop out and lists its name in a `deferredProps` field, the client renders then immediately fetches the missing props — using a partial reload.
- **Zero server code**: polling, prefetching, hover-instant visits, view transitions, progress bars — all the same brush tapped at cleverer moments.

## Where the Real Complexity Lives

- The 50 lines are the easy 90%. The hard part is **composition** (partial reloads meeting deferred/merge/once-props, with precedence rules) and **staying native to Rails** (errors/flash riding the session across redirects, CSRF). That reconciliation is the densest code in the gem.
- **The one true exception is SSR** — it runs components in a sidecar Node process, the single place Inertia costs an operational dependency instead of a header. Even that degrades gently: a dead sidecar falls back to client-side rendering, not a 500.
- The real `inertia_rails` integration is a **65-line engine** plugging into extension points Rails built for exactly this: the renderer registry, middleware stack, routing DSL, flash. Inertia hides inside `render`, `redirect_to`, and the session — Rails keeps being Rails, with React/Vue/Svelte as the view layer.
- **Governance note**: Inertia's protocol, all three official clients, and the Laravel adapter are developed by Laravel's team (creator handed the project to Laravel in 2025). Rails gets full-time, framework-funded frontend staffing for free.

## The Takeaway

- **When evaluating a frontend architecture, ask to see its wire format before its feature list.** If nobody can show you the core in fifty lines, the magic is load-bearing — and load-bearing magic is what pings you at 2 a.m.
- A small wire format does not erase complexity; it tells you where to look for it. Inertia's protocol is small enough to rebuild in an afternoon, and it spends its complexity budget on the edges you'd actually hit.
- Demo app (one Git commit per feature): `skryukov/the-joy-of-inertia-rails`.
