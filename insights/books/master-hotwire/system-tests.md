---
title: "System Testing Hotwire Applications"
description: "Practical guidance for writing robust, non-flaky system tests for Hotwire-powered Rails apps, covering timing, collaborative features, WebSocket connections, and background job broadcasting."
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
  date: "2026-02-01"
tags: [testing, system-tests, capybara, turbo, stimulus, flaky-tests, minitest]
---

# System Testing Hotwire Applications

Practical guidance for writing robust, non-flaky system tests for Hotwire-powered Rails apps, covering timing, collaborative features, WebSocket connections, and background job broadcasting.

## Why System Tests Over Unit Tests for Hotwire

- Hotwire business logic lives almost entirely on the back end — Rails unit tests cover it directly without needing JavaScript test infrastructure.
- Turbo and Stimulus front-end behaviour is tightly coupled to server-rendered HTML; stubbing that HTML in a JS unit test costs more than it saves.
- System tests with a headless browser treat the app as a black box and exercise the full Hotwire stack without extra setup complexity.
- Skip JS unit tests for Hotwire front-end code; prefer system tests via Capybara and a headless browser driver.

## Root Cause of Flakiness: Race Conditions

- System tests execute orders of magnitude faster than a human would, so they can try to interact with an element a split second before Hotwire finishes an incremental server round-trip update.
- Hotwire's many partial-page updates (Turbo Drive navigations, Turbo Frame refreshes, Turbo Stream broadcasts) each introduce async latency windows — all are potential flakiness sources.
- A 100 ms server round-trip is imperceptible to users but an eternity relative to test execution speed, making timing assertions critical.
- Flakiness manifests as intermittent failures: the test sometimes runs faster than the update arrives, sometimes not.

## Capybara's Built-in Waiting Mechanism

- Capybara automatically retries element lookups until they succeed or a configurable timeout is reached — exploit this instead of adding explicit sleeps.
- `within(selector)` — waits until the CSS/XPath selector matches an element before scoping interactions to it.
- `click_on(text)` — waits until a button or link matching the text is present before clicking.
- `fill_in(label, with: value)` — waits until a form field matching the label appears before filling it.
- `assert_text(text)` — waits until the given text is visible on the page; use it to confirm the UI has reached a stable post-update state.
- `assert_no_text(text)` — waits until the given text is absent; use it to confirm a loading indicator or old content has disappeared.
- Beware of `assert_no_text` typos: asserting on text that never appeared makes the check trivially pass without detecting a real problem.

## Stable-State Assertion Pattern

- General rule: before each interaction, assert that the UI has reached the state that logically precedes that interaction — assert what a user would perceive.
- Prefer asserting on user-visible content (text, labels) over implementation details (CSS classes, DOM structure) for resilience to refactors.
- Two canonical patterns:
  - `assert_text "Please fill in your details"` — text appearing means the UI is ready for input.
  - `assert_no_text "Loading ..."` — text disappearing means a transition has completed.
- Annotate test steps with "waits until" comments to make the synchronisation intent explicit for future readers.

## Example: Basic Hotwire Test with Synchronisation

```ruby
test "should create ticket" do
  visit tickets_url

  # within waits until the selector returns an element
  within "[data-ticket-state='next']" do
    # click_on waits until a button matching the text appears
    click_on "New ticket"

    # fill_in waits until field matching the text appears
    fill_in "Description", with: "New ticket description"
    fill_in "Title", with: "New ticket title"
    click_on "Create Ticket"
  end

  # assert_text waits until the text appears on the page
  assert_text "New ticket title"
  assert_text "Ticket was successfully created"
end
```

## Testing Collaborative / Multi-User Features

- Turbo Stream broadcasts make collaborative live-update features trivial to build, so testing them becomes more common and more important.
- `Capybara.using_session(session_name)` — switches the active Capybara session; each named session behaves as a completely independent browser instance with its own cookies, URL, and DOM.
- Create as many named sessions as needed and switch between them freely within a single test.
- Sessions persist across `using_session` calls with the same name — re-enter a session to continue where it left off.

```ruby
test "two users at the same time" do
  visit "/"
  login_as users(:jack)

  Capybara.using_session "other user" do
    visit "/"
    login_as users(:jill)
  end

  # back to Jack's session

  Capybara.using_session "other user" do
    # Jill's session continues from where it left off
  end
end
```

## Background Jobs and Broadcast Debouncing

- Turbo Stream broadcasts are dispatched via background jobs — these jobs do **not** run automatically in system tests by default.
- Wrap the user action that triggers a broadcast in `perform_enqueued_jobs { ... }` to force inline job execution.
- `turbo-rails` debounces broadcasts: it waits ~500 ms after a model save before enqueuing the broadcast job, preventing duplicate messages from multiple saves in one controller action.
- Naive fix that does **not** work: wrapping only `click_on` and an immediate `assert_text` inside `perform_enqueued_jobs` — the HTTP response returns before the 500 ms debounce fires, so the job is enqueued *after* the block exits.
- Correct fix: place the *other user's* `assert_text` assertion **inside** the `perform_enqueued_jobs` block — Capybara's retry loop keeps the block open long enough for the debounce to fire and the job to be enqueued and run.
- Never use `sleep` to paper over timing issues: it guesses a wait time that will still fail occasionally, and accumulates across a suite (a few seconds per test → minutes of wasted CI time per run).

## Example: Full Collaborative Broadcast Test

```ruby
test "reflects changes that another user made" do
  visit root_url

  new_title = "Updated ticket title"

  Capybara.using_session("other user") do
    visit root_url
    assert_no_text new_title  # establish baseline
  end

  click_on "Edit this ticket", match: :first
  fill_in "Title", with: new_title

  perform_enqueued_jobs do
    click_on "Update Ticket"

    # Capybara's retry keeps the block alive until the text appears,
    # giving the debounced broadcast job time to be enqueued and run.
    Capybara.using_session("other user") do
      assert_text new_title
    end
  end
end
```

## WebSocket Connection Timing

- When a page loads, Turbo establishes a WebSocket (Action Cable) connection to receive stream broadcasts — this connection takes a non-zero amount of time.
- Because tests run so fast, a broadcast can fire before the WebSocket connection is fully established, causing the other session to miss the update.
- `connect_turbo_cable_stream_sources` — provided by `turbo-rails`; blocks until all Turbo Cable stream connections on the current page are established.
- `turbo-rails` monkey-patches the Capybara `visit` helper to call `connect_turbo_cable_stream_sources` automatically, which is why basic tests work without an explicit call.
- Call `connect_turbo_cable_stream_sources` manually after interactions that navigate outside of `visit` (e.g. after `click_link` or `click_button` that triggers a Turbo Drive navigation) to prevent this race condition in complex scenarios.

## Summary of Key Rules

- Use Capybara's built-in waiting helpers (`within`, `click_on`, `fill_in`, `assert_text`, `assert_no_text`) as the primary synchronisation mechanism — never `sleep`.
- Assert on user-visible content that signals a stable state before each subsequent interaction.
- Simulate multiple users with `Capybara.using_session(name)` — one named session per concurrent actor.
- Wrap broadcast-triggering actions in `perform_enqueued_jobs` to force background job execution.
- Place the observing session's assertion *inside* `perform_enqueued_jobs` to handle broadcast debouncing correctly.
- Call `connect_turbo_cable_stream_sources` after non-`visit` navigations when testing live-update scenarios.
