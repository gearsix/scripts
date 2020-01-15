#!/bin/sh
# strindex (string index)
# description: finds the starting index of substring ($1) in a string ($2)
# e.g.$ strindex "cat" "the cat sat on the mat"   #returns 4
#
# NOTES: index returned ranges from 0 - (string length)

#swaps argument (strindex "cat on mat" "mat")
if [[ -z $3 && $3 == "-r" ]]; then
    x="${1%%$2*}"
    [[ "$x" = "$1" ]] && echo "ERROR! strindex(): Could not find $2 in $1" || echo "${#x}"
#standard usage (see e.g.$)
else
    x="${2%%$1*}"
    [[ "$x" = "$2" ]] && echo "ERROR! strindex(): could not find $1 in $2"  || echo "${#x}"
fi

