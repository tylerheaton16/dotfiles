 return {
    -- Used often by other plugins
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts ={
            show_end_of_line = true,
            show_current_context = true,
            show_current_context_start = true,
        },
        config = function()
            require("indent_blankline").setup(opts)
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
            require("autoclose").setup()
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
