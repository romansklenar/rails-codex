REPOS = rails/rails hotwired/hotwire-native-site hotwired/stimulus-site hotwired/strada-site basecamp/kamal-site

.PHONY: help init update fetch pull knowledge clean

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

init: ## Initialize and clone all submodules
	@$(foreach repo,$(REPOS),git submodule add https://github.com/$(repo) repos/$(notdir $(repo));)

update: ## Update all submodules
	@git submodule update --init --recursive

fetch: ## Fetch updates for all submodules
	@git submodule foreach git fetch --all

pull: ## Pull latest changes for all submodules
	@git submodule update --remote

knowledge: clean ## Copy handbook/reference/overview docs into knowledge/
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

clean: ## Clean up knowledge directory
	@find knowledge -name "*.md" -delete
	@find knowledge -name "*.yaml" -delete
	@find knowledge -type d -empty -delete
	@echo "Knowledge directory cleaned."
