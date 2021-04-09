#!/bin/bash
## rsfeed (read sfeed)
## DESCRIPTION: sfeed_update, open sfeed_html in browser
## DEPENDENCIES: sfeed
## Notes: by default html files are written to ~/docs/feeds (named after date), set $RSSFEED to modify this

TIMESTAMP=$(date +%F)

FEEDS=~/docs/feeds
if [[ ! -z $RSSFEED ]]; then FEEDS=$RSSFEEDS; fi

echo $FEEDS
echo $FEEDS/$TIMESTAMP.html

sfeed_update
sfeed_html ~/.sfeed/feeds/* > $FEEDS/$TIMESTAMP.html
xopen $FEEDS/$TIMESTAMP.html
