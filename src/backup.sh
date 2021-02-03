#!/bin/sh
# backup
# description: backup $@ to $@.bak
# e.g.$ backup ~/.bashrc ~/.vimrc

for f in ${@}; do cp $f $f.bak; done

