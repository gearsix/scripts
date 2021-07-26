#!/bin/sh
# mkdnvim (mkdir&nvim)
# description: makes directory $1 and opens file $2 using nvim
# e.g.$ mkdnvim ~/new file      #creates ~/new/file and nvim into it

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: mkdedit DIRECTORY FILENAME"
	echo ""
	echo "mkdir DIRECTORY and open \$DIRECTORY/\$FILENAME in \$EDITOR"
	exit
fi

mkdir $1;
cd $1;
touch $2;
$EDITOR $2;

