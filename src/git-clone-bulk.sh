#!/bin/sh
# description: clone a set of git repos to current directory - use sh substitution (rep{1,2,3}) for repos that share hosts
# ARGUMENTS: git-clone-bulk repo1 repo2 repo3 ...
# DEPENDENCIES: git

for repo in $@; do git clone $repo; done
