#!/bin/sh
# cpc (cp contents)
# description: copies the contents of file $1 to file $2
#
# e.g.$ cpc file1.txt file2.txt

touch $2
echo "$(cat $1)" > $2

