#!/usr/bin/env bash
# Builds the reading PDFs from Deutsch.tex and English.tex:
#   pdf/Mein_Tagebuch.pdf  (German reading edition)
#   pdf/My_Diary.pdf       (English translation)
# With --scan it also rebuilds pdf/Mein_Tagebuch_Handschrift.pdf, a small greyscale copy of the scan.
# Needs pdflatex (TeX Live with ebgaramond and microtype); --scan needs ghostscript.
set -euo pipefail
cd "$(dirname "$0")"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cp Deutsch.tex English.tex title.png "$tmp"/

for f in Deutsch English; do
  # twice, so footnote and page references settle
  (cd "$tmp" && pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" > /dev/null \
             && pdflatex -interaction=nonstopmode -halt-on-error "$f.tex" > /dev/null) \
    || { echo "pdflatex failed for $f.tex, see $tmp/$f.log" >&2; trap - EXIT; exit 1; }
done

mkdir -p pdf
cp "$tmp/Deutsch.pdf" pdf/Mein_Tagebuch.pdf
cp "$tmp/English.pdf" pdf/My_Diary.pdf

if [ "${1:-}" = "--scan" ]; then
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook \
     -dColorImageResolution=130 -dGrayImageResolution=130 \
     -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray \
     -sOutputFile=pdf/Mein_Tagebuch_Handschrift.pdf "Mein Tagebuch__Helene Martha Schaarschmidt.pdf"
fi

ls -lh pdf/
