#!/bin/bash
# ~/scripts
# echo's the length of a string
# e.g.$ strlen "my di-"

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

#string=$1
#length=${#string}
#echo "$length"
