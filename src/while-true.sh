#!/bin/sh
# while-true
# description: clear terminal, run $1, sleep ($2 || 1), repeat (Ctrl+C to cancel)
# e.g.$ while-true "git status" 5

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: while-true \"ACTION\" [SLEEP]"
	echo ""
	echo "while-true will loop infinitely and repeat ACTION every [SLEEP] seconds."
	echo "ACTION should be the terminal command to carry out.
	echo "  Note that it needs to be provided inbetween \"\" marks so as not to be read as multiple arguments"
	echo "SLEEP should provide the number of seconds to sleep for (default: 1)"
	exit
fi

while [ true ]; do
	clear
	$1
	if [ $2 ]; then
		sleep $2
	else
		sleep 1
	fi
done
