#!/bin/bash
# shh
# run a terminal command and send stdout to /dev/null
#
# shh cmd
# 
# @TODO autocomplete for $PATH files?

for bin in $@; do
    $bin &>/dev/null &
done;

