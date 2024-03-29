#!/bin/sh
# grepf (grep find)
# description: find files containing string $2 in directory/file $1
# dependencies: grep
# e.g.$ grepf dogs/ "shades"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: grepf DIRECTORY EXPRESSION"
	echo ""
	echo "call grep EXPRESSION on all files in DIRECTORY"
	exit
fi

grep -rnw $1 -e "$2"

