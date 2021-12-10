#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#symlinking .dircolors
if [ -e $HOME/.dircolors ]; then 
    mv $HOME/.dircolors $HOME/$BACKUP/.dircolors_bak
    ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
else
    ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
fi
