#!/bin/bash
# strlen (string length)
# description: echo's the length of a string ($1)
# e.g.$ strlen "ma di-"
#
# SEE: https://stackoverflow.com/questions/17368067/length-of-string-in-bash

strU8DiffLen () { 
    local bytlen oLang=$LANG oLcAll=$LC_ALL
    LANG=C LC_ALL=C
    bytlen=${#1}
    LANG=$oLang LC_ALL=$oLcAll
    return $(( bytlen - ${#1} ))
}

for string in $1; do
    strU8DiffLen "$string"
    printf " - %-$((14+$?))s is %2d chars length, but use %2d bytes\n" \
        "'$string'" ${#string} $((${#string}+$?))
done 

