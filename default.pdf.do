#!/usr/bin/env bash


echo $@ 1>&2

PROJECT_FOLDER="$(dirname $2)"
TEX_FILE="$(basename $2).tex"

echo $TEX_FILE 1>&2

# latexmk -f \
#   -pdflatex='${PDFLATEX:?} -file-line-error --shell-escape -synctex=0' \
#   -outdir="${PROJECT_FOLDER:?}/build" -pdf "$2" 1>&2



pushd "${PROJECT_FOLDER:?}" 1>&2
latexmk -f \
	-e '$max_repeat=5' \
	-shell-escape \
	-outdir="${RKX_DR_BUILD:?}" \
	-pdflatex='lualatex -file-line-error -synctex=1' "${TEX_FILE}" 1>&2
popd 1>&2
