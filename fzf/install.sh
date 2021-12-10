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
git_clone_or_update https://github.com/junegunn/fzf.git ~/.fzf
pushd .
cd ~/.fzf/
./install
popd
