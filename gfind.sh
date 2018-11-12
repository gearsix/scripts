#!/bin/bash
# gfind (grep find)
# find files containing string $2 in directory/file $1
#
# e.g.$ gfind dogs/ "shades"

grep -rnw $1 -e $2  #recursive, print line #, match whole word

