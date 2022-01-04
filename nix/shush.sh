#!/bin/sh
# shh = quiet for commands that don't include it
# description: run a terminal command ($@) and send stdout to /dev/null
# e.g.$ shush chromium &

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: shush ARGS"
	echo ""
	echo "run all commands in ARGS but send stdout to /dev/null, for when a tool is too noisy"
	exit
fi

for bin in $@; do
    $bin &>/dev/null
done;

