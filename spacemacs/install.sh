#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Setting up spacemacs config file
source $DOTFILES_LIB
if [ -e $HOME/.spacemacs ]; then 
    mv $HOME/.spacemacs $HOME/$BACKUP/.spacemacs_bak
    ln -s $HOME/dotfiles/.spacemacs $HOME/.spacemacs
else
    ln -s $HOME/dotfiles/.spacemacs $HOME/.spacemacs
fi
