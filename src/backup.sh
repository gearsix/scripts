#!/bin/sh
# backup
# description: cp $@ -> $@.bak
# e.g.$ backup ~/.bashrc ~/.vimrc

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: 'backup [OPTIONS] FILEPATHS...'"
	echo ""
	echo "copy all listed files (in FILEPATHS...) to \$filename.bak"
	echo ""
	echo "OPTIONS (must be provided before FILEPATHS...)"
	echo "  -r      move files instead of copying them, removing the original"
	exit
fi

backup=cp
if [ "$1" == "-r" ]; then backup=mv; fi

for f in ${@}; do $backup $f $f.bak; done

