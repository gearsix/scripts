#!/bin/sh
# xopen = xdg-open FILE
# description: open file in xserver (doesn't support multiple files at once yet)
# ARGUMENTS: -q, --quiet       send stdout to /dev/null

xdg-open $@ &>/dev/null
