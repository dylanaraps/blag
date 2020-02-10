#!/bin/sh

mkdir -p w
:>w/index.html

# for s in s/*; do
#     pandoc -f markdown-smart -t html5 \
#            "$@" \
#            --strip-comments \
#            --no-highlight \
#            --title blckk.me \
#            --template=s/d/t.html \
#            "$s" |
#            sed ':a;N;$!ba;s|>\s*<|><|g' > "w/${s##*/}.html"
# done
