#!/bin/sh
# flac2mp3
# description: converts .flac files ($1...$n) to .mp3 files
# e.g.$ flac2mp3 ./album
# DEPENDENCIES: ffmpeg

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Usage: flac2mp3 DIRECTORY"
	echo ""
	echo "use ffmpeg to convert a directory of .flac files to .mp3 files"
	exit
fi

for file in $1/*.flac; do
  ffmpeg -i "$file" -qscale:a 0 "${file[@]/%flac/mp3}"
done

