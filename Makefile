REPOS = rails/rails hotwired/hotwire-native-site hotwired/stimulus-site hotwired/strada-site basecamp/kamal-site rubocop/rails-style-guide rubocop/rspec-style-guide rubocop/ruby-style-guide rubocop/minitest-style-guide rubocop/capybara-style-guide rubocop/packaging-style-guide

.PHONY: help init update fetch pull references clean

all: init references style-guide

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

init: ## Initialize and clone all submodules
	@$(foreach repo,$(REPOS),\
		if [ ! -d ".git-submodules/$(repo)" ]; then \
			git submodule add https://github.com/$(repo) .git-submodules/$(repo); \
		fi;)
	@git submodule update --init

update: ## Update all submodules
	@git submodule update --init --recursive

fetch: ## Fetch updates for all submodules
	@git submodule foreach git fetch --all

pull: ## Pull latest changes for all submodules
	@git submodule update --remote

references: references-clean references-extract

references-extract: ## Copy handbook/reference/overview/docs into references directory
	@mkdir -p references references/rails references/hotwire-native references/stimulus references/strada references/turbo references/kamal
	@cp -R .git-submodules/hotwired/hotwire-native-site/_source/overview    references/hotwire-native/overview
	@cp -R .git-submodules/hotwired/hotwire-native-site/_source/reference   references/hotwire-native/reference
	@cp -R .git-submodules/hotwired/stimulus-site/_source/handbook          references/stimulus/handbook
	@cp -R .git-submodules/hotwired/stimulus-site/_source/reference         references/stimulus/reference
	@cp -R .git-submodules/hotwired/strada-site/_source/handbook            references/strada/handbook
	@cp -R .git-submodules/hotwired/strada-site/_source/reference           references/strada/reference
	@cp -R .git-submodules/hotwired/turbo-site/_source/handbook             references/turbo/handbook
	@cp -R .git-submodules/hotwired/turbo-site/_source/reference            references/turbo/reference
	@cp -R .git-submodules/basecamp/kamal-site/docs                         references/kamal/docs
	@cp -R .git-submodules/rails/rails/guides/source                        references/rails/guides
	@rm -rf .git-submodules/rails/rails/guides/epub
	@find references -name "*.json" -delete
	@find references -name "*.erb" -delete
	@echo "References extracted successfully."

references-clean: ## Clean up references directory
	@find references -name "*.md" -delete
	@find references -name "*.yaml" -delete
	@find references -type d -empty -delete
	@echo "References directory cleaned."

style-guide: style-guide-clean style-guide-extract

style-guide-extract: ## Copy style guides into style-guide directory
	@mkdir -p style-guide
	@cp .git-submodules/rubocop/rails-style-guide/README.adoc        style-guide/rails.adoc
	@cp .git-submodules/rubocop/rspec-style-guide/README.adoc        style-guide/rspec.adoc
	@cp .git-submodules/rubocop/ruby-style-guide/README.adoc         style-guide/ruby.adoc
	@cp .git-submodules/rubocop/minitest-style-guide/README.adoc     style-guide/minitest.adoc
	@cp .git-submodules/rubocop/capybara-style-guide/README.adoc     style-guide/capybara.adoc
	@cp .git-submodules/rubocop/packaging-style-guide/README.adoc    style-guide/packaging.adoc
	@echo "Style guides extracted successfully."

style-guide-clean: ## Clean up style-guide directory
	@find style-guide -name "*.adoc" -delete
	@find style-guide -type d -empty -delete
	@echo "Style directory cleaned."

clean: references-clean style-guide-clean ## Clean up all generated directories
