#!/bin/bash

while read src; do
  dst_dir="$(dirname "$HOME/${src#${DOTFILES_ROOTS:-~/.dotbrick}/*/links/}")"
  dst_file="$(basename ${src})"
  dst="$dst_dir/$dst_file"
  unlink "$dst"
done < <(find ${DOTFILES_ROOTS:-~/.dotbrick}/*/links -type f)
