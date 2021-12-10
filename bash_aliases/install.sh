#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#symlinking .bash_aliases
if [ -e $HOME/.bash_aliases ]; then 
    mv $HOME/.bash_aliases $HOME/$BACKUP/.bash_aliases_bak
    ln -s $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
else
    ln -s $HOME/dotfiles/.bash_aliases $HOME/.bash_aliases
fi
