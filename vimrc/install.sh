#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#symlinking .vimrc
if [ -e $HOME/.vimrc ]; then
     mv $HOME/.vimrc $HOME/$BACKUP/.vimrc_bak
     ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
 else
     ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
 fi
