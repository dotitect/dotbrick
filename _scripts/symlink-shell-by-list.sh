#!/bin/bash

while read -r dir; do
  __CONFIG_FILE=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir".txt
  if [[ -r "$__CONFIG_FILE" ]]; then
    source ${DOTFILES_ROOTS:-~/.dotbrick}/_scripts/symlink-shell-by-list.sh <"$__CONFIG_FILE"
    continue
  fi

  zshrc_path=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir"/zshrc

  if [[ -d "$zshrc_path" ]]; then
    while read -r src; do
      dst_dir="$(dirname "$HOME/.zshrc.d/"$dir"/${src#${DOTFILES_ROOTS:-~/.dotbrick}/*/zshrc/}")"
      dst_file="$(basename "$src")"
      dst="$dst_dir/$dst_file"

      unlink "$dst"
      if [[ ! -e "$dst" ]]; then
        if [[ ! -d "$dst_dir)" ]]; then
          mkdir -p "$dst_dir"
        fi
        ln -s "$src" "$dst"
      fi
    done < <(find "$zshrc_path" -type f)
  fi

  zshenv_path=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir"/zshenv

  if [[ -d "$zshenv_path" ]]; then
    while read -r src; do
      dst_dir="$(dirname "$HOME/.zshenv.d/"$dir"/${src#${DOTFILES_ROOTS:-~/.dotbrick}/*/zshenv/}")"
      dst_file="$(basename "$src")"
      dst="$dst_dir/$dst_file"

      unlink "$dst"
      if [[ ! -e "$dst" ]]; then
        if [[ ! -d "$dst_dir)" ]]; then
          mkdir -p "$dst_dir"
        fi
        ln -s "$src" "$dst"
      fi
    done < <(find "$zshenv_path" -type f)
  fi

  zprofile_path=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir"/zprofile

  if [[ -d "$zprofile_path" ]]; then
    while read -r src; do
      dst_dir="$(dirname "$HOME/.zprofile.d/"$dir"/${src#${DOTFILES_ROOTS:-~/.dotbrick}/*/zprofile/}")"
      dst_file="$(basename "$src")"
      dst="$dst_dir/$dst_file"

      unlink "$dst"
      if [[ ! -e "$dst" ]]; then
        if [[ ! -d "$dst_dir)" ]]; then
          mkdir -p "$dst_dir"
        fi
        ln -s "$src" "$dst"
      fi
    done < <(find "$zprofile_path" -type f)
  fi
done
