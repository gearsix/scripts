#!/bin/sh
# cpc (cp contents)
# description: copies the contents of file $1 to file $2
#
# e.g.$ cpc file1.txt file2.txt

if [ -z $1 ] || [ -z $2 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: cpc INPUT OUTPUT"
	echo ""
	echo "copy the contents of the file INPUT to file OUTPUT"
	echo "WARNING: this will overwrite existing contents in file OUTPUT"
	exit
fi

touch $2
echo "$(cat $1)" > $2

