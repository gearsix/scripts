#!/bin/bash
# ~/scripts
# run a terminal command and send stdout to /dev/null
#
# shh cmd
# 
# @TODO add autocomplete

$@ &>/dev/null &

