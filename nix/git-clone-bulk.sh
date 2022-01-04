#!/bin/sh
# description: clone a set of git repos to current directory - use sh substitution (rep{1,2,3}) for repos that share hosts
# ARGUMENTS: git-clone-bulk repo1 repo2 repo3 ...
# DEPENDENCIES: git

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: git-clone-bulk REPO..."
	echo ""
	echo "'git clone' multiple repos in one call. REPO should be a list of git repositories to clone"
	echo "bash expansion is useful here: 'git-clone-bulk github.com/user/{repo1,repo2}"
	exit
fi

for repo in $@; do git clone $repo; done
