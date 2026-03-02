---
title: "Hotwire System Tests"
description: "Flakiness reduction, broadcast testing, multiple sessions, WebSocket timing"
source:
  type: book
  title: "Master Hotwire"
  author: "Andrea Fomera"
  url: "https://store.masterhotwire.com"
tags: [testing, system-tests, capybara, turbo, flaky-tests]
---

# Hotwire System Tests

Reducing flakiness and testing collaborative features.

## Timing / Race Conditions
Tests run faster than humans - assert stable state before next interaction:
```ruby
# Capybara waits automatically for these:
within "[data-state='ready']" do  # waits for selector
  click_on "Submit"               # waits for button
  fill_in "Name", with: "Test"    # waits for field
end
expect(page).to have_text "Success"       # waits for text
expect(page).to have_no_text "Loading..."  # waits for absence

# Minitest alternative:
# assert_text "Success"
# assert_no_text "Loading..."
```

## Testing Broadcasts
Broadcasts run via background jobs with 500ms debounce:
```ruby
it "broadcasts live updates" do
  visit root_url

  Capybara.using_session("other_user") do
    visit root_url
    expect(page).to have_no_text "New item"
  end

  perform_enqueued_jobs do
    click_on "Create Item"
    # Keep assertion INSIDE block (debounce needs time)
    Capybara.using_session("other_user") do
      expect(page).to have_text "New item"  # Capybara waits here
    end
  end
end

# Minitest alternative:
# test "live updates" do
#   ...
#   assert_text "New item"
# end
```

## Multiple Browser Sessions
```ruby
# FactoryBot (this project)
let(:alice) { create(:user, name: "Alice") }
let(:bob)   { create(:user, name: "Bob") }

Capybara.using_session("user_a") do
  visit root_url
  sign_in_as alice
end

Capybara.using_session("user_b") do
  visit root_url
  sign_in_as bob
end
# Switch as many times as needed

# Fixtures alternative:
# sign_in_as users(:alice)
# sign_in_as users(:bob)
```

## WebSocket Connection Timing
```ruby
# turbo-rails patches `visit` to wait for connections
# But after click_link/click_button, call manually:
connect_turbo_cable_stream_sources
```

## Avoid sleep()
- Never `sleep 0.5` - use `have_text` / `have_no_text` matchers instead
- Capybara retry timeout handles waits properly
- Sleep slows suite and still causes flakiness
