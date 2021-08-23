#!/bin/sh
# xopen = xdg-open FILE
# description: open file in xserver (doesn't support multiple files at once yet)
# ARGUMENTS: -q, --quiet       send stdout to /dev/null

if [ -z $1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: xopen [OPTIONS] {FILE|URL}..."
	echo ""
	echo "Call 'xdg-open' on all listed {FILE|URL}, see 'xdg --help' for more details."
	echo ""
	echo "OPTIONS (must be provided before {FILE|URL})"
	echo "  -q, --quiet     send stdout to /dev/null because a lot of tools print too much."
	exit
fi

if [ "$1" = "-q" ] || [ "$1" = "--quiet" ]; then
	shift
	xdg-open $@ &>/dev/null
else
	xdg-open $@
fi
