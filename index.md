---
okf_version: "0.1"
---

# rails-codex

> An [Open Knowledge Format (OKF)](https://github.com/GoogleCloudPlatform/knowledge-catalog/blob/main/okf/SPEC.md) bundle of curated Rails, Ruby, and product-engineering insights — dense, one-concept-per-file Markdown notes (`type: insight`) distilled from blogs, podcasts, and official release notes.

The OKF bundle covers `insights/`. The `references/` and `style-guide/` directories hold documentation mechanically extracted from upstream git submodules (Rails guides, Hotwire, Kamal, RuboCop); they are not OKF concepts but have their own navigation indexes (see below). See `README.md` for the format, conventions, and how the bundle is maintained.

## Contents

* [Blogs](insights/blogs/index.md) - Curated insights distilled from engineering blog posts. (92 files)
* [Podcasts](insights/podcasts/index.md) - Curated insights from podcast and video episodes. (33 files)
* [Rails Release Highlights](insights/rails/index.md) - Curated highlights of recent Rails releases, distilled from the official release notes. (3 files)

## Reference material (outside the OKF bundle)

* [References](references/index.md) - Rails guides, Hotwire (Native/Stimulus/Strada/Turbo), and Kamal docs extracted from upstream submodules.
* [Style Guides](style-guide/index.md) - RuboCop community style guides (Ruby, Rails, RSpec, Minitest, Capybara, packaging).
