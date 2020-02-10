#!/bin/sh

mkdir -p w

for s in s/*; do
    pandoc -f markdown-smart -t html5 \
           "$@" \
           --strip-comments \
           --no-highlight \
           --template=s/d/t.html \
           "$s" |
           sed ':a;N;$!ba;s|>\s*<|><|g' > "w/${s##*/}.html"
done
