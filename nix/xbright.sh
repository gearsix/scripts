#!/bin/sh
# xbright (xrandr brightness)
# description: set the brightness using xrandr
# dependencies: xrandr
# e.g.$ xbright -m HDMI-A-0 50

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "usage: xbright [-s MONITOR] BRIGHTNESS"
	echo ""
	echo "xrandr --output \$MONITOR --brightness \$BRIGHTNESS"
	exit
fi

monitor="HDMI-A-0"
if [ "$1" = "-m" ]; then shift; monitor="$1"; shift; fi
xrandr --output $monitor --brightness $1
