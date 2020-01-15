#!/bin/sh
# flac2mp3
# description: converts .flac files ($1...$n) to .mp3 files
# e.g.$ flac2mp3 ./album
# DEPENDENCIES: ffmpeg

for file in $1/*.flac; do
  ffmpeg -i "$file" -qscale:a 0 "${file[@]/%flac/mp3}"
done

