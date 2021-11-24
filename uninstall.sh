#!/usr/bin/env bash
DOTFILES="$(pwd)"

unset_symlinks() {
    echo "Removing symlinks"
    unlink $HOME/.zshrc
}

unset_homebrew() {
    echo "Unsetting Homebrew"
    brew remove $(brew bundle list --file=$DOTFILES/Brewfile)
}

# https://github.com/chubin/cheat.sh
unset_cheat.sh() {
    echo "Unsetting cheat.sh"

    echo "Uninstalling cheat.sh"
    rm -f /usr/local/bin/cht.sh

    echo "Unsetting Zsh Tab Completion"
    rm -f ~/.zsh.d/_cht
}

# unset_symlinks
unset_homebrew
# unset_cheat.sh