# Rails Knowledge Base

A structured collection of knowledge of official documentation, handbooks and references from [Ruby on Rails](https://github.com/rails) and [Hotwire](https://github.com/hotwired) ecosystem, aggregated as git submodules for local reference.

## Repositories

| Submodule | Source |
|---|---|
| `rails`               | [rails/rails](https://github.com/rails/rails) |
| `hotwire-native-site` | [hotwired/hotwire-native-site](https://github.com/hotwired/hotwire-native-site) |
| `stimulus-site`       | [hotwired/stimulus-site](https://github.com/hotwired/stimulus-site) |
| `turbo-site`          | [hotwired/turbo-site](https://github.com/hotwired/turbo-site) |
| `strada-site`         | [hotwired/strada-site](https://github.com/hotwired/strada-site) |
| `hotwire-site`        | [hotwired/hotwire-site](https://github.com/hotwired/hotwire-site) |

## Setup

```bash
git clone <this-repo>
make init      # Add all repos as git submodules
make update    # Initialize and checkout submodules
```

## Usage

```bash
make help       # Show all available commands
make fetch      # Fetch updates for all submodules
make pull       # Pull latest changes for all submodules
make knowledge  # Copy documentation from submodules into `knowledge/`
```

## Generating Knowledge Base

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
  rails/
    guides/         # Official Rails guides (models, views, controllers, configuration, testing, etc.)
```

An `index.yml` file in `knowledge/` provides a searchable index of all 100 documentation files with short descriptions.
