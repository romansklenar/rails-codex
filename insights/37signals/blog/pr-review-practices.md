---
title: PR Review Practices
source:
  type: blog
  title: Minding the small stuff in pull request reviews
  author: Jorge Manrubia
  url: https://dev.37signals.com/minding-the-small-stuff-in-pr-reviews/
  date: '2023-08-30'
tags:
- process
- code-review
---

# PR Review Practices

Details matter. What feels like "nitpicking" is actually maintaining code quality in the zone between architecture (too big for reviews) and formatting (handled by linters).

## The Three Pillars

### 1. Naming

Names are the primary tool for code comprehension. Review them critically:

- **Be specific** — rename generic actions to reflect actual behavior
- **Use past tense for event handlers** — `linkClicked`, `linkFocused` (something happened, now react)
- **Match the domain** — use business language, not implementation language (see `domain-driven-naming.md`)

```ruby
# BEFORE — vague
def forward(url) = redirect_to(url)

# AFTER — says what it does
def click(url) = redirect_to(url)
```

### 2. Idiomatic Style

Prefer Ruby/Rails idioms over generic code:

```ruby
# Prefer idiomatic Rails
5.days.ago
items.ids

# Over manual equivalents
Time.current - 5 * 24 * 60 * 60
items.pluck(:id)
```

- **Clean conditionals** — multiline `if` over inline parenthesized ternaries
- **Safe navigation** — `user&.name` over `user && user.name`
- **Remove unnecessary guard clauses** — only guard when it genuinely reduces complexity

### 3. Consistency

Consistency is the highest-value review target. Linters catch formatting; humans catch patterns:

- Follow established project conventions even when alternatives are "also fine"
- Look for deviations from in-house style that automated tools miss
- Consistent patterns reduce cognitive load for every future reader

## Review Culture

- **Detailed feedback is a gift, not nitpicking** — it teaches newcomers the team style
- **Lead with the rule, explain why second** — "We use `ids` instead of `pluck(:id)` here because..."
- **Maintain a high bar** — small erosions compound into inconsistent codebases
- **Coding standards live in the middle ground** — too granular for architecture docs, too semantic for linters
