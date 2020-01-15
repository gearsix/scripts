#!/bin/bash
# xopen = xdg-open FILE
# description: open file in xserver (doesn't support multiple files at once yet)
# ARGUMENTS: -q, --quiet       send stdout to /dev/null

# variables
quiet=0
args=()

# parse args
while [[ $# -gt 0 ]]; do
	case $1 in
		-q|--quiet)
			quiet=1
			shift
			;;
	esac
done

# main
args=( "$@" )
if [[ $quiet -eq 0 ]]; then
	xdg-open $args
else
	xdg-open $args &>/dev/null
fi
