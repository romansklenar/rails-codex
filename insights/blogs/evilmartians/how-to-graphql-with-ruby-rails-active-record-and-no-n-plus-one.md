---
type: insight
title: "How to GraphQL with Ruby, Rails, Active Record, and No N+1"
description: "Six techniques to eliminate N+1 queries in graphql-ruby: preloading, Lookahead, ar_lazy_preload gem, field extensions, graphql-ruby lazy resolvers, graphql-batch (Shopify), and Dataloader"
resource: "https://evilmartians.com/chronicles/how-to-graphql-with-ruby-rails-active-record-and-no-n-plus-one"
tags: [graphql, rails, ruby, active-record, n-plus-one, performance, graphql-ruby, ar-lazy-preload]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Dmitry Tsepelev"
  url: "https://evilmartians.com/chronicles/how-to-graphql-with-ruby-rails-active-record-and-no-n-plus-one"
  date: '2020-11-09'
---

# How to GraphQL with Ruby, Rails, Active Record, and No N+1

Six progressively sophisticated approaches to eliminate N+1 database queries in `graphql-ruby` applications, from eager loading to dataloader fibers.

## The N+1 Problem in GraphQL

- GraphQL resolves associations at runtime based on the requested fields — the full list of associations is not known until query execution
- Default behavior: 1 query for parent records + N queries for each association (hence "N+1" or "1+N")
- Preloading all possible associations in advance can strain the database more than selective N+1 when the schema is rich
- GraphQL execution engine processes a query and prepares responses — understanding it is key to solving N+1

## Example Schema (Twitter Clone)

