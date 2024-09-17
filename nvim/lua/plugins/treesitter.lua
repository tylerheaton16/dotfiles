return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            return {
                ensure_installed = {
                    "bash",
                    "c",
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
                fold = { enable = true },
                textobjects = { enable = true },
                incremental_selection = { enable = true },

        }
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
  }
