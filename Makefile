# first try
.PHONY: help test test-2 all

help: ## Show this help.
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

test: ## testing the start
		@echo "start"

test2: ## testing the end
		@echo "end"

all: ## run it all
all: test test2