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
            require("nvim-treesitter").install(opts)
            for _, ft in ipairs(opts) do
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = { ft },
                    callback = function() vim.treesitter.start() end,
                })
        end
        end,
    },
}
