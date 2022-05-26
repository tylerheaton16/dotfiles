local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
--        "c",
--        "comment",
--        "cpp",
        "json",
--        "latex",
        "lua",
        "python",
        "regex",
--        "rst",
        "scala",
        "verilog",
        "yaml",
        --"devicetree",
    },
    highlight = { enable = true },
    textobjects = { enable = true },
    incremental_selection = { enable = true },
})
