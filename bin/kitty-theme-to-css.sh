#!/bin/bash

theme=$1
grep -v -e '^\s*#' -e '^$' "$theme" | sed -e 's/^/@define-color /' -e 's/$/;/'
