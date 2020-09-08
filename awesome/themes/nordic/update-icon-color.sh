#!/bin/sh

set -e

color="$1"
highlight_color="$2"

if [ -z "$color" ] || [ -z "$highlight_color" ]; then
  echo "Must specify both a color and highlight color"
fi

mogrify -format png -path layouts -fill "$color" -colorize 100 -alpha on ../shared/layouts/*.png
magick ../shared/taglist/squarez.png -fill "$color" -colorize 100 -alpha on taglist/squarez.png
magick ../shared/taglist/squarefz.png -fill "$highlight_color" -colorize 100 -alpha on taglist/squarefz.png
