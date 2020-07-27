#!/bin/sh
# preview-md (preview markdown)
# DESCRIPTION: convert a markdown file $1 to html, optional open in a browser (if $2 == --open). Set converter in src (cmark by default).
# dependencies: cmark
# e.g.$ preview-md README.md --open

mdconv=cmark
out=~/tmp/README.html

${mdconv} $1 >> $out
if [ $? -eq 0 ]; then
	echo "succesfully converted to $out"
	if [ ! -z $2 ] && [ $2 = "--open" ] || [ $2 = "-o" ]; then
		xdg-open $out &>/dev/null
	fi
else
	echo "$mdconv returned $?"
fi
