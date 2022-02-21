#!/usr/bin/env bash

#===========
# g6scripts
#===========
# file: install
# created: 2020-01-15
# updated: 2020-01-16
# description: loops through files in ./src & installs them to configured destination

#---------
# GLOBALS
#---------
ln=0
dir=0
all=0
force=0
verbose=0
default_destination=$HOME/.local/bin
if [[ $USER == "root" ]]; then default_destination=/usr/local/bin/; fi
source=./nix/*.*
depreciated_src=./src/depreciated/*.*
scripts=()
depreciated=0

#-----------
# FUNCTIONS
#-----------
## print_help = prints the help dialog and exits
print_help () {
	echo "usage: ./install [ARGUMENTS] [SCRIPT]"
	echo ""
	echo "SCRIPTS"
	echo "  Optionally, you can specify a script to install."
	echo "  Any specified scripts must be the filepath to the"
	echo "  script (not just the filename)."
	echo ""
	echo "ARGUMENTS"
	echo "  -f, --force         overwrites files when installing"
	echo "  -r,   --reinstall   re-install scripts already existing in"
	echo "                      destination directory"
	echo "  -d, --dest [DEST]   set the install destination"
	echo "  -a, --all           install ALL the scripts ('y' to all prompts)"
	echo "  -l, --link          'ln' the script (not cp)."
	echo "  -h, --help          print this dialog"
}
install_script () {
	src=$1
	dest=$2

	if [[ $ln -eq 0 ]]; then
		echo "install $src -> $dest"
		install -pDm755 $src $dest
	else # ln the file
		echo "ln -s $src -> $dest"
		chmod +x $src
		ln -sf $(readlink -f $src) $dest
	fi
}
## install_yn = installs $1 to $2, prints $3 if user asks for "info"
install_yn () {
	src=$1  # path of the file to install
	dest=$2 # path to install the file to
	depr=$3 # if installing a depreciated script or not

	ask=0
	while [[ $ask -eq 0 ]]; do
		if [[ $force -eq 0 ]]; then
			printf "install %s [yes/no/info]? " $src
			if [[ $all -eq 0 || $depr -eq 1 ]]; then
				if [[ -e $dest && $reinstall -eq 1 ]]; then
					yn="y"
					printf "\treinstalling...\n"
				else
					read yn
				fi
			else
				yn="y"
				echo "y"
			fi

			if [[ $yn == "y" || $yn == "Y" || $yn == "yes" ]]; then
				install $src $dest
				printf "\tinstalled $dest\n"
				ask=1
			elif [[ $yn == "n" || $yn == "N" || $yn == "no" ]]; then
				printf "\tskipping...\n"
				ask=1
			elif [[ $yn == "i" || $yn == "I" || $yn == "info" ]]; then
				grep -i "description\|dependencies\|arguments\|depreciated" $script
			fi
		else 
			install_script $src $dest
			ask=1
		fi
	done
}

#------
# MAIN
#------
## parse args
while [[ $# -gt 0 ]]; do
	case $1 in
		-f|--force)
			force=1
			echo "forcing overwrite on existing files"
			shift
			;;
		-l|--link)
			ln=1
			echo "will only create symolic links to scripts, this will make the scripts in ./src/ executable"
			shift
			;;
		-d|--dest)
			dir=1
			destination=$2
			echo "install destination = $destination"
			shift
			shift
			;;
		-a|--all)
			all=1
			echo "installed ALL scripts (not including depreciated)"
			shift
			;;
		-r|--reinstall)
			reinstall=1
			echo "reinstalling currently existing files"
			shift
			;;
		-h|--help)
			print_help
			exit
			;;
		*) # assume it's a specifed script to install
			scripts+=($1)
			depreciated=1
			shift
			;;
	esac
done

## check install destination
if [[ $dir -eq 0 ]]; then
	printf "install destination (default = $default_destination): "
	read destination
	## set to default if empty input
	if [ -z $destination ]; then
		destination=$default_destination
	else
		destination=${destination/"~"/"/home/$USER"}
	fi
	## check exists
	if [ ! -e $destination ]; then mkdir -p "$destination"; fi
	## check if need root permission to r/w
	if [ ! -w $destination ]; then echo "$destination: Permission denied"; exit 1; fi
fi
mkdir -p $destination

## install all $scripts
if [ ${#scripts[@]} -eq 0 ]; then scripts=$source; fi
for script in $scripts; do
	if [[ -e ${destination//"~"/$HOME}/$(basename $script .sh) && $force -eq 0 && $reinstall -eq 0 ]]; then
		printf "${destination//"~"/$HOME}/$(basename $script .sh) already exists, skipping...\n"
	elif [[ $script != "src/depreciated" ]]; then # skip depreciated
		install_yn $script ${destination//"~"/$HOME}/$(basename $script .sh)
	fi
done

## install depreciated scripts
while [[ $depreciated -eq 0 ]]; do
	printf "install depreciated scripts (default = no) [yes/no/info]? "
	read yn
	if [[ $yn == "y" || $yn == "Y" || $yn == "yes" ]]; then
		for script in $depreciated_src; do
			install_yn $script ${destination//"~"/$HOME}/$(basename $script .sh) 1
		done
		depreciated=1
	elif [[ $yn == "n" || $yn == "N" || $yn == "no" ]]; then
		depreciated=1
	elif [[ $yn == "i" || $yn == "I" || $yn == "info" ]]; then
		echo "depreciated scripts have been found redundant, details are provided in the \"info\" for each script"
	fi
done

## end
echo "done"
echo "make sure $destination is in your \$PATH and you should be able to call any of these scripts from the terminal"

