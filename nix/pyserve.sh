#!/usr/bin/env sh

dir="."

if [ $1 ]; then dir=$1; fi

python3 -m http.server --directory $dir
