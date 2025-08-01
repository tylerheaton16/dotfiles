return {
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        --dependencies = 'rafamadriz/friendly-snippets',
        dependencies = 'L3MON4D3/LuaSnip',
        version = 'v0.*',
        opts = {
            snippets = {
                expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return require('luasnip').jumpable(filter.direction)
                    end
                    return require('luasnip').in_snippet()
                end,
                jump = function(direction) require('luasnip').jump(direction) end,
            },
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = {
                ["<C-n>"] = { "select_next", "snippet_forward" },
                ["<C-p>"] = { "select_prev", "snippet_backward" },
                ["<C-y>"] = { "select_and_accept" },
            },
            completion = {
                list = {
                    -- auto completes the LSP options
                    selection = { auto_insert = true },
                },
                menu = {
                    max_height = 30
                },
            },

            cmdline = {
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        },
    },
    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            local npairs = require("nvim-autopairs")
            npairs.setup({})

            -- In Verilog/SystemVerilog, backtick is used for text macros, so disable autopairs for those files
            npairs.get_rule("`").not_filetypes = { "verilog", "systemverilog" }
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {},
        config = function(_, opts)
            require("nvim-tree").setup(opts)
        end,
    },
    {
        "stevearc/aerial.nvim",
        opts = {
            layout = {
                default_direction = "prefer_right",
            },
        },
        config = function(_, opts)
            require("aerial").setup(opts)
        end,
    },
    {
        "greggh/claude-code.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for git operations
        },
        config = function()
            require("claude-code").setup()
        end
    },
}
