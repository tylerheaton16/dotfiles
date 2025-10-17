#!/bin/bash -e

# Customize zellij installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

if [ ! -L "$HOME/.config/zellij" ]; then
    ln -sf "$HOME/dotfiles/zellij" "$HOME/.config/zellij"
fi
