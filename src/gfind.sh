#!/bin/sh
# gfind (grep find)
# description: find files containing string $2 in directory/file $1
# dependencies: grep
# e.g.$ gfind dogs/ "shades"

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: gfind [OPTIONS] DIRECTORY EXPRESSION"
	echo ""
	echo "call grep EXPRESSION on all files in DIRECTORY"
	echo ""
	echo "OPTIONS"
	echo "  -r      recursively search DIRECTORY"
	exit
fi

ARGS="-nw" # print line #, match whole word
if [ "$1" == "-r" ]; then ARGS="-rnw"; fi # recursive

grep $ARGS $1 -e "$2"

