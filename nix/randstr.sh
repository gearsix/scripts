#!/bin/sh
# randstr
# description: generate a random string of size $1 (default: 10)
# e.g.$ randstr 10

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: randstr [SIZE]"
	echo ""
	echo "print a random string of SIZE length (default: 10)"
	exit
fi

len=10
if [ $1 ]; then len=$1; fi

echo $(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w $len | head -n 1)
