#!/bin/bash

if [[ -z "$__PKGS" ]]; then
  __PKGS=()
fi

while read -r dir; do
  if [[ -z "$dir" ]]; then
    continue
  fi

  __CONFIG_FILE=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir".txt
  if [[ -r "$__CONFIG_FILE" ]]; then
    echo "$__CONFIG_FILE"
    source ${DOTFILES_ROOTS:-~/.dotbrick}/_scripts/check-requirements.sh <"$__CONFIG_FILE"
    continue
  fi

  __DIR_PATH=${DOTFILES_ROOTS:-~/.dotbrick}/"$dir"
  if [[ -d "$__DIR_PATH" ]]; then
    __PKGS+=("$dir")
    __REQUIREMENTS_PATH="$__DIR_PATH"/requirements.txt
    if [[ -f "$__REQUIREMENTS_PATH" ]]; then
      while read -r requirement; do
        if [[ "$requirement" == *"|"* ]]; then
          __OLD_IFS=$IFS
          IFS='|'
          read -a pkgs <<<"$requirement"
          IFS=$__OLD_IFS

          __MISSING_PKGS=""
          __FOUND_PKG=false
          for pkg in "${pkgs[@]}"; do
            __MISSING_PKGS+="'$pkg' or"
            if [[ " ${__PKGS[*]} " =~ " ${pkg} " ]]; then
              __FOUND_PKG=true
              break
            fi
          done
          if [[ ! $__FOUND_PKG ]]; then
            printf "%s\n" "'$dir' missing required package $__MISSING_PKGS. Please add $__MISSING_PKGS before '$dir' in config file." >&2
            exit 1
          fi
        elif [[ ! " ${__PKGS[*]} " =~ " ${requirement} " ]]; then
          printf "%s\n" "'$dir' missing required package '$requirement'. Please add '$requirement' before '$dir' in config file." >&2
          exit 1
        fi
      done < <(cat "$__REQUIREMENTS_PATH")
    fi
  fi
done
