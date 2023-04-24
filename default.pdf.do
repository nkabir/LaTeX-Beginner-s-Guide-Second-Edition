#!/usr/bin/env bash


echo $@ 1>&2

PROJECT_FOLDER="$(dirname $2)"
TEX_BASENAME="$(basename $2)"
TEX_FILE="${TEX_BASENAME:?}.tex"
PDF_FILE="${TEX_BASENAME:?}.pdf"

echo $TEX_FILE 1>&2

pushd "${PROJECT_FOLDER:?}" 1>&2
latexmk -f \
	-e '$max_repeat=5' \
	-shell-escape \
	-outdir="${RKX_DR_BUILD:?}" \
	-pdflatex='lualatex -file-line-error -synctex=1' "${TEX_FILE}" 1>&2

xpdf -fullscreen "${RKX_DR_BUILD:?}/${PDF_FILE}" 1>&2
popd 1>&2
