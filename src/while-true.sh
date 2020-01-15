#!/bin/bash
# while-true
# description: clear terminal, run $1, sleep ($2 || 1), repeat (Ctrl+C to cancel)
# e.g.$ while-true "git-status" 5

while [ true ]; do
	clear
	$1
	if [[ -z $2 ]]; then
		sleep 1
	else
		sleep $2
	fi
done
