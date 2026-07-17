---
type: insight
title: "Hilary Stohs-Krause: Scaling Rails with Small Wins"
description: "How incremental, developer-level performance habits — choosing the right ActiveRecord method, eliminating flaky tests, standardizing code conventions — compound into meaningful system-wide improvements in a large Rails monolith."
resource: "https://podcast.rubyonrails.org/2462975/episodes/17742159-hilary-stohs-krause-scaling-rails-with-small-wins"
tags: [performance, activerecord, testing, flaky-tests, hotwire, turbo, stimulus, rubocop, engineering-culture, monolith]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17742159-hilary-stohs-krause-scaling-rails-with-small-wins"
  date: 2025-09-01
---

# Hilary Stohs-Krause: Scaling Rails with Small Wins

Senior Software Engineer Hilary Stohs-Krause (Red Canary) makes the case that everyday developer choices — which ActiveRecord method to call, how to structure a page, whether a test is order-dependent — accumulate into the same performance impact as the big-ticket architectural work, and are accessible to engineers at every level.

## Everyday ActiveRecord Method Selection

- `count` always issues a `SELECT COUNT` SQL query regardless of whether the relation is loaded
- `length` loads the entire relation into memory if it is not already cached, then counts in Ruby
- `size` is context-aware: uses the in-memory count if the relation is loaded, otherwise falls back to a `COUNT` query — the safest default for most cases
- `tr` is approximately 3× faster than `gsub` for simple character substitution; same outcome, different cost
- Choosing `to eq [a, b, c]` in RSpec tests creates order-dependent assertions; `match_array` tests content only and eliminates a class of flaky failures
- The rule of thumb: understand the trade-offs of each method before defaulting to what "looks right" — outcome equivalence does not mean process equivalence
- Benchmarking every call is impractical; instead, establish team-wide coding conventions that encode the preferred default (e.g., "prefer `size` unless real-time count is required")

## Caching Strategy and Data Freshness Trade-offs

- Red Canary caches expensive aggregate counts in the database via an overnight background job rather than hitting the database on every page load for large customers
- Acceptable staleness depends on usage pattern: a permissions settings page visited once a month can tolerate cached data; a real-time threat count cannot
- A hybrid approach (pre-cache for large tenants, live-query for small ones) reduces unnecessary background processing but adds operational complexity: support teams must track which tier a customer is on, and tier transitions can surprise users with visual changes
- Page-load context matters: a landing/index page that is the entry point to a session gets hit by every user on login, making it disproportionately expensive relative to pages visited deliberately
- Logging actual user behavior before optimizing prevents false assumptions: a page known internally as "important" turned out to be visited by customers roughly once a month, which changed every performance and UX decision for that page

## Page Design as a Performance Lever

- Removing an automatically-rendered list of the 30 most recent records from an index page (replacing it with a search/filter form as the landing state) eliminated a large join-table query on every visit and better matched observed user intent
- The decision was data-driven: logging showed users arrived at the page to find a specific record, not to browse the most recent ones
- Not paginating a low-frequency settings page and instead allowing multi-select bulk editing was the right call precisely because the usage data showed infrequent visits
- Defaulting to "show all recent items" on index pages is a Rails convention that should be challenged with usage data rather than assumed to be correct

## Eliminating Flaky Tests

- Flakiness accumulates gradually; teams normalize it until CI queue ejections become a routine blocker rather than a signal
- Red Canary quantified lost developer time from flaky tests by pulling CI service data — this metric was the key lever for securing management buy-in to address the problem
- Common root causes identified: order-dependent array assertions (`to eq` instead of `match_array`), time zone inconsistencies, and test data leaking between specs
- The SitePrism gem (`site_prism`) runs the browser on a separate thread from the spec, provides built-in `wait_until_<element>_visible` helpers, and eliminates the need for `sleep N` calls in system specs — dramatically reduced flakiness in front-end system specs at Red Canary
- Flaky tests were tracked in a dedicated Slack channel that auto-converted reports into tickets in a standing epic; on-call engineers and engineers between epics worked them down
- Recognizing patterns across flaky tests (e.g., "we keep getting burned by time zones") accelerates fixes: once the pattern is known, each instance takes minutes rather than hours
- Red Canary reduced flaky-test-related time loss by approximately 50% through this initiative, with further improvement ongoing

