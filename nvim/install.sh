#!/bin/bash -e

# Customize neovim installation.

cd $(dirname $0)

if [[ -z "$DOTFILES_DIR" ]] ; then
    echo "DOTFILES_DIR is undefined."
    exit 2
fi

# Import custom functions.
source $DOTFILES_LIB

if [ ! -d "$HOME/.local/share/nvim" ]; then
    mkdir $HOME/.local/share/nvim
fi
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
fi
if [ ! -d "$HOME/.config/nvim/lua" ]; then
    mkdir $HOME/.config/nvim/lua
fi
if [ ! -d "$HOME/.config/nvim/after/syntax" ]; then
    mkdir -p $HOME/.config/nvim/after/syntax
fi
if [ ! -d "$HOME/.config/nvim/lua/config" ]; then
    mkdir -p $HOME/.config/nvim/lua/config
fi

if [ ! -f $HOME/nvim.appimage ]; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        if [[ -f $HOME/.local/bin/nvim ]]
        then
            rm $HOME/.local/bin/nvim
        fi
    mv -f nvim.appimage $HOME/.local/bin/nvim
    chmod u+x $HOME/.local/bin/nvim
    export PATH="$HOME/.local/bin/nvim:$PATH"
       # if [[ -f $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim ]]
       # then
       #     rm $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
       # fi
    git_clone_or_update  https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

#symlinking .nvim
if [ -e $HOME/.config/nvim/init.lua ]; then
     mv $HOME/.config/nvim/init.lua $HOME/$BACKUP/.init.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/init.lua $HOME/.config/nvim/init.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/init.lua $HOME/.config/nvim/init.lua
fi

#Copy over plugins.lua
if [ -e $HOME/.config/nvim/lua/plugins.lua ]; then
     mv $HOME/.config/nvim/lua/plugins.lua $HOME/$BACKUP/.plugins.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/plugins.lua $HOME/.config/nvim/lua/plugins.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/plugins.lua $HOME/.config/nvim/lua/plugins.lua
fi

#Copy over treesiter.lua
if [ -e $HOME/.config/nvim/lua/config/treesitter.lua ]; then
     mv $HOME/.config/nvim/lua/config/treesitter.lua $HOME/$BACKUP/.treesitter.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/treesitter.lua $HOME/.config/nvim/lua/config/treesitter.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/treesitter.lua $HOME/.config/nvim/lua/config/treesitter.lua
fi

if [ -e $HOME/.config/nvim/lua/config/nvim-cmp.lua ]; then
     mv $HOME/.config/nvim/lua/config/nvim-cmp.lua $HOME/$BACKUP/.nvim-cmp.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/nvim-cmp.lua $HOME/.config/nvim/lua/config/nvim-cmp.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/nvim-cmp.lua $HOME/.config/nvim/lua/config/nvim-cmp.lua
fi

if [ -e $HOME/.config/nvim/lua/config/lsp.lua ]; then
     mv $HOME/.config/nvim/lua/config/lsp.lua $HOME/$BACKUP/.lsp.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/lsp.lua $HOME/.config/nvim/lua/config/lsp.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/lsp.lua $HOME/.config/nvim/lua/config/lsp.lua
fi

if [ -e $HOME/.config/nvim/lua/config/nightfox.lua ]; then
     mv $HOME/.config/nvim/lua/config/nightfox.lua $HOME/$BACKUP/.nightfox.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/nightfox.lua $HOME/.config/nvim/lua/config/nightfox.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/nightfox.lua $HOME/.config/nvim/lua/config/nightfox.lua
fi

if [ -e $HOME/.config/nvim/lua/config/vtags.lua ]; then
     mv $HOME/.config/nvim/lua/config/vtags.lua $HOME/$BACKUP/.vtags.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/vtags.lua $HOME/.config/nvim/lua/config/vtags.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/vtags.lua $HOME/.config/nvim/lua/config/vtags.lua
fi

#Copy over fugitive.lua
if [ -e $HOME/.config/nvim/after/syntax/fugitive.lua ]; then
     mv $HOME/.config/nvim/after/syntax/fugitive.lua $HOME/$BACKUP/.fugitive.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/fugitive.lua $HOME/.config/nvim/after/syntax/fugitive.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/fugitive.lua $HOME/.config/nvim/after/syntax/fugitive.lua
fi
#Copy over git.lua
if [ -e $HOME/.config/nvim/after/syntax/git.lua ]; then
     mv $HOME/.config/nvim/after/syntax/git.lua $HOME/$BACKUP/.git.lua_bak
     ln -sf $HOME/dotfiles/nvim/lua/git.lua $HOME/.config/nvim/after/syntax/git.lua
 else
     ln -sf $HOME/dotfiles/nvim/lua/git.lua $HOME/.config/nvim/after/syntax/git.lua
fi
