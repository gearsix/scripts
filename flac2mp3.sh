#!/bin/bash
# flac2mp3
# converts .flac files ($1...$n) to .mp3 files
# 
# DEPENDENCIES:
#   ffmpeg
#
# e.g.$ flac2mp3 ./album

for file in $1/*.flac; do
  ffmpeg -i "$file" -qscale:a 0 "${file[@]/%flac/mp3}"
done

