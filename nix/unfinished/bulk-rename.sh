#!/usr/bin/env sh
# renames all *toml, *json, *yaml files in content to */meta.{toml,json,yaml}

for f in $(find $1 -name *toml -o -name *json -o -name *yaml); do
	oldn=$(basename $f ${f:(-5):5})
	newn=${f/\/$oldn./\/meta.}
	echo "$f -> $newn"
done