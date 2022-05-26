-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Packages
  use 'JoosepAlviste/palenightfall.nvim'
  require('palenightfall').setup()
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'
 -- use 'nvim-treesitter/nvim-treesitter'

  -- From vimrc
  use 'tpope/vim-fugitive'
  use 'https://github.com/tarikgraba/vim-lefdef.git'
  use 'junegunn/fzf.vim'
  use 'vhda/verilog_systemverilog.vim'
  use 'godlygeek/tabular'
  use 'vim-scripts/verilog_emacsauto.vim'
  use 'benmills/vimux' --From vim can open tmux terminals
  use 'christoomey/vim-tmux-navigator'
  use 'psliwka/vim-smoothie'
  use 'camspiers/lens.vim'
  use 'lervag/vimtex'
  use 'voldikss/vim-floaterm'
  use 'justinmk/vim-syntax-extra' -- c highlighting
  use 'vim-python/python-syntax'
  use 'vim-scripts/tcl.vim--smithfield'
  use 'tpope/vim-vinegar'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'dhruvasagar/vim-table-mode'

  -- Setting up Metals for Scala
  use 'nvim-lua/plenary.nvim'
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  use({'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" }})

end)
