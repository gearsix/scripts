#!/bin/sh
# git-setcfg
# description: set git config user.name ($1) & user.email ($2) in current dir, defaults to using --local
# ARGUMENTS: -g, --global = "git config --global ..."

global=0
if [[ $1 == "--global" || $1 == "-g" ]]; then
	global=1
	shift
fi

username=$1
shift
useremail=$2
shift

if [[ $global -eq 1 ]]; then
	git config --global user.name "$username"
	git config --global user.email "$useremail"
else
	git config --local user.name "$username"
	git config --local user.email "$useremail"
fi
