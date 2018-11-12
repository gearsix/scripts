#!/bin/bash
# ~/scripts
# script for opening .url files
# e.g.$ openurl link.url
# http://www.danielbrice.net/blog/opening-url-file-like-a-pro/

URL=$(cat "$1" | grep "URL=" | cut -d= -f2)
echo -e "xdg-open $URL"
xdg-open "$URL" &> /dev/null

