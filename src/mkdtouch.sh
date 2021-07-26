#!/bin/sh
# description: mkdir $1; touch ${2, ...}
# arguments: $1 = dir path to make; $2, ... = filenames to touch

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: mkdtouch DIRECTORY FILEPATH..."
	echo ""
	echo "mkdir DIRECTORY and touch listed FILEPATH... into it"
	exit
fi

mkdir $1
shift
touch $@

