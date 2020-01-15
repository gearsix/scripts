#!/bin/bash
# shh = quiet for commands that don't include it
# description: run a terminal command ($@) and send stdout to /dev/null
# e.g.$ shh chromium &

for bin in $@; do
    $bin &>/dev/null
done;

