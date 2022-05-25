#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

if [ ! -f $HOME/nvim.appimage ]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    mv nvim.appimage $HOME/.local/bin/nvim
    chmod u+x $HOME/.local/bin/nvim
    export PATH="$HOME/.local/bin/nvim:$PATH"
     curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#symlinking .nvim
if [ -e $HOME/.config/nvim/init.vim ]; then
     mv $HOME/.config/nvim/init.vim $HOME/$BACKUP/.init.vim_bak
     ln -s $HOME/dotfiles/.init.vim $HOME/.config/nvim/init.vim
 else
     ln -s $HOME/dotfiles/.init.vim $HOME/.config/nvim/init.vim
 fi
