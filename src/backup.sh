#!/bin/sh
# backup
# description: cp $@ -> $@.bak
# e.g.$ backup ~/.bashrc ~/.vimrc

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: 'backup FILEPATHS...'"
	echo ""
	echo "copy all listed files (in FILEPATHS...) to \$filename.bak"
	exit
fi

for f in ${@}; do cp $f $f.bak; done

