---
title: Capability Predicates
description: "Capability predicates on subtypes instead of type-checking"
source:
  type: blog
  title: The Rails Delegated Type Pattern
  author: Jeffrey Hardy, Kimberly Rhodes, Fernando Olivares
  url: https://dev.37signals.com/the-rails-delegated-type-pattern/
  date: '2025-12-19'
tags:
- rails
- patterns
---

# Capability Predicates

Declare what a subtype can do using capability predicates. This enables generic code to check capabilities instead of type-checking.

## Pattern

Define defaults in the base class, override in subtypes:

```ruby
class Recording < ApplicationRecord
  def commentable? = false
  def assignable? = false
  def threadable? = false
  def watchable?  = true   # all fragments are watchable by default
end

class Message < Recording
  def commentable? = true
  def assignable?  = true
end

class Document < Recording
  def commentable? = true
  def threadable?  = true
end
```

## Usage

```ruby
# In views
<%= render 'comments/form' if record.commentable? %>

# In controllers
if @record.assignable?
  @assignees = User.assignable_to(@record)
end
```

## Why Not `is_a?`

```ruby
# BAD — couples code to specific types
if record.is_a?(Message) || record.is_a?(Document)
  render_comments
end

# GOOD — asks about capability
if record.commentable?
  render_comments
end
```

Adding a new commentable type requires zero changes to existing code.
