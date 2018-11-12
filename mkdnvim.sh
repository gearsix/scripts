#!/bin/bash
# mkdnvim (mkdir&nvim)
# Makes directory $1 and opens file $2 using nvim
#
# mkdnvim <new_dir> <filename>
# e.g.$ mkdnvim ~/new file      #creates ~/new/file and nvim into it

mkdir $1;
cd $1;
touch $2;
nvim $2;

