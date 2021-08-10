#!/bin/sh
# preview-md (preview markdown)
# DESCRIPTION: convert a markdown file $1 to html, optional open in a browser (if $2 = --open). Set converter in src (cmark by default).
# dependencies: cmark
# e.g.$ preview-md README.md --open

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: preview-md FILE [OPTIONS]"
	echo ""
	echo "convert a Markdown file to HTML using cmark"
	echo "the generated file will have the same filename as FILE, where the extension is replaced with .html"
	echo ""
	echo "OPTIONS"
	echo "  -o, --open     open the output file (using xdg-open) when finished"
	exit
fi

mdconv="cmark"
out=$(echo "$1" | sed "s/md/html/")

if [ -e "$out" ]; then rm -i $out; fi
$mdconv "$1" > "$out"
if [ $? -eq 0 ]; then
	echo "succesfully converted to $out"
	if [ ! -z $2 ] && [ "$2" = "--open" ] || [ "$2" = "-o" ]; then
		xdg-open "$out" &>/dev/null
	fi
else
	echo "$mdconv returned $?"
fi
