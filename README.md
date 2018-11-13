# bash-scripts
A small collection of personal Bash scripts. I usually mkdir a ~/bin folder (usually in $PATH by default) and ln -s for all the scripts I wanna use.

Most of these are for convenience.

If any of them are do-able with a simple single-line of Bash, let me know!

## strings
- strlen = prints the length of string ($1)
- strindex = prints the index (starting from 0) of the first character in substring ($1)
- gfind = find all files in dir ($1) containing string ($2) - SUPER useful for debugging somebody else's code

## file management
- shh = runs binaries ($1..$n) and send stdout to /dev/null
- flac2mp3 = converts .flac files ($1..$n) to .mp3 files
- cpc = copy the contents of file $1 into file $2 - WARNING: will overwrite contents of file $2
- xopen = open files ($1..) in their xdg-default
  - ```--shh``` ```-shh```
- openurl = open a .url file ($1) (see http://www.danielbrice.net/blog/opening-url-file-like-a-pro/)
  - I never use this one directly myself, instead I set it to the default binary for .url files in ~/.config/mimeapps.list and use xopen
- mkdcp = make directory ($1) and copy files into it ($2..$n)
- mkdmv = make directory ($1) and move files into it ($2..$n)
- mkdnvim = make directory ($1), touch file ($2) and open file ($2) in nvim

# Authors
GeaRSiX

