#!/usr/bin/env bash
# src: https://gist.github.com/grimzy/a1d3aae40412634df29cf86bb74a6f72
# description: pull all remote branches to the local repo


if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: git-pull-all"
	echo ""
	echo "pull all remote branches of repo in callers working directory to local"
	exit
fi

git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
git fetch --all
git pull --all

