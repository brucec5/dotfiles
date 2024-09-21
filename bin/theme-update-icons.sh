#!/bin/bash

set -eo pipefail

theme=${1?you must specify a theme file as the first param}
theme_dir=${2?you must specify a theme dir as the second param}

foreground=$(grep "^foreground" "$theme" | awk '{print $2}')

for f in "$theme_dir/"*.svg; do
  sed -Ei "s/#[0-9a-fA-F]{6}/${foreground}/" "$f"
done
