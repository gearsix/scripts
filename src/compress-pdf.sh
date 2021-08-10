#!/bin/sh
# DESCRIPTION: i do this often enough to write a script but not often enough to memorize the arguments
# DEPENDENCIES: ghostscript
# ARGUMENTS: $1 = input file, [$2 = output file (default: compressed.pdf)]
# e.g.$: compress-pdf my-pdf.pdf my-pdf-compressed.pdf

if [ -z $1 ] || [ -z $2 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Usage: compress-pdf [SETTINGS] INPUT [OUTPUT]"
	echo ""
	echo "for SETTINGS options, see https://web.mit.edu/ghostscript/www/Ps2pdf.htm#Options"
	echo "INPUT should provide the filepath of a PDF to compress"
	echo "OUTPUT should provided the filepath of the compressed PDF (default: ./compressed.pdf)"
	exit
fi

in="$1"
out="compressed.pdf"
if [ -e $2 ]; then out="$2"; fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$1 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$out $in

