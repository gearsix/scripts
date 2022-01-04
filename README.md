# g6scripts

A collection of personal scripts I use.


## contents

1. [overview](#overview)
2. [installing](#installing)
3. [uninstall](#uninstall)
4. [notes](#notes)
5. [scripts](#scripts)


## overview

I use most of these scripts for convenience and to save on typing.

More recently I've been making an effort to learn PowerShell as I tend to use windows a fair bit too, so there are a few one-off scripts used for that too.


## installing

I've created an install script (bash) to help with selecting the scripts you want to install.

	usage: ./install [ARGUMENTS] [SCRIPT]

	SCRIPTS
	  Optionally, you can specify a script to install.
	  Any specified scripts must be the filepath to the
	  script (not just the filename).

	ARGUMENTS
	  -f, --force         overwrites files when installing
	  -r,   --reinstall   re-install scripts already existing in
			      destination directory
	  -d, --dest [DEST]   set the install destination
	  -a, --all           install ALL the scripts ('y' to all prompts)
	  -l, --link          'ln' the script (not cp).
	  -h, --help          print this dialog


## uninstalling

I'm planning to add an uninstall bash script too, currently you'll have to manually delete all the files added for now though.


## notes

I've added `-h` options to all the scripts.

Personally find `grepf` and `while-true` to by the most frequently used.

## scripts

**strings**

Scripts related to string parsing/manipulation

- *strindex* - print the index (starting from 0) of the first character in substring $1 found in string $2
- *grepf* - find all files in dir $1, that conatin string $2.
Useful for debugging somebody else's code in a terminal.
- *randstr* - generate a random string

**file management**

- *backup* - cp input files $@ from `filename` to `filename.bak` (mv with `-m`)
- *catrm* `rm -i` but with the option to cat the file
- *flac2mp3* - converts .flac files $@ to .mp3. Requires ffmpeg.
- *openurl* - xdg-open all links found in files $@
- *mkdcp* - make directory $1 and copy files into it ($2..$n)
- *mkdmv* - make directory $1 and move files into it ($2..$n)
- *mkdnvim* - make directory $1, touch file $2 and open file $2 in nvim
- *mkdtouch* - make a directory $1, touch files in it ($2..$n)

**tooling**

- *git-cfg* - shorthand for setting git config --local user.name $1 && git config --local user.email $2
  - You can also use it for setting global config using `-g`
- *git-clone-bulk* - clone a list of git repositories
- *git-pull-all* - pull all remote branches from the current upstream
- *gobuild* - build a go module in all available output formats, useful for releases
- *preview-md* - convert a markdown file $1 to html, open if $2 == "-o" or "--open". Uses cmark by default, set conversion tool and default output destination in src.
- *compress-pdf* - compress a .pdf file $1, requires _ghostscript_ (_gs_)

**misc**

- *xbright* - set the screen brightness using _xrandr_
- *shush* - echo output of $@ to null
- *pomodoro* - a [pomodoro](https://en.wikipedia.org/wiki/Pomodoro_Technique) timer.
- *while-true* - clear the terminal, run $1 sleep ($2 || 1 sec), repeat forever (Ctrl+C to cancel)

**depreciated**

This contains scripts that I once used but eventually realised were useless.


## authors

- gearsix

