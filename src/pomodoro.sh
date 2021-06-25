#!/usr/bin/env sh

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo "pomdoro"
    echo "usage: pomodoro [OPTIONS]"
    echo ""
    echo "OPTIONS"
    echo "  -s, --short     Take short (5 minute breaks), default."
    echo "  -l, --long      Take long (15 minute breaks)."
    echo "  -h, --help      Print this message"
    exit
fi

NOTIFY=$NOTIFY
WORK=25m
BREAK=5m
if [ "$1" == "--long" ]; then  BREAK=15m; fi

notify-send -t $NOTIFY -a pomodoro "Begin" "Work for 25m. Break for $BREAK.\nRepeat."
if [ -s $? ]; then echo "notify-send failed, aborting"; fi

while [ true ]; do
    sleep "$WORK" && notify-send -t $NOTIFY -a pomodoro "Take a break" "You've been working for $WORK, time for a $BREAK break."
    sleep "$BREAK" && notify-send -t $NOTIFY -a pomodoro "Back to work" "$BREAK break is over, back to being busy for 25m."
done
