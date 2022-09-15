#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#Installing fzf
wget https://github.com/dandavison/delta/releases/download/0.11.3/delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz
tar -xvzf delta-0.11.3-x86_64-unknown-linux-gnu.tar.gz
