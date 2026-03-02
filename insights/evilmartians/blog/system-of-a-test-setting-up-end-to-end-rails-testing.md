---
title: "System of a Test: Proper Browser Testing in Ruby on Rails"
description: "End-to-end Rails system test setup using Cuprite, Ferrum, and Capybara with Chrome DevTools Protocol, replacing Selenium for faster and simpler browser testing"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/system-of-a-test-setting-up-end-to-end-rails-testing"
  date: '2020-07-14'
tags:
- rails
- testing
- system-tests
- capybara
- cuprite
- ferrum
- rspec
- browser-testing
- chrome-devtools-protocol
---

# System of a Test: Proper Browser Testing in Ruby on Rails

A definitive guide to configuring end-to-end Rails system tests with Cuprite and Ferrum as a drop-in Selenium replacement, using the Chrome DevTools Protocol through pure Ruby.

## Why Replace Selenium

- Selenium requires a Java runtime and chromedriver binary — brittle versioning and installation overhead
- `cuprite` is a pure Ruby Capybara driver communicating directly with Chrome via CDP (no Java, no WebDriver)
- `ferrum` is the underlying CDP library; `cuprite` wraps it as a Capybara driver
- Cuprite is significantly faster than Selenium/ChromeDriver — async waits become reliable expectations rather than timing hacks
- Migrating from Selenium to Cuprite revealed flaky tests that only passed under Selenium due to slowness

## Directory Structure

- All system test support files live in `spec/system/support/`
- Use a dedicated `system_helper.rb` that requires `rails_helper` then loads all `spec/system/support/**/*.rb`
- Keep system tests in `spec/system/` and require `system_helper` instead of `rails_helper`
- Core support files: `better_rails_system_tests.rb`, `capybara_setup.rb`, `cuprite_setup.rb`, `precompile_assets.rb`

## Capybara Setup

- Set `Capybara.default_driver` and `Capybara.javascript_driver` to `:cuprite`
- Configure `Capybara.default_max_wait_time` (e.g., 2 seconds) for async interactions
- Set `Capybara.server = :puma, { Silent: true }` to suppress Puma output during tests
- Use `Capybara.app_host` with `127.0.0.1` (not `localhost`) to avoid DNS round-trips in Docker
- `Capybara.server_port` can be fixed to avoid port conflicts in parallel test runs

## Cuprite Driver Configuration

- Register driver: `Capybara.register_driver(:cuprite) { |app| Capybara::Cuprite::Driver.new(app, **options) }`
- Key options: `window_size: [1400, 900]`, `browser_options: { 'no-sandbox': nil }` (required in Docker/CI)
- `js_errors: true` — surfaces JavaScript errors in test output
- `headless: !ENV['HEADLESS'].in?(['n', 'false', '0'])` — allow headed mode via env var
- `process_timeout: 15`, `timeout: 10` to handle slow CI environments
- `inspector: true` — enables Chrome DevTools debugging when running headed

## BetterRailsSystemTests Module

- Override `failed_html` and `failed_screenshot` to save on-failure artifacts properly
- Use `Capybara.page.driver.browser.screenshot(path: ...)` for Cuprite-compatible screenshots
- Store screenshots in `tmp/screenshots/` — ensure directory exists in test setup
- Integrate with Percy for visual regression: call `Percy.snapshot(Capybara.page, ...)` after each failed screenshot
- The module is included in `ActionDispatch::SystemTestCase` to patch Rails' default system test behavior

## Asset Precompilation

- Precompile assets once before the suite using `RSpec.configure { |c| c.before(:suite) { precompile_assets } }`
- Guard with a flag so precompilation only runs once even with `--order random`
- Set `ENV['RAILS_ENV'] = 'test'` and call `Rails.application.load_tasks` then `Rake::Task['assets:precompile'].invoke`
- Use Webpacker's `webpacker:compile` task if using Webpacker instead of Sprockets
- In CI, precompile in a separate step and cache the `public/packs-test/` or `public/assets/` directory

## Running System Tests

- Use `HEADLESS=0` or `HEADLESS=false` to run tests with a visible browser window for debugging
- Use `INSPECTOR=true` with headed mode to auto-open Chrome DevTools on breakpoints
- `binding.pry` inside a test + headed mode allows live browser inspection mid-test
- Run only system specs: `rspec spec/system`
- In CI, always set `--no-sandbox` Chrome flag; add `--disable-dev-shm-usage` on low-memory containers

## Async and JavaScript Interactions

- Always use Capybara's `have_*` matchers (not direct `find`) for async assertions — they auto-retry until timeout
- `have_content`, `have_selector`, `have_css` all wait correctly; `page.find` raises immediately if missing
- Prefer `fill_in 'Label', with: 'value'` over CSS selectors for form inputs — more resilient to DOM changes
- `click_on`, `click_button`, `click_link` all trigger proper events; avoid `page.execute_script('..click()')` for user interactions
- Use `within '#scope' do ... end` to scope assertions to DOM subtrees

## Docker and CI Considerations

- Run Chrome in the same Docker network as the test process — `Capybara.server_host = '0.0.0.0'` makes the server bind correctly
- Set `BROWSER_URL: 'http://chrome:9222'` env var if using a remote Chrome container via `browser_url` Cuprite option
- Always add `--no-sandbox` and `--disable-gpu` Chrome flags in containerized environments
- Share `tmp/screenshots` as a CI artifact to inspect failures without re-running tests
- Allocate at least 512MB `/dev/shm` for Chrome — use `--shm-size=1gb` in Docker or `tmpfs` mounts
