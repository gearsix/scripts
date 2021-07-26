#!/bin/sh
# strindex (string index)
# description: finds the starting index of substring ($1) in a string ($2)
# e.g.$ strindex "cat" "the cat sat on the mat"   #returns 4
#
# NOTES: index returned ranges from 0 - (string length)

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: strindex [OPTIONS] SUBSTRING STRING"
	echo ""
	echo "print the starting index of SUBSTRING in STRING"
	echo "-1 will be printed if SUBSTRING could not be found"
	echo ""
	echo "OPTIONS (must be provided before SUBSTRING STRING)"
	echo "  -r      reverse provided SUBSTRING and STRING order"
	exit
fi

if [[ "$1" == "-r" ]]; then # swap arguments (e.g. strindex "cat on mat" "mat")
	shift
    x="${1%%$2*}"
    [[ "$x" = "$1" ]] && echo "-1" || echo "${#x}"
else #standard usage (see e.g.$)
    x="${2%%$1*}"
    [[ "$x" = "$2" ]] && echo "-1"  || echo "${#x}"
fi