## CI and Continuous Deployment Hygiene

- Red Canary uses continuous deployment; engineers are expected to monitor error-reporting Slack channels after merging and watch for new exceptions attributed to their commit
- The error-reporting service attempts to identify the suspect commit automatically — useful but not always accurate
- On-call shifts are week-long; sprint work during on-call is treated as a bonus, not an expectation — the week is reserved for site reliability: reviewing database health trends, checking for performance regressions, adding monitoring documentation
- Some engineers start their day by triaging new exception reports in Slack and self-assigning quick fixes — an organic habit that distributes monitoring load without formal assignment

## Migrating from React to Hotwire/Turbo/Stimulus

- The migration rationale was primarily developer familiarity: most engineers at Red Canary were hired for Ruby/Rails skills, and React code slowed down changes because few engineers had deep React experience
- Performance in React-heavy areas of the product was a contributing (not primary) factor — those areas were the ones most often associated with loading bottlenecks
- Migration strategy: convert a page only when it is already scheduled for a larger redesign/feature overhaul, not as a standalone refactor; this avoids one-to-one parity work and lets the team build what is actually needed
- A shared [ViewComponent](../../blogs/evilmartians/viewcomponent-in-the-wild-building-modern-rails-frontends.md) library built by designer-engineers dramatically reduced conversion effort — one engineer converted a large React table to a ViewComponent in far less time than expected because he could instantiate an existing component rather than rewrite JavaScript from scratch
- CoffeeScript files lingered in the repository until a deliberate cleanup effort was championed; a [custom RuboCop cop](../../blogs/evilmartians/writing-custom-rubocop-rules-in-2026.md) now prevents new CoffeeScript files from being added
- React code still exists in the repo and is being maintained in parallel during the transition; engineers writing new React code during this period accept that it will need conversion later
- SitePrism made new system specs for Turbo/Stimulus-backed pages easier to write and less brittle than the equivalent React system specs had been

## Code Standards, Linters, and Convention Enforcement

- Red Canary's linter stack: RuboCop (with custom cops), HamlLint, ESLint, HetaLint (Docker), and at least one additional linter
- Custom RuboCop cops enforce non-obvious conventions (e.g., preferred model class structure: constants → delegates → scopes → validations → associations → callbacks → public methods)
- GitHub Actions post automated PR comments when specific sensitive or convention-critical files are touched — a safety net for cases too nuanced for a RuboCop rule
- A central coding standards document covers preferred languages, spec conventions, migration best practices, and historical decisions (e.g., why the codebase standardized on fewer languages after accumulating five or six at its peak)
- Linters enforce standards impersonally: they remove the dynamic where code reviewers inadvertently apply personal preferences, reducing friction and subjective debate in PRs
- The hardest part of adding a new linting rule is not the rule itself — it is converting the existing backlog; one HamlLint rule set introduced years ago still has outstanding to-do tickets
- Recommended tactic for large backlog items: break tickets into the smallest possible units (half the original story size) so engineers can pick one up on a Friday afternoon and complete it in a single sitting

## Engineering Culture Around Incremental Improvement

- At Red Canary (~100 engineers, ~400 employees, 11 years old), all engineering leadership up to VP and CEO level have engineering backgrounds — this produces innate understanding of why tech debt and documentation have value, making it easier to get time allocated for improvement work
- Making a one-point ticket for documentation or cleanup work provides psychological permission to treat it as real sprint work, not stolen time
- A "rubber duck" Slack channel and team-level channels normalized asking for help and sharing new learnings — explicitly modeled by senior and architect-level engineers saying "I have no idea what I did here"
- Gamification (tracking who eliminated the most CoffeeScript files, posting weekly leaderboard updates) was attempted; impact was unclear but it generated some awareness and momentum
- Champions of improvement initiatives should expect to do a disproportionate share of the work themselves; external validation is sparse — document and improve for the benefit of future team members and your future self
- Any engineer at any level can champion a standards initiative; becoming "the HamlLint person" or "the accessibility person" is a visible, career-building contribution in a large organization where individual contributors can otherwise be invisible
- Resulting (judging a decision by its outcome rather than the quality of the process that produced it) is a common and counterproductive pattern in engineering post-mortems — "Thinking in Bets" by Annie Duke is a recommended read for recalibrating how teams assign blame and learn from incidents
