#!/bin/bash
# xdg-open
# open file in xserver (doesn't support multiple files at once)
#
# xopen file [-shh, -shhh]
# -shh, -shhh   # send stdout to /dev/null
# 
# $lazymode=xo

for last_arg; do true; done;
# check for shhh
if [[ $last_arg == "-shh" || $last_arg == "-shhh" ]]; then
    args=( "$@" )               # get all args
    unset "args[${#args[@]}-1]" # remove last arg

    # all remaining args = files to open (shh mode)
    xdg-open "$args" &>/dev/null
#standard
else
    xdg-open "$@"
fi
