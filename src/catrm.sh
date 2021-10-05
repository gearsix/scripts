#!/usr/bin/env bash

ync=
for f in $@; do
	unset ync
	while [ ! $ync ]; do
		read -p "read remove '$(readlink -f $f)' [y/n/c]? " -n 1 ync
		echo ""
		if   [ "$ync" == "y" ]; then rm $f
		elif [ "$ync" == "c" ]; then cat $f; unset ync
		elif [ "$ync" == "n" ]; then continue;
		else unset ync; fi
	done
done
