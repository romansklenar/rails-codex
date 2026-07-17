---
type: insight
title: "2 Martians, Greenfield to MVP in 4 Weeks: Agentic Coding on Rails"
description: "A two-person designer + engineer team shipped a production MVP in 4 weeks using Rails + Inertia + React in a single repo with Storybook as the design environment, treating Rails conventions as architectural guardrails and open-source skills as project-specific constraints for AI agents"
resource: "https://evilmartians.com/chronicles/2-martians-greenfield-to-mvp-in-4-weeks-agentic-coding-on-rails"
tags: [rails, inertia, react, agentic-coding, ai-assisted-development, claude-code, storybook, skills, greenfield, mvp, stripe-connect, layered-design]
timestamp: "2026-07-17"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Gleb Stroganov"
  url: "https://evilmartians.com/chronicles/2-martians-greenfield-to-mvp-in-4-weeks-agentic-coding-on-rails"
  date: '2026-06-09'
---

# 2 Martians, Greenfield to MVP in 4 Weeks: Agentic Coding on Rails

A designer and a backend engineer shipped a full production MVP in four weeks on Rails + Inertia + React in a single repo, using Rails conventions and open-source "skills" as the architectural constraints that make agentic AI coding reliable.

## The Project

- **Thicket** — educational platform where PhD-level experts run live classes (literature, history, art) for curious learners
- **Team of two Martians**: one designer (Gleb Stroganov), one backend engineer (Svyatoslav Kryukov)
- Founder Nick Constantino supplied vision and mockups; goal was a real teacher using a *working platform* within days, not weeks
- Skipped prototypes and Figma walkthroughs — week one ended with a real teacher on a working product for fast user validation
- A Stanford professor called it the best teacher experience she'd seen on the market

## Full Feature Surface Shipped

- Authentication and onboarding flows
- Stripe Connect payments for teacher payouts
- Live video classes via **Whereby**
- Course builder
- Dedicated teacher and student experiences
- Teacher application portal with admin review
- Blog
- Admin panel

## Phase One: Speed to Signal with Bolt.new

- Designer started in **Bolt.new**, designing directly in React instead of drawing screens in Figma
- Workflow: prompt → watch Bolt generate a working browser interface → refine in real time
- The mockup *was* a running app, so a real user was interacting with the product by end of week one
- Great for turning an idea into a live prototype fast; strong early user quotes ("really intuitive", "simple, in the best way")
- **Cost**: the POC was greenfield and design-first, with no awareness of production Rails architecture, real data flows, or Inertia conventions — so every frontend iteration created extra translation/refactoring work

## Phase Two: Inertia and Speeding to Production

- Fix for the porting overhead: put the designer *inside the same system* as the engineer — one shared Rails + Inertia + React codebase with the same patterns, constraints, and conventions
- Adopting **Claude Code** removed the back-and-forth porting layer between designer and engineer
- Project-specific skills were built as newer models arrived (e.g. handling N+1 queries with the `ar_lazy_loading` gem instead of chasing micro-optimizations)
- Manual intervention eventually dropped to almost zero — smooth collaborative work

## The Agentic Stack: Rails + Inertia + React + Storybook

- **Rails** — conventions give AI tools a structured, opinionated surface (how models relate, how controllers behave); predictability makes AI-generated code more reliable
- **React** — the lingua franca for AI coding tools
- **Inertia** — lets you go full React *without an API layer*, staying close to the Rails monolith while giving the designer and AI a React surface to work on
- **Storybook** — the design environment; designer visualizes components exactly and builds flows exactly as users will move through them
- **Single repo** — designer ships the code the engineer starts from; engineer polishes by fixing non-canonical AI decisions, adding abstractions, making it maintainable
- **Why not Figma**: Figma blurs design intent vs. production reality, forcing engineers to re-interpret and re-implement; shipping real code eliminates that gap — the key enabler for a two-person team

## AI Needs a Prompter, Not Just a Prompt

