---
title: "It Deserved Its Own Tome: Layered Design and the Extended Rails Way"
description: "Vladimir Dementyev's book 'Layered Design for Ruby on Rails Applications' introduces the Extended Rails Way — an experience-driven methodology using abstraction layers to keep growing Rails codebases maintainable"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/it-deserved-its-own-tome-layered-design-and-the-extended-rails-way"
  date: '2023-08-29'
tags: [rails, architecture, layered-design, service-objects, form-objects, query-objects, abstraction, maintainability]
---

# It Deserved Its Own Tome: Layered Design and the Extended Rails Way

Vladimir Dementyev's "Layered Design for Ruby on Rails Applications" (Packt, August 2023) codifies the Extended Rails Way — a layered abstraction approach that keeps Rails applications maintainable as they grow without abandoning Rails conventions.

## Why the Book Exists

- Packt approached Dementyev to write a book based on his blog posts and internal Evil Martians training materials
- The Rails Way optimizes for developer productivity and small teams — it becomes strained at scale
- The common escape hatch is abandoning Rails conventions entirely (DDD, hexagonal architecture)
- The Extended Rails Way is a third path: add abstraction layers while staying within Rails idioms
- The book is experience-driven: patterns extracted from real Evil Martians client projects
- Audience: developers working on Rails apps that have grown beyond the initial "move fast" phase

## The Rails Way and Its Limits

- Rails Way: fat models, thin controllers, convention over configuration — excellent for greenfield
- Fat models grow into God objects — a User model with 1,500 lines is an anti-pattern, not a feature
- Fat controllers mix HTTP concerns with business logic — hard to test, hard to reuse
- The Rails Way gives no guidance for the "waiting room" of abstractions — where does complex logic live?
- Understanding the Rails Way deeply is a prerequisite for knowing when and how to extend it
- Web applications are a specific kind of software — their architecture should reflect the nature of web requests

## The Layered Architecture Concept

- Layers reflect the natural flow of data through an application: input → processing → persistence → output
- Each layer has a clear responsibility; crossing layer boundaries is explicit and intentional
- The Service Layer is described as "a waiting room for abstractions that have yet to reveal themselves"
- Layers are not rigid boxes — they are guidelines for organizing code by conceptual responsibility
- The Extended Rails Way does not require external frameworks (dry-rb, ROM, etc.) — Rails primitives suffice
- Gradually introduce layers as complexity emerges; do not over-engineer upfront

## Key Abstraction Layers Covered

- **Query Objects**: extract complex ActiveRecord queries from models; encapsulate Arel; enable reuse and composition
- **Form Objects**: separate HTML form processing from model persistence; handle multi-model forms, virtual attributes
- **Value Objects**: encapsulate domain concepts (Money, EmailAddress, PhoneNumber) with equality and validation
- **Service Objects**: units of work encapsulating a business operation; return Result objects for success/failure
- **Policies (Authorization Layer)**: class-based authorization replacing ad-hoc model methods; Action Policy fits naturally
- **Notification Layer**: extract mailers and notification dispatch from models and controllers
- **Configuration Layer**: class-based configuration objects replace raw `ENV` access throughout the app

## Fat Model to Service Object Migration

- Start: `User#activate!` mixes persistence, email sending, audit logging, and payment events
- Step 1: extract email sending to `UserMailer` (already Rails-idiomatic)
- Step 2: extract payment event to a service: `PaymentService.charge(user)`
- Step 3: extract the coordination to `Users::ActivationService.call(user)`
- Service objects: single public method (`.call`), return a Result or raise, no state between calls
- `dry-monads` Result type is optional but useful: `Success(user)` vs. `Failure(:already_active)`
- Avoid generic `ApplicationService` base classes — prefer plain Ruby objects with `include ActiveSupport::Callbacks` if needed

## Query Objects

- Scope vs. Query Object: scopes are fine for simple, composable conditions; query objects for complex multi-table queries
- A query object is a Ruby class with a `.call(relation)` interface: `EventsByDateQuery.call(Event.all, date: date)`
- Query objects encapsulate Arel nodes — keeping raw SQL out of models and controllers
- Composable: `EventsByDateQuery.call(UpcomingEventsQuery.call(Event.all))`
- Repositories: optional next step — wraps a model entirely, hiding ActiveRecord from the service layer
- Repositories suit apps that need to swap persistence backends; overkill for typical Rails projects

## Form Objects

- Form objects separate HTML form handling from ActiveRecord persistence
- Use `ActiveModel::Model` and `ActiveModel::Attributes` to build form objects with validations
- Multi-model forms: one form object coordinates multiple `ActiveRecord` saves in a transaction
- Virtual attributes: checkboxes, date-part fields, confirmation fields live in the form object, not the model
- `reform` gem is an alternative; the book favors plain `ActiveModel` to minimize external dependencies
- Form objects colocate with their controller action: `app/forms/users/registration_form.rb`

## Authorization as a Layer

- Ad-hoc `can?` checks scattered in models and views break down as permission logic grows
- Class-based policies: `UserPolicy#update?` returns true/false based on current user and record
- `action_policy` gem (Evil Martians): policy classes with caching, scopes, and Rails integration
- Policies belong in a dedicated layer: `app/policies/` — not in models, not in controllers
- Policy scopes: `UserPolicy::Scope.new(user, User.all).resolve` returns permitted records for a user
- Authorization should be explicit and tested — not buried in model callbacks

## Notification and Configuration Layers

- Notification layer: abstract over delivery channels (email, SMS, push, in-app) behind a unified interface
- `app/notifications/` houses channel-agnostic notification objects; mailers become delivery adapters
- Configuration layer: `app/config/` holds plain Ruby configuration classes instead of raw `ENV[]` calls
- `anyway_config` gem: typed configuration with multi-source loading (env, YAML, secrets) and validation
- Configuration classes are testable and provide a single source of truth for app settings
