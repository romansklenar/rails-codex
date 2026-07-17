# Rails Codex

A structured collection of official documentation, handbooks, style guides, references, and curated insights from the [Ruby on Rails](https://github.com/rails), [Hotwire](https://github.com/hotwired), and [Kamal](https://github.com/basecamp/kamal-site) ecosystems — plus community [style guides](https://github.com/rubocop) from RuboCop. All official sources are aggregated as git submodules for local reference. Curated insights from blogs, books, talks, and courses complement the official documentation.

Useful as an input source of knowledge for AI coding agents (e.g. [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Agent OS](https://buildermethods.com/agent-os/concepts)), food for your [Second Brain](https://petermeglis.com/blog/unlock-your-brains-potential-a-beginners-guide-to-obsidian-and-building-a-second-brain/), or just for offline access.

This repository is an **[Open Knowledge Format (OKF)](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md) v0.1 bundle** rooted at [`/index.md`](index.md) (which declares `okf_version`): a tree of Markdown files with YAML frontmatter, one concept per file (`type: insight`), cross-linked and enumerated by `index.md` files — designed to be read by both humans and LLM/agent consumers. The curated insight concepts live under [`insights/`](insights/); the `references/` and `style-guide/` trees are mechanically extracted upstream docs and sit outside the bundle's concept tree. Start at [`/index.md`](index.md) → a category/collection `index.md` → the individual insight files.

## Why?
- **Comprehensive**: Combines official documentation, handbooks, style guides, and curated insights in one place.
- **Structured**: Clear separation between official references and manually curated insights.
- **Updatable**: Git submodules allow for easy updates from official sources while maintaining attribution.
- **Agent-Friendly**: Organized structure and unified index make it easy for AI agents to consume and reference knowledge.

## Structure

```
├── .git-submodules/              # Upstream git submodules (auto-managed, not materialized in sparse checkout)
│
├── index.md                      # OKF bundle root (declares okf_version) — start here
├── log.md                        # OKF bundle-level change history
│
├── insights/                     # OKF bundle — curated knowledge, one concept per file
│   ├── _template.md              #   canonical OKF frontmatter for a new insight
│   ├── blogs/                    #   37signals (manifesto, Dev Blog), Evil Martians Chronicles
│   ├── podcasts/                 #   37signals REWORK & RECORDABLES, On Rails
│   └── rails/                    #   Rails release highlights (8.0, 8.1, 8.2) from official notes
│                                 #   (each collection carries its own index.md + log.md)
│
├── references/                   # Official docs (auto-extracted from .git-submodules/)
│   ├── hotwire-native/
│   │   ├── overview/             #   How it works, navigation, path config, bridge components, native screens
│   │   └── reference/            #   Bridge installation, navigation, path config, bridge components
│   ├── kamal/                    #   Official Kamal documentation (deployment, configuration, CLI reference, etc.)
│   ├── rails/
│   │   └── guides/               #   Official Rails guides (models, views, controllers, configuration, testing, etc.)
│   ├── stimulus/
│   │   ├── handbook/             #   Origin, introduction, hello stimulus, building, resilience, state, external resources, installing
│   │   └── reference/            #   Actions, controllers, CSS classes, lifecycle, outlets, targets, TypeScript, values
│   ├── strada/
│   │   ├── handbook/             #   Introduction, how it works, web, iOS, Android, installing
│   │   └── reference/            #   Attributes, components, elements
│   └── turbo/
│       ├── handbook/             #   Introduction, drive, page refreshes, frames, streams, native, building, installing
│       └── reference/            #   Attributes, drive, events, frames, streams
│
├── style-guide/                  # Community conventions (auto-extracted)
├── Makefile
└── README.md
```

### Submodules

Stored as git submodules under `.git-submodules/` to keep the official source repositories separate from the extracted references and insights. Each submodule points to an official upstream repository, allowing for easy updates and attribution.

| Submodule                | Source |
|--------------------------|---|
| `rails`                  | [rails/rails](https://github.com/rails/rails) |
| `hotwire-native-site`    | [hotwired/hotwire-native-site](https://github.com/hotwired/hotwire-native-site) |
| `stimulus-site`          | [hotwired/stimulus-site](https://github.com/hotwired/stimulus-site) |
| `turbo-site`             | [hotwired/turbo-site](https://github.com/hotwired/turbo-site) |
| `strada-site`            | [hotwired/strada-site](https://github.com/hotwired/strada-site) |
| `kamal-site`             | [basecamp/kamal-site](https://github.com/basecamp/kamal-site) |
| `ruby-style-guide`       | [rubocop/ruby-style-guide](https://github.com/rubocop/ruby-style-guide) |
| `rails-style-guide`      | [rubocop/rails-style-guide](https://github.com/rubocop/rails-style-guide) |
| `rspec-style-guide`      | [rubocop/rspec-style-guide](https://github.com/rubocop/rspec-style-guide) |
| `minitest-style-guide`   | [rubocop/minitest-style-guide](https://github.com/rubocop/minitest-style-guide) |
| `capybara-style-guide`   | [rubocop/capybara-style-guide](https://github.com/rubocop/capybara-style-guide) |
| `packaging-style-guide`  | [rubocop/packaging-style-guide](https://github.com/rubocop/packaging-style-guide) |

### References

Running `make references` extracts handbook, reference, and overview documentation from each submodule into the `references/` directory and generates a navigation index at [`references/index.md`](references/index.md) (via `bin/generate_indexes.rb`; run `make references-index` to regenerate it alone). These files are extracted upstream docs, not OKF concepts.

### Insights (OKF bundle)

The `insights/` directory holds the **[OKF](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md) v0.1 bundle's** insight concepts — curated knowledge distilled from blogs, podcasts, and official release notes (the bundle root is the repository's [`/index.md`](index.md)). Unlike `references/`, this content is manually authored and committed directly.

**Insight file format (OKF-conformant).** Every insight file is one OKF **concept**: parseable YAML frontmatter with a non-empty `type`, followed by a dense Markdown body. Copy [`insights/_template.md`](insights/_template.md) to start a new one.

```yaml
---
type: insight                       # OKF required — the concept type
title: "..."                        # OKF recommended — display name (equals the H1)
description: "..."                  # OKF recommended — one-sentence summary
resource: "https://..."             # OKF recommended — URI of the underlying asset (the source)
tags: [rails, hotwire]              # OKF recommended — cross-cutting categorization
timestamp: "2026-07-17"             # OKF recommended — ISO 8601 date of last meaningful change
source:                             # OKF extension (producer-defined) — provenance
  type: blog                        # blog | book | talk | podcast | course | guide
  title: "..."
  author: "..."
  url: "https://..."
  date: "2025-06-01"                # publication date (distinct from OKF timestamp)
---
```

Body conventions (house style): **H1** equal to `title`, immediately followed by the `description` sentence; **H2** sections of **dense bullet points** (no prose paragraphs); comparison tables for trade-offs; short language-tagged fenced code for essential examples. Content faithfully mirrors the source.

**Cross-links.** Concepts link to one another with **standard Markdown relative links** — `[text](other-file.md)` or `[text](../other-collection/file.md)` — which OKF reads as an (untyped) relationship whose meaning comes from the surrounding prose (OKF §5). Plain Markdown links render on GitHub and in Obsidian alike.

**`index.md` and `log.md` (OKF §6–7).** The bundle root [`/index.md`](index.md) declares `okf_version: "0.1"` (the only place frontmatter is allowed in an index) and links the top categories. Each category and collection directory has an `index.md` (no frontmatter) listing its concepts as `* [Title](file.md) - description`. A `log.md` (bundle root + per collection) records change history, newest first, with `# YYYY-MM-DD` headings — populated from git history. Index and log files are generated from the insight files + git history with maintenance scripts rather than edited by hand.

Before adding book insights (public repo), check the publisher's Terms of Service.

### Style Guides

Running `make style-guide` extracts community style guides from RuboCop into the `style-guide/` directory and generates a navigation index at [`style-guide/index.md`](style-guide/index.md) (run `make style-guide-index` to regenerate it alone).

## Setup

```bash
git clone <this-repo>
make # Initialize and fetch all submodules, then extract references and style guides
```

## Usage

```bash
make help                # Show all available commands
make fetch               # Fetch updates for all submodules
make pull                # Pull latest changes for all submodules
make references          # Copy documentation from submodules into references/
make style-guide         # Copy style guides from submodules into style-guide/
make clean               # Remove extracted references/ and style-guide/ directories
```

## Using as a Submodule (Sparse Checkout)

If you want to include this repository as a submodule in your own project **without** recursively cloning all the source repos in `.git-submodules/`, use a sparse checkout to include only the extracted `references/`, `insights/`, and `style-guide/` directories.

### Add the submodule

```bash
git submodule add https://github.com/romansklenar/rails-codex <path>
```

By default, `git submodule add` does **not** recursively initialize nested submodules, so the repos inside `.git-submodules/` won't be cloned. Just make sure you never run `git submodule update --init --recursive` on this submodule — use the non-recursive form instead:

```bash
# Suggestion: use .git-submodules as path and then symlink directories where needed
git submodule update --init <path>
```

### Enable sparse checkout

To skip checking out the `.git-submodules/` directory entirely (saving disk space and avoiding empty submodule directories):

```bash
cd <path>
git sparse-checkout init --cone
git sparse-checkout set references insights style-guide
```

This tells git to only materialize the `references/`, `insights/`, and `style-guide/` directories (plus root files like `README.md`, `index.md`, and `log.md`). The `.git-submodules/` directory won't appear in your working tree at all.

### Update the submodule later

```bash
git submodule update --remote <path>
```
