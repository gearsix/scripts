#!/bin/sh
# description: clone a set of git repos to current directory
# ARGUMENTS: git-clone-bulk repo1 repo2 repo3 ...

for repo in $@; do git clone $repo; done
