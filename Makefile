#.DEFAULT_GOAL := all
name := "go-base"

all: test finish

# This target (taken from: https://gist.github.com/prwhite/8168133) is an easy way to print out a usage/ help of all make targets.
# For all make targets the text after \#\# will be printed.
help: ## Prints the help
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\1\:\2/' | column -c2 -t -s :)"


test: sep ## Runs all unittests and generates a coverage report.
	@echo "--> Run the unit-tests"
	@go test ./buildinfo ./logging -covermode=count -coverprofile=coverage.out

sep:
	@echo "----------------------------------------------------------------------------------"

finish:
	@echo "=================================================================================="