- A **fresh Rails project is where agentic coding works best** — mature conventions mean the AI follows them reliably and you can go far without manual steering
- AI is like a junior developer without years-earned pattern recognition: it sprints confidently in one direction but won't notice when the architecture needs to pivot
- Rails absorbs most of the drift that plagues greenfield projects on less opinionated stacks
- **Where you take the wheel is at the frontier**: AI reaches for outdated Inertia idioms because that's what its training data contains
- This project was building *on top of* current Inertia — `alba-inertia`, improvements to `typelizer`, an Inertia Puma plugin, Inertia infinite scroll — none of which existed in the AI's training data

## The Birth of a Skill: The Filter Abstraction Story

- **Skills encode architectural decisions** so the AI applies them consistently everywhere, every time; the human still holds the vision, the skill makes it executable at speed
- Open-source output from Thicket (reusable for any greenfield project): **layered Rails skills** and **Inertia Rails skills** — every project makes the harness smarter
- **The bug**: multiple UI list views needed sorting/filtering; original pattern assumed sortable columns mapped one-to-one to DB columns. AI duplicated this controller pattern successfully (duplication is fine pre-launch):
  ```ruby
  def index
    @filters = {states: params.dig(:filters, :states).to_a}
    @sort_field = params[:sort_field] || "title"
    @sort_direction = params[:sort_direction] == "desc" ? "desc" : "asc"
    courses_scope = Current.user.enrolled_courses
    courses_scope.order!(@sort_field => @sort_direction, id: :asc)
    courses_scope.where!(state: @filters[:states]) if @filters[:states].present?
    @pagy, @courses = pagy(courses_scope)
  end
  ```
- Bug emerged when a new sortable field was added on the frontend but not reflected on the backend — needed sorting via an **associated (joined) table**, which the existing pattern couldn't handle
- Patching alone wouldn't fix it: a human had to recognize the pattern and introduce the right abstraction to prevent recurrence *and gate AI generation*
- **Vladimir Dementyev** (backend principal, author of *[Layered Design for Ruby on Rails Applications](it-deserved-its-own-tome-layered-design-and-the-extended-rails-way.md)*) added a `Filter` concept: a type-safe abstraction syncing backend and frontend in one pattern, keeping controllers slim:
  ```ruby
  def index
    @courses, @current_filter = filtery(
      Current.user.courses.not_removed
    )
    @pagy, @courses = pagy(@courses)
  end
  ```
- Explicit filtering schema lives in dedicated classes:
  ```ruby
  class Dashboard::CoursesFilter < ::CoursesFilter
    sortable_by :title, :completed_lessons_count, default: "title" do
      having "enrolled_at" do |sort_direction: "asc"|
        raw.order(enrollments: {purchased_at: sort_direction}).order(id: :asc)
      end
    end
  end
  ```
- After the skill existed, the AI consistently applied it everywhere relevant

## Where We Are and What We Learned

- **The effort ratio flipped** over four weeks: early phase was manual porting and reactive skill-writing; by the end the engineer wasn't writing code by hand but **orchestrating** — reviewing, directing, encoding decisions, asking AI to fix things
- Starting fresh runs smoother with established patterns and skills from day one — the AI works *with* you, not against you, and you move fast without backtracking
- **Ideal next-time setup**: from the first Rails commit, have the layered Rails skills, Inertia Rails skills, and a design system skill in place *before* the first feature is scaffolded
- The designer then **modifies a real, already-configured design system** — tweaking what's there rather than conjuring UI from scratch — improving code consistency, UX coherence, and reducing how much the AI must get right on the first try

## Reusable Lessons: Agentic Coding on Rails

- **Agentic coding lives on constrained generation** — the quality of the constraints determines the quality of the output
- **Rails gives architectural constraints by default**; skills encode the project-specific decisions layered on top
- **A senior engineer realizes the vision and catches what the AI misses**
- With those three in place, two people can ship a production platform in weeks, not months
