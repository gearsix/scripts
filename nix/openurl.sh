#!/bin/sh
# openurl
# description: xdg-open all urls found in $@
# e.g.$ openurl saved-links.txt

for f in $@; do
	for url in "$(grep -o -E 'https?://[^"]+' $f)"; do
		xdg-open "$url";
	done
done
