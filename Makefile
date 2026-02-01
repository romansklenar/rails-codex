REPOS = rails/rails hotwired/hotwire-native-site hotwired/stimulus-site hotwired/strada-site basecamp/kamal-site rubocop/rails-style-guide rubocop/rspec-style-guide rubocop/ruby-style-guide rubocop/minitest-style-guide rubocop/capybara-style-guide rubocop/packaging-style-guide

.PHONY: help init update fetch pull knowledge clean

all: init knowledge-extract style-guide-extract

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

init: ## Initialize and clone all submodules
	@$(foreach repo,$(REPOS),git submodule add --force https://github.com/$(repo) repos/$(notdir $(repo));)

update: ## Update all submodules
	@git submodule update --init --recursive

fetch: ## Fetch updates for all submodules
	@git submodule foreach git fetch --all

pull: ## Pull latest changes for all submodules
	@git submodule update --remote

knowledge: knowledge-clean knowledge-extract

knowledge-extract: ## Copy handbook/reference/overview/docs into knowledge directory
	@mkdir -p knowledge knowledge/rails knowledge/hotwire-native knowledge/stimulus knowledge/strada knowledge/turbo knowledge/kamal
	@cp -R repos/hotwire-native-site/_source/overview    knowledge/hotwire-native/overview
	@cp -R repos/hotwire-native-site/_source/reference   knowledge/hotwire-native/reference
	@cp -R repos/stimulus-site/_source/handbook          knowledge/stimulus/handbook
	@cp -R repos/stimulus-site/_source/reference         knowledge/stimulus/reference
	@cp -R repos/strada-site/_source/handbook            knowledge/strada/handbook
	@cp -R repos/strada-site/_source/reference           knowledge/strada/reference
	@cp -R repos/turbo-site/_source/handbook             knowledge/turbo/handbook
	@cp -R repos/turbo-site/_source/reference            knowledge/turbo/reference
	@cp -R repos/kamal-site/docs                         knowledge/kamal/docs
	@cp -R repos/rails/guides/source                     knowledge/rails/guides
	@rm -rf repos/rails/guides/epub
	@find knowledge -name "*.json" -delete
	@find knowledge -name "*.erb" -delete
	@echo "Knowledge extracted successfully."

knowledge-clean: ## Clean up knowledge directory
	@find knowledge -name "*.md" -delete
	@find knowledge -name "*.yaml" -delete
	@find knowledge -type d -empty -delete
	@echo "Knowledge directory cleaned."

style-guide: style-guide-clean style-guide-extract

style-guide-extract: ## Copy style guides into style-guide directory
	@mkdir -p style-guide
	@cp repos/rails-style-guide/README.adoc        style-guide/rails.adoc
	@cp repos/rspec-style-guide/README.adoc        style-guide/rspec.adoc
	@cp repos/ruby-style-guide/README.adoc         style-guide/ruby.adoc
	@cp repos/minitest-style-guide/README.adoc     style-guide/minitest.adoc
	@cp repos/capybara-style-guide/README.adoc     style-guide/capybara.adoc
	@cp repos/packaging-style-guide/README.adoc    style-guide/packaging.adoc
	@echo "Style guides extracted successfully."

style-guide-clean: ## Clean up style-guide directory
	@find style-guide -name "*.adoc" -delete
	@find style-guide -type d -empty -delete
	@echo "Style directory cleaned."

clean: knowledge-clean style-guide-clean ## Clean up all generated directories
