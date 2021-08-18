#!/bin/sh
# mkdcp (mkdir&cp)
# description: make a directory and copy files into it
# e.g.$ mkdcp ~/new-dir /tmp/file*

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: mkdcp DIRECTORY FILEPATH..."
	echo ""
	echo "mkdir DIRECTORY and cp all listed FILEPATH... entries into it"
	exit
fi

#mkdir $1
dir=$1;
mkdir -p $dir
shift;

#cp files into $1
for file in $@; do
    cp -r $file $dir;
    shift;
done

