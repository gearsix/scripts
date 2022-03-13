#!/usr/bin/env sh
# mkded (mkdir & edit)
# description: makes directory $1 and opens file $2 in $EDITOR
# e.g.$ mkded ~/new file      # create ~/new/file and edit it

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: mkdedit DIRECTORY FILENAME"
	echo ""
	echo "mkdir DIRECTORY and open \$DIRECTORY/\$FILENAME in \$EDITOR"
	exit
fi

mkdir $1;
cd $1;
touch $2;
$EDITOR $2;
