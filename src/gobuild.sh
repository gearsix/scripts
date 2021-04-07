name=$1
src=$2
arch=(amd64 386 arm)
os=(linux windows darwin dragonfly openbsd netbsd freebsd)

for a in ${arch[@]}; do
	for o in ${os[@]}; do
		if [[ $a == "arm" || $a == "386" ]]; then
			if [[ $o == "darwin" || $o == "dragonfly" ]]; then
				continue
			fi
		fi

		echo "building $name-$a-$o"
		GOARCH=$a GOOS=$o go build -o $name-$a-$o $src
	done
done
