#!/bin/bash
# mkdnvim (mkdir&nvim)
# description: makes directory $1 and opens file $2 using nvim
# e.g.$ mkdnvim ~/new file      #creates ~/new/file and nvim into it

mkdir $1;
cd $1;
touch $2;
nvim $2;

