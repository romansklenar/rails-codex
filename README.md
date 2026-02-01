# Rails Codex

A structured collection of official documentation, handbooks, style guides, and references from the [Ruby on Rails](https://github.com/rails), [Hotwire](https://github.com/hotwired), and [Kamal](https://github.com/basecamp/kamal-site) ecosystems — plus community [style guides](https://github.com/rubocop) from RuboCop. All sources are aggregated as git submodules for local reference.

Useful as an input source of knowledge for AI coding agents (e.g. [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Agent OS](https://buildermethods.com/agent-os/concepts)) or just for offline access.

## Submodules

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

## Setup

```bash
git clone <this-repo>
make init      # Add all repos as git submodules
make update    # Initialize and checkout submodules
```

## Usage

```bash
make help                # Show all available commands
make fetch               # Fetch updates for all submodules
make pull                # Pull latest changes for all submodules
make knowledge           # Copy documentation from submodules into knowledge/
make style-guide         # Copy style guides from submodules into style-guide/
```

## Using as a Submodule (Sparse Checkout)

If you want to include this repository as a submodule in your own project **without** recursively cloning all the source repos in `repos/`, use a sparse checkout to include only the extracted `knowledge/` and `style-guide/` directories.

### Add the submodule

```bash
git submodule add https://github.com/romansklenar/rails-codex <path>
```

By default, `git submodule add` does **not** recursively initialize nested submodules, so the repos inside `repos/` won't be cloned. Just make sure you never run `git submodule update --init --recursive` on this submodule — use the non-recursive form instead:

```bash
# Suggestion: use .git-submodules as path and then symlink directories where needed
git submodule update --init <path>
```

### Enable sparse checkout

To skip checking out the `repos/` directory entirely (saving disk space and avoiding empty submodule directories):

```bash
cd <path>
git sparse-checkout init --cone
git sparse-checkout set knowledge style-guide
```

This tells git to only materialize the `knowledge/` and `style-guide/` directories (plus root files like `README.md` and `Makefile`). The `repos/` directory won't appear in your working tree at all.

### Update the submodule later

```bash
git submodule update --remote <path>
```

## Knowledge Base

Running `make knowledge` extracts handbook, reference, and overview documentation from each submodule into the `knowledge/` directory:

```
knowledge/
  hotwire-native/
    overview/       # How it works, navigation, path config, bridge components, native screens
    reference/      # Bridge installation, navigation, path config, bridge components
  stimulus/
    handbook/       # Origin, introduction, hello stimulus, building, resilience, state, external knowledge, installing
    reference/      # Actions, controllers, CSS classes, lifecycle, outlets, targets, TypeScript, values
  strada/
    handbook/       # Introduction, how it works, web, iOS, Android, installing
    reference/      # Attributes, components, elements
  turbo/
    handbook/       # Introduction, drive, page refreshes, frames, streams, native, building, installing
    reference/      # Attributes, drive, events, frames, streams
  kamal/
    docs/           # Kamal deployment commands, configuration, hooks, upgrading
  rails/
    guides/         # Official Rails guides (models, views, controllers, configuration, testing, etc.)
```

## Style Guides

Running `make style-guide` extracts community style guides from RuboCop into the `style-guide/` directory:

```
style-guide/
  ruby.adoc         # Ruby coding conventions
  rails.adoc        # Rails-specific conventions
  rspec.adoc        # RSpec testing conventions
  minitest.adoc     # Minitest testing conventions
  capybara.adoc     # Capybara integration testing conventions
  packaging.adoc    # Gem packaging conventions
```
