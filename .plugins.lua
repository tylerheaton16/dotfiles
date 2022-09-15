-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Packages
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'

-- From vimrc
  use 'tpope/vim-fugitive'
  use 'https://github.com/tarikgraba/vim-lefdef.git'
  use 'junegunn/fzf.vim'
  use 'universal-ctags/ctags'
  use 'vhda/verilog_systemverilog.vim'
  use 'liuchengxu/vista.vim'
  use 'godlygeek/tabular'
  use 'vim-scripts/verilog_emacsauto.vim'
  use 'benmills/vimux' --From vim can open tmux terminals
  use 'christoomey/vim-tmux-navigator'
  use 'psliwka/vim-smoothie'
  use 'camspiers/lens.vim'
  use 'lervag/vimtex'
  use 'voldikss/vim-floaterm'
--  use 'justinmk/vim-syntax-extra' -- c highlighting
  use 'vim-python/python-syntax'
  use 'kshenoy/vim-signature'
  use 'vim-scripts/tcl.vim--smithfield'
  use 'tpope/vim-vinegar'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'dhruvasagar/vim-table-mode'

  -- Setting up LSP
  use 'nvim-lua/plenary.nvim'
  use({"hrsh7th/nvim-cmp",
        config = function()
            require("nvim-cmp")
        end,
    })
    use({'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp"})
    use({'hrsh7th/cmp-buffer', after = "nvim-cmp"})
    use({'hrsh7th/cmp-path', after = "nvim-cmp"})
    use({'hrsh7th/cmp-cmdline', after = "nvim-cmp"})
    --use({'hrsh7th/cmp-nvim-lsp-signature-help', after = "nvim-cmp"})
    use({'ray-x/lsp_signature.nvim', after = "nvim-cmp"})

    use({'L3MON4D3/LuaSnip', after = "nvim-cmp"})
    use({'saadparwaiz1/cmp_luasnip', after = "nvim-cmp"})
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

    use({'rafamadriz/friendly-snippets', after = "nvim-cmp"})

    -- Common LSP Configurations
    use({
        "williamboman/nvim-lsp-installer",
        {
            'neovim/nvim-lspconfig',
            after = {
                "cmp-nvim-lsp",
            },
            config = function()
                require("lsp")
            end
        }
    })

  use({'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" }})
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'

end)
