---
title: "Exploring Active Agent: Can We Build AI Features the Rails Way?"
description: "Active Agent brings Rails conventions to LLM-backed logic via agent classes, Action View prompt templates, tool/function calling, and callback hooks — mirroring the controller/mailer pattern for AI generations"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Evil Martians"
  url: "https://evilmartians.com/chronicles/exploring-active-agent-or-can-we-build-ai-features-the-rails-way"
  date: '2025-09-10'
tags: [rails, ai, llm, active-agent, agents, ruby, tool-calling, prompt-templates]
---

# Exploring Active Agent: Can We Build AI Features the Rails Way?

`activeagent` gem brings the Rails abstraction stack to AI-backed logic — agents are to LLM generations what controllers are to HTTP requests and mailers are to email — with Action View prompt templates, tool/function calling, and familiar callback hooks.

## The Gap in the Rails Abstraction Stack

- Rails provides abstractions for HTTP (controllers), email (mailers), jobs (ActiveJob), and data (ActiveRecord)
- AI features have no Rails-native abstraction — developers inline LLM calls in controllers or service objects
- Common problems: prompt management scattered in code, no standard for tool/function calling, no built-in callbacks
- `activeagent` fills this gap: Agent Oriented Programming for Rails, where Agents are to LLMs what Controllers are to HTTP
- Evil Martians became an early adopter — experimented with `activeagent` for real conference tooling at SF Ruby

## Agent Class Anatomy

- Agents inherit from `ApplicationAgent < ActiveAgent::Base`
- Define action methods analogous to controller actions or mailer methods:
  ```ruby
  class JokerAgent < ApplicationAgent
    def dad_joke(topic = "beer")
      prompt(body: "Generate a dad joke for the topic: #{topic}")
    end
  end
  ```
- `prompt` method triggers the LLM generation with the given instructions
- Agents can also render prompt templates from Action View: `prompt` renders `app/views/joker_agent/dad_joke.text.erb`
- Generation result accessible via `generation.content` after calling the agent action

## Prompt Templates with Action View

- Prompts live in `app/views/<agent_name>/<action_name>.text.erb` — same convention as mailer views
- Action View helpers available in templates: `link_to`, `number_to_currency`, custom helpers
- Separate template files mean prompts can be improved without touching agent class code
- Supports partials and layouts for shared prompt fragments: `render partial: 'shared/guardrails'`
- Multi-part prompts: system message in one template, user message in another — composed at render time
- Variables passed from the agent action are available in the template via instance variables

## Tool/Function Calling

- Agents can expose tools (functions) that the LLM can invoke during generation
- Define tools as methods with schema annotations:
  ```ruby
  def search_talks(query:)
    Talk.where("title ILIKE ?", "%#{query}%").pluck(:title, :year)
  end
  tool :search_talks, description: "Search the database of Ruby conference talks"
  ```
- `activeagent` serializes tool definitions into the LLM's function-calling schema automatically
- When the LLM requests a tool call, `activeagent` invokes the Ruby method and sends results back
- Agentic loop: generation → tool call → result → generation continues until LLM stops
- `SolidAgent` gem extends this with database-backed tool schemas and enterprise persistence

## Real-World Example: SF Ruby ReviewAgent

- Evil Martians built a `ReviewAgent` for scoring conference talk proposals at SF Ruby
- Three scoring criteria: novelty, relevance, and quality — each evaluated separately
- Agent equipped with `search_talks` tool to query existing Ruby talk database for novelty assessment
- System prompt: comprehensive instructions with guardrails, scoring rubric, output format specification
- Prompt template approach: `app/views/review_agent/score_proposal.text.erb` with ERB-interpolated criteria
- Result: structured JSON output with numeric scores and reasoning per criterion

## Generation Modes

- Synchronous: `JokerAgent.dad_joke("coffee").generate_now` — blocks until LLM responds; returns generation
- Asynchronous: `JokerAgent.dad_joke("coffee").generate_later` — enqueues an ActiveJob for background execution
- Streaming: `JokerAgent.dad_joke("coffee").generate_stream` — yields chunks via callback as they arrive
- Callback hooks: `before_generate`, `after_generate`, `on_error` — standard ActiveSupport::Callbacks interface
- `generate_later` integrates with any ActiveJob backend: Sidekiq, GoodJob, Solid Queue
- Streaming + AnyCable: broadcast chunks from `after_chunk` callback for real-time UX

## LLM Provider Configuration

- `activeagent` uses an adapter pattern — supports OpenAI, Anthropic, and others
- Configure default provider in `config/application.rb`:
  ```ruby
  config.active_agent.provider = :openai
  config.active_agent.model = "gpt-4o"
  ```
- Per-agent override: `self.provider = :anthropic; self.model = "claude-opus-4-6"`
- API keys loaded from environment via Rails credentials or `anyway_config`
- `SolidAgent` adds database persistence of prompt context and generation response records

## Testing Agents

- `ActiveAgent::TestHelper` provides matchers analogous to `ActionMailer::TestHelper`
- Assert that a generation was enqueued: `assert_agent_generation_enqueued(JokerAgent, :dad_joke)`
- Stub LLM responses in tests: `stub_generation(JokerAgent, :dad_joke, content: "Why did the coffee file a complaint?")`
- Tool calls testable in isolation: test the Ruby method independently from the LLM invocation
- Integration tests: use VCR-style cassettes or `webmock` to record and replay LLM API calls
- Keep prompt templates under test by asserting rendered output against fixture inputs

## Rails Way Alignment

- File layout mirrors controllers and mailers: `app/agents/`, `app/views/<agent_name>/`
- Generator: `rails generate agent Joker dad_joke` creates agent class and prompt template
- `ApplicationAgent` base class for shared configuration — same pattern as `ApplicationController`
- Callbacks, concerns, and helpers all work: `include AgentConcerns::RateLimiting`
- Routing not needed — agents are invoked programmatically, not via HTTP
- Philosophy: developers familiar with Rails controllers learn agents in minutes
