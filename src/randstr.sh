#!/bin/sh
# randstr
# description: generate a random string of size $1 (default: 10)
# e.g.$ randstr 10

len=10
if [ $1 ]; then len=$1; fi

echo $(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w $len | head -n 1)
