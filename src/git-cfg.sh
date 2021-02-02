#!/usr/bin/env bash
# git-cfg
# description: set git config user.name ($1) & user.email ($2) in current dir, defaults to using --local
# ARGUMENTS: -g, --global = "git config --global ..." | -h, --help = prints help

if [[ $1 == "--help" || $1 == "-h" ]]; then
	echo "Usage: git-cfg [ARGUMENTS] [NAME] [EMAIL]"
  echo ""
	echo "shorthand script to set the user.name and user.email values in a git"
  echo "config."
  echo ""
	echo "ARGUMENTS"
  echo "  -l, --local   use 'git config --local (default)"
	echo "  -g, --global  use 'git config --global'"
  exit
fi

global=0
if [[ $1 == "--global" || $1 == "-g" ]]; then
	global=1
	shift
fi

username=$1
useremail=$2

if [[ $global -eq 1 ]]; then
	git config --global user.name "$username"
	git config --global user.email "$useremail"
else
	git config --local user.name "$username"
	git config --local user.email "$useremail"
fi