- Types: `Tweet` (content, author), `User` (nickname), `Viewer` (current user's feed)
- `Viewer` exposes `feed` field returning tweets from followed users via `FeedBuilder` query object
- `FeedBuilder.for(user)` returns `Tweet.where(author: user.followed_users).order(created_at: :desc).limit(10)`
- N+1 manifests when querying `viewer { feed { content author { nickname } } }` — 1 tweet query + N user queries

## Solution 0: Eager Load All Associations

- Extract feed loading to a Resolver class (`Resolvers::FeedResolver < Resolvers::BaseResolver`)
- Add `includes(:author)` to the base relation in the resolver
- Drawback: makes extra SQL query even when `author` is not requested
- Drawback: must manually list all associations at the top level; easy to miss new nested fields
- Useful when you control the frontend and know `author` data is almost always needed

## Solution 1: Lookahead

- `graphql-ruby` provides `Lookahead` — knows which fields were requested before resolution
- Add `extras [:lookahead]` to the resolver and check `lookahead.selects?(:author)` before adding `includes`
- Selectively calls `Tweet.includes(:author)` only when `author` field is in the query
- Works well for simple, shallow associations
- Becomes unwieldy with nested associations (author has avatar, tweet has likes, etc.) — requires deeply nested conditionals
- Example: checking `lookahead.selection(:author).selects?(:avatar)` then `lookahead.selection(:liked_by).selection(:user).selects?(:avatar)` creates messy resolver code

## Solution 2: Lazy Preloading with ar_lazy_preload Gem

- `ar_lazy_preload` gem (built by Evil Martians): makes a single request to fetch all associated objects only after the association is first accessed
- Add `gem "ar_lazy_preload"` to `Gemfile`, then use `.lazy_preload(:author)` in the resolver
- For global activation: `ArLazyPreload.config.auto_preload = true`
- Downsides: adds external dependency; limited control over generated queries; if two paths reference the same table, two requests are made
- Works outside GraphQL too — useful in REST APIs and server-rendered views

## Solution 2-1: Lazy Preload via Field Extensions

- Problem with global `auto_preload`: breaks patterns like adding unsaved records to an association before returning (e.g., appending `Service::DEFAULTS` to `account.services`)
- Also breaks nested mutations that update records with associations
- Solution: use `GraphQL::Schema::FieldExtension` to apply lazy preloading only to list-type fields
- Define `LazyPreloadExtension` that checks if result is `ActiveRecord::Relation`, then calls `.ar_lazy_preload`
- Add extension in `Types::BaseField` constructor for all fields with array return types
- Opt out per field with `preload: false`: `field :services, [Service], preload: false`
- Result: preloading enabled by default for list fields, explicitly disabled where needed

## Solution 3: graphql-ruby Lazy Resolvers

- graphql-ruby's built-in mechanism: return a lazy object from a resolver instead of data
- Execution engine pauses processing of that subtree when it encounters a lazy object
- After all non-lazy values resolve, the engine asks each lazy object to resolve
- Implementation: `Resolvers::LazyUserResolver` stores pending user IDs in query context (`context[:lazy_user_resolver]`)
- `LazyUserResolver#initialize` adds `user_id` to a `Set` in context; `#user` triggers batch load on first access
- Batch load: `User.where(id: user_ids).index_by(&:id)` — single query for all pending IDs
- Register the lazy class in schema: `lazy_resolve(Resolvers::LazyUserResolver, :user)`
- Drawback: significant boilerplate that must be repeated for each association type; complex when lazy resolvers reference other lazy resolvers

## Solution 4.1: graphql-batch (Shopify)

- `graphql-batch` gem uses graphql-ruby's lazy mechanism but hides the boilerplate
- Define loaders by inheriting from `GraphQL::Batch::Loader` and implementing `#perform(ids)`:
  ```ruby
  class RecordLoader < GraphQL::Batch::Loader
    def initialize(model) = @model = model
    def perform(ids)
      @model.where(id: ids).each { |r| fulfill(r.id, r) }
      ids.each { |id| fulfill(id, nil) unless fulfilled?(id) }
    end
  end
  ```
- Usage in type: `RecordLoader.for(::User).load(object.author_id)` returns a Promise
- Enable in schema: `use GraphQL::Batch`
- Supports chained loading: `RecordLoader.for(Product).load(id).then { |p| RecordLoader.for(Image).load(p.image_id) }`
- `graphql-batch` uses `Promise.rb` under the hood — `Promise#sync` registered as the lazy resolver

## Solution 4.2: Dataloader (graphql-ruby 1.12+)

- Built into `graphql-ruby` 1.12 — same approach as `graphql-batch` but uses Ruby fibers instead of Promise.rb
- Fibers are lightweight cooperative concurrency primitives — similar to promises but started explicitly
- Define a source class inheriting `GraphQL::Dataloader::Source` with `#fetch(ids)`:
  ```ruby
  class Sources::ActiveRecord < GraphQL::Dataloader::Source
    def initialize(model_class) = @model_class = model_class
    def fetch(ids)
      records = @model_class.where(id: ids).index_by(&:id)
      records.slice(*ids).values
    end
  end
  ```
- Usage: `dataloader.with(::Sources::ActiveRecord, ::User).load(object.author_id)`
- Enable in schema: `use GraphQL::Dataloader`
- Ruby 3 non-blocking fibers can yield control during blocking operations

## Solution 5: Schema Design to Prevent N+1

- Some N+1 patterns cannot be solved technically and require schema redesign
- Example: fetching a list of users with their followers using cursor pagination creates unavoidable N+1 (one query per user for followers due to cursor)
- Option A: move paginated associations to top-level fields — eliminates server N+1 but creates N+1 HTTP requests from client
- Option B: use Lookahead on the `users` list field to detect `followers` selection and raise `GraphQL::ExecutionError` when multiple users are requested with nested followers
  ```ruby
  def users(lookahead:)
    if lookahead.selects?(:followers)
      raise GraphQL::ExecutionError, "followers can be accessed in singular association only"
    end
    ::User.all
  end
  ```
- Document schema constraints clearly when using this pattern

## Related Evil Martians Tools

- `ar_lazy_preload` gem: lazy preloading for Active Record outside GraphQL too
- `n_plus_one_control` gem: test matchers to detect N+1 in RSpec/Minitest (`squash N+1 queries early`)
- Three-part "GraphQL on Rails" tutorial for beginners: starts with `GraphQL on Rails: From zero to the first query`
- Additional use cases: GraphQL + Active Storage Direct Upload, persisted queries from Apollo, reporting non-nullable violations in `graphql-ruby`
