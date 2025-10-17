#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#Setting up .Xresources for Xterm or URxvt
echo " "
echo "Please Select Terminal Configuration"
echo " (1) Xterm"
echo " (2) URxvt"
read -p 'Selection: ' term_config


##################################################################
# Create .Xresources symlink depending on Xterm or URxvt selection
##################################################################
if [ -e $HOME/.Xresources ]; then
    mv $HOME/.Xresources $HOME/$BACKUP/.Xresources_bak
fi

if [ $term_config -eq '1' ]; then
    ln -s $HOME/dotfiles/Xresources/.Xresources_xterm $HOME/.Xresources
    xrdb $HOME/.Xresources
elif [ $term_config -eq '2' ]; then
    ln -s $HOME/dotfiles/Xresources/.Xresources_urxvt $HOME/.Xresources
    xrdb $HOME/.Xresources
fi
