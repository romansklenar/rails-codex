REPOS = rails/rails hotwired/hotwire-native-site hotwired/stimulus-site hotwired/turbo-site hotwired/strada-site hotwired/hotwire-site

.PHONY: help init update fetch pull resources

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'

init: ## Initialize and clone all submodules
	@$(foreach repo,$(REPOS),git submodule add https://github.com/$(repo);)

update: ## Update all submodules
	@git submodule update --init --recursive

fetch: ## Fetch updates for all submodules
	@git submodule foreach git fetch --all

pull: ## Pull latest changes for all submodules
	@git submodule update --remote

resources: ## Copy handbook/reference/overview docs into resources/
	@rm -rf resources
	@mkdir -p resources resources/rails resources/hotwire-native resources/stimulus resources/strada resources/turbo
	@cp -R hotwire-native-site/_source/overview    resources/hotwire-native/overview
	@cp -R hotwire-native-site/_source/reference   resources/hotwire-native/reference
	@cp -R stimulus-site/_source/handbook          resources/stimulus/handbook
	@cp -R stimulus-site/_source/reference         resources/stimulus/reference
	@cp -R strada-site/_source/handbook            resources/strada/handbook
	@cp -R strada-site/_source/reference           resources/strada/reference
	@cp -R turbo-site/_source/handbook             resources/turbo/handbook
	@cp -R turbo-site/_source/reference            resources/turbo/reference
	@cp -R rails/guides/source                     resources/rails/guides
	@rm -rf rails/guides/epub
	@find resources -name "*.json" -delete
	@find resources -name "*.erb" -delete
	@echo "Resources copied successfully."
