#!/usr/bin/env bash


export PDFLATEX="/usr/bin/pdflatex"

echo $@ 1>&2

PROJECT_FOLDER="$(dirname $2)"

latexmk -f \
  -pdflatex='${PDFLATEX:?} -file-line-error --shell-escape -synctex=0' \
  -outdir="${PROJECT_FOLDER:?}/build" -pdf "$2" 1>&2
