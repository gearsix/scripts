#!/bin/sh
# backup
# description: cp $@ -> $@.bak
# e.g.$ backup ~/.bashrc ~/.vimrc

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: 'backup [OPTIONS] FILEPATHS...'"
	echo ""
	echo "copy all listed files (in FILEPATHS...) to \$filename.bak"
	echo ""
	echo "OPTIONS (must be provided before FILEPATHS...)"
	echo "  -m      move files instead of copying them, removing the original"
	exit
fi

alias backup='cp'
if [ "$1" = "-m" ]; then shift; alias backup='mv'; fi
for f in "${@}"; do backup "$f" "$f.bak"; done
