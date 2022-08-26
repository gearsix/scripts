#!/usr/bin/env sh
# on file change
# description: when a file ($1) modified time is updated, perform $2..
# dependencies: stat
# e.g.$ onfilech draft-plans.txt cp draft-plans.txt new-plans.txt

file=$1; shift
cmd=$*

while true; do
	mod=$(stat "$file");
	while [ "$mod" != false ]; do
		upd=$(stat "$file");
		if [ "$upd" != "$mod" ]; then
			$cmd; echo update; mod=false;
		fi;
		sleep 10;
	done;
done;
