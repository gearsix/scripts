# DEPRECIATED: found out you could just use "touch ./file{0..13}"

#!/bin/bash
# ~/scripts
# description: create $2 files name $1 appended with 1 to $2
# e.g$ touchn "song" 13      # creates song1...song13 in curr_dir

# if no $2
if [ -z $2 ]; then
    echo "ERROR! touchn: Specify number of files to touch in \$2";
    return 1;
fi

for i in $(seq 0 $2); do
    touchn "$1$i";
done

