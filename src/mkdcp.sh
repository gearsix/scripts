#!/bin/sh
# mkdcp (mkdir&cp)
# description: make a directory and copy files into it
# e.g.$ mkdcp ~/new-dir /tmp/file*

#mkdir $1
dir=$1;
mkdir -p $dir
shift;

#cp files into $1
for file in $@; do
    cp $file $dir;
    shift;
done

