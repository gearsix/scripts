#!/bin/bash
# ~/scripts/flac2mp3.sh
# converts .flac to .mp3
# DEPENDENCIES: requires ffmpeg
# e.g.$ flac2mp3 ./album

for file in $1/*.flac; do
  ffmpeg -i "$file" -qscale:a 0 "${file[@]/%flac/mp3}"
done

