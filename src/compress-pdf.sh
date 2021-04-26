#!/bin/sh
# DESCRIPTION: i do this often enough to write a script but not often enough to memorize the arguments
# DEPENDENCIES: ghostscript
# ARGUMENTS: $1 = input file, [$2 = output file (default: compressed.pdf)]
# e.g.$: compress-pdf my-pdf.pdf my-pdf-compressed.pdf

if [ -z $1 || -z $2 ]; then
	echo "usage: compress-pdf dPDFSETTINGS INPUT [OUTPUT]"
	echo "for dPDFSETTINGS see https://web.mit.edu/ghostscript/www/Ps2pdf.htm#Options"
	echo "INPUT and OUTPUT specify the relevent filepaths"
fi

in="$2"
out="compressed.pdf"
if [ -e $3 ]; then out="$3"; fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$1 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$out $in
