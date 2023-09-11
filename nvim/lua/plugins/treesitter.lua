return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies ={
            "p00f/nvim-ts-rainbow",
        },
        opts = function()
            return {
                ensure_installed = {
                    "bash",
--                    "c",
--                    "comment",
--                    "cpp",
                    "json",
                 --        "latex",
                    "lua",
                    "python",
                    "regex",
--                    "rst",
                    "scala",
                    "verilog",
                    "yaml",
                    "vim",
                    --"devicetree",
                },
                highlight = { enable = true },
                textobjects = { enable = true },
                incremental_selection = { enable = true },

                rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },
        }
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
  }
