#!/bin/bash
# DESCRIPTION: build a go pkg for all supported platforms
# DEPENDENCIES: go

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: gobuild SRC..."
	echo ""
	echo "build a go binary for every platform"
	echo "this will set the GOARCH and GOOS variables and run 'go build'"
	echo "for when you want to build a binary to distribute for as many platforms as possible"
	exit
fi

name=$1
src=$2
arch=(amd64 386 arm)
os=(linux windows darwin dragonfly openbsd netbsd freebsd)

for a in ${arch[@]}; do
	for o in ${os[@]}; do
		if [[ $a = "arm" || $a = "386" ]]; then
			if [[ $o = "darwin" || $o = "dragonfly" ]]; then
				continue
			fi
		fi

		echo "building $name-$a-$o"
		GOARCH=$a GOOS=$o go build -o $name-$a-$o $src
	done
done
