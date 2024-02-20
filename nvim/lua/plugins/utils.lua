 return {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- Used often by other plugins
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                --remove_blankline_trail = true,
            },
            indent = {
                --uncomment if you want rainbows
                --highlight = {
                --    "RainbowOrange",
                --},
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function(_, opts)
            --uncomment if you want rainbows
            --local hooks = require("ibl.hooks")
            --hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            --    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            --end)

            require("ibl").setup(opts)
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            local notify = require("notify")
            notify.setup({
                timeout = 3000,
                stages = "fade",
            })
            vim.notify = notify
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "https://github.com/tarikgraba/vim-lefdef.git",
    },
    {
        "junegunn/fzf.vim",
    },
    {
        "junegunn/fzf",
        build = {"fzf#install()"},
    },
    {
        "universal-ctags/ctags",
    },
    {
        "vhda/verilog_systemverilog.vim",
    },
    {
        "liuchengxu/vista.vim",
    },
    {
        "godlygeek/tabular",
    },
    --use 'vim-scripts/verilog_emacsauto.vim'
    {
        "benmills/vimux" --From vim can open tmux terminal",
    },
    {
        "christoomey/vim-tmux-navigator",
    },
    {
        "psliwka/vim-smoothie",
    },
    {
        "camspiers/lens.vim",
    },
    {
        "lervag/vimtex",
    },
    {
        "voldikss/vim-floaterm",
    },
    --  use 'justinmk/vim-syntax-extra' -- c highlighting
    {
        "vim-python/python-syntax",
    },
    {
        "kshenoy/vim-signature",
    },
    {
        "vim-scripts/tcl.vim--smithfield",
    },
    {
        "tpope/vim-vinegar",
    },
    --  use 'vim-airline/vim-airline'
    --  use 'vim-airline/vim-airline-themes'
    {
        "dhruvasagar/vim-table-mode",
    },
    {
        "sharkdp/fd",
    },
    {
        "itchyny/lightline.vim",
    },
    {
        "willchao612/vim-diagon",
    },
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup({
                options = {
                    disabled_filetypes={"text", "verilog_systemverilog", "sdc"},
                }
            })
        end,
    },
    {
        "shumphrey/fugitive-gitlab.vim",
        dependencies = {
            "tpope/vim-fugitive"
        },
    },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
        },
        config = function()
            require("telescope").load_extension("advanced_git_search")
        end,
    },
    {
        "LinArcX/telescope-env.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("env")
        end,
    },
}
