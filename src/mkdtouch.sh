#!/bin/sh
# description: mkdir $1; touch ${2, ...}
# arguments: $1 = dir path to make; $2, ... = filenames to touch

mkdir $1
shift
touch $@

