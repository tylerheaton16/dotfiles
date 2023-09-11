-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Packages
    use({
        "EdenEast/nightfox.nvim",
        config = function()
            require("config.nightfox")
        end
    })
    use 'folke/tokyonight.nvim'

    -- From vimrc
    use 'tpope/vim-fugitive'
    use 'https://github.com/tarikgraba/vim-lefdef.git'
    use 'junegunn/fzf.vim'
    use 'universal-ctags/ctags'
    use 'vhda/verilog_systemverilog.vim'
    use 'liuchengxu/vista.vim'
    use 'godlygeek/tabular'
    --use 'vim-scripts/verilog_emacsauto.vim'
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
    --  use 'vim-airline/vim-airline'
    --  use 'vim-airline/vim-airline-themes'
    use 'dhruvasagar/vim-table-mode'
    use 'sharkdp/fd'
    use 'itchyny/lightline.vim'
    use 'willchao612/vim-diagon'
    use({
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
        end,
    })
    use({
        'shumphrey/fugitive-gitlab.vim',
        requires = 'tpope/vim-fugitive'
    })
    use({
        "aaronhallaert/advanced-git-search.nvim",
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
        requires = {
            "nvim-telescope/telescope.nvim",
            -- to show diff splits and open commits in browser
            "tpope/vim-fugitive",
        },
    })
    use({
        "LinArcX/telescope-env.nvim",
        --this require below doesn't work. Added in init.lua
        --config = function()
        --    require("telescope").load_extension("env")
        --end,
        requires = {
            "nvim-telescope/telescope.nvim",
        },
    })
    --Setting up LSP
    use 'nvim-lua/plenary.nvim'
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp")
        end,
    })
    use({ 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" })
    use({ 'hrsh7th/cmp-buffer', after = "nvim-cmp" })
    use({ 'hrsh7th/cmp-path', after = "nvim-cmp" })
    use({ 'hrsh7th/cmp-cmdline', after = "nvim-cmp" })
    use({'hrsh7th/cmp-nvim-lsp-signature-help', after = "nvim-cmp"})
    use({ 'ray-x/lsp_signature.nvim', after = "nvim-cmp" })
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })
    use({'L3MON4D3/LuaSnip',
           version = "<CurrentMajor>.*",
           after = "nvim-cmp"})
    use({ 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" })
    use({"lukas-reineke/indent-blankline.nvim"})
    use({ 'rafamadriz/friendly-snippets', after = "nvim-cmp" })

    -- Common LSP Configurations
    --use({
    --    "williamboman/mason.nvim",
    --    build = ":MasonUpdate",
    --    config = function()
    --        require("mason").setup({
    --            ui = {
    --                icons = {
    --                    package_installed = "✓",
    --                    package_pending = "➜",
    --                    package_uninstalled = "✗"
    --                }
    --            }
    --        })
    --    end,
    --})
    --use({
    --    "williamboman/mason-lspconfig.nvim",
    --    config = function()
    --        require("mason-lspconfig").setup({
    --            ensure_installed = {
    --                "lua_ls",
    --                --"clangd"
    --            }
    --        })
    --    end,
    --})
    --use({
    --    "neovim/nvim-lspconfig",
    --    after = {
    --        "cmp-nvim-lsp",
    --    },
    --    config = function()
    --        require("config.lsp")
    --    end,
    --})
    use({
        "williamboman/nvim-lsp-installer",
        {
            'neovim/nvim-lspconfig',
            after = {
                "cmp-nvim-lsp",
            },
            config = function()
                require("config.lsp")
            end
        }
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope")
        end,
    })
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require("config.treesitter")
        end,
        run = function()
            local ts_update = require('config.nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        -- runs TSUpdate after install
    }
    use 'p00f/nvim-ts-rainbow'
    use({
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            notify.setup({
                timeout = 3000,
                stages = "fade",
            })
            vim.notify = notify
        end,
    })
end)
