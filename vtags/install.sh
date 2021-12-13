#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

#Install vtags and setup
VERSION='vtags-3.01'

pushd .
curl -o $HOME/$VERSION.tar.gz https://www.vim.org/scripts/download_script.php?src_id=26794
cd $HOME
tar -xvzf ${VERSION}.tar.gz
rm ${VERSION}.tar.gz                    
mv vtags-3.01 .vtags-3.01
popd
cp $HOME/dotfiles/vtags/vtags_vim_api.vim $HOME/.vtags-3.01/
