#!/bin/bash

while read -r dir; do
  if [[ -z "$dir" ]]; then
    continue
  fi

  __CONFIG_FILE=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir".txt
  if [[ -r "$__CONFIG_FILE" ]]; then
    source ${DOTFILES_ROOTS:-~/.dotbrick}/_scripts/install-by-list.sh <"$__CONFIG_FILE"
    continue
  fi

  __INSTALL_SCRIPT_PATH=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir"/scripts/install.sh
  if [ -f "$__INSTALL_SCRIPT_PATH" ]; then
    source "$__INSTALL_SCRIPT_PATH"
  fi
done
