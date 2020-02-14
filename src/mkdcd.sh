#!/bin/sh
# mkdmv (mkdir & cd) 
# description: mkdir $1 && cd into it
# e.g.$ mkdmv ~/new-dir

dir=$1

mkdir -p $dir
cd $dir
