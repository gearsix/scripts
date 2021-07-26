#!/bin/sh
# mkdmv (mkdir & mv) 
# description: mkdir $1 && mv ($2...$n) 1to it
# e.g.$ mkdmv ~/new-dir ~/var/tmp/file*

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: mkdmv DIRECTORY FILEPATH..."
	echo ""
	echo "mkdir DIRECTORY and mv all listed FILEPATH... files into it"
	exit
fi

#mkdir $1
dir="$1";
mkdir -p "$dir"
shift;

#cp files ($2...$n) into $1
for file in $@; do
    mv "$file" "$dir";
    shift;
done

