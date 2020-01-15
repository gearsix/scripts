#!/bin/sh
# openurl
# description: script for opening .url filetype
# e.g.$ openurl link.url
# SEE: http://www.danielbrice.net/blog/opening-url-file-like-a-pro/
# NOTE: see http://www.danielbrice.net/blog/opening-url-file-like-a-pro/ for .url spec

URL=$(cat "$1" | grep "URL=" | cut -d= -f2)
echo -e "xdg-open $URL"
xdg-open "$URL" &> /dev/null

