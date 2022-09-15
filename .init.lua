-- Neovim Configurations
--
require('plugins')

local fn = vim.fn -- shorthand for fn.bufnr() calls
local g = vim.g -- table for the global variables

vim.opt_global.shortmess:remove("F")

-- vim.g   : let
-- vim.opt : global options
-- vim.wo  : window options
-- vim.bo  : buffer options

function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

-- Can now call 1 function to set the options
local scopes = { o = vim.opt, b = vim.b, w = vim.wo}
local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

function set_ft(events, ft_list, ft, ft_cmd)

    if (ft == nil) then
        ft = ''
    else
        ft = [[set filetype=]] .. ft
    end

    if (ft_cmd == nil) then
        ft_cmd = ''
    end

    cmd = ft .. ' ' .. ft_cmd

    for _, item in pairs(ft_list) do
        vim.api.nvim_create_autocmd(events, {
            pattern = {item},
            command = cmd,
        })
    end
end

-- Keybinds Updates
g.mapleader = " "
g.maplocalleader = " "

nmap("<leader>ev", ":vsplit $MYVIMRC <CR>")
nmap("<leader>vr", ":source $MYVIMRC <CR>")
nmap("<leader>eb", ":vsplit $HOME/.bashrc <CR>")
nmap("<leader>bn", ":bn <CR>")
nmap("<leader>bp", ":bp <CR>")
nmap("<leader>bb", ":tab ball <CR>")
nmap("<leader>q",  ":qa! <CR>")
nmap("<leader>wh", "<C-w>h")
nmap("<leader>wj", "<C-w>j")
nmap("<leader>wk", "<C-w>k")
nmap("<leader>wl", "<C-w>l")
nmap("<leader>ws", "<C-w>s")
nmap("<leader>w/", "<C-w>v")
nmap("<leader>wv", "<C-w>v")

-- Tab movement in nvim
nmap("tn", ":tabnew <CR>")
nmap("tc", ":tabclose <CR>")
nmap("tN", ":tab sball <CR>")
nmap("ts", ":tab split <CR>")
nmap("<leader>1", "1gt")
nmap("<leader>2", "2gt")
nmap("<leader>3", "3gt")
nmap("<leader>4", "4gt")
nmap("<leader>5", "5gt")
nmap("<leader>6", "6gt")
nmap("<leader>7", "7gt")
nmap("<leader>8", "8gt")
nmap("<leader>9", "9gt")

-- Window Control in nvim

nmap("<leader>l", ":redraw! <CR>")
nmap("<leader>ww", "<C-w>= <CR>")
nmap("<leader>w-", ":sp <CR>")
nmap("<leader>w/", ":vsp <CR>")

-- Appends verilog and systemverilog together to work for vtags/verilog-autos
local buf = {"BufRead", "BufNewFile"}
local ft_vlog  = {"*.v", "*.vg", "*.vm", "*.sv", "*.vams", "*.f"}
set_ft(buf, ft_vlog, "verilog_systemverilog.verilog.systemverilog", [[softtabstop=4 shiftwidth=4 textwidth=80]])

-- Vim-Fugitive + vimbinds
nmap("<leader>g",  ":Git")
nmap("<leader>gl", ":Git log <CR>")
nmap("<leader>gp", ":Git log -p % <CR>")
nmap("<leader>gd", ":Gvdiffsplit!")
nmap("<leader>gb", ":Git blame")
nmap("<leader>gs", ":Git status <CR>")
nmap("<leader>gw", ":Gwrite <CR>")
nmap("<leader>g",  ":Git <CR>")
nmap("<leader>o",  ":only <CR>")
nmap("<leader>gdh",":diffget //2 <CR>")
nmap("<leader>gdl",":diffget //3 <CR>")
set_ft({"FileType"}, {"git"}, nil, [[setlocal foldmethod=syntax]])

-- tmux / vimux config
nmap("<leader>vp", ":VimuxPromptCommand<CR>")
nmap("<leader>vl", ":VimuxRunLastCommand<CR>")
nmap("<leader>vi", ":VimuxInspectRunner<CR>")
nmap("<leader>vz", ":VimuxZoomRunner<CR>")

-- Vim Buffer Navigation
nmap("<silent> <leader>wh", "TmuxNavigateLeft <CR>")
nmap("<silent> <leader>wj", "TmuxNavigateDown <CR>")
nmap("<silent> <leader>wk", "TmuxNavigateUp <CR>")
nmap("<silent> <leader>wl", "TmuxNavigateRight <CR>")

-- fzf Config
vim.cmd[[let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }]]

-- Vim Table - ReSt Support
vim.cmd[[let g:table_mode_corner_corner='+']]
vim.cmd[[let g:table_mode_header_fillchar='=']]

-- File Finder Commands
nmap("<leader>fff", ":Files")
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- airline themes
vim.cmd[[let g:airline_powerline_fonts=1]]
vim.cmd[[let g:airline_theme='deus']]

-- Global Settings
--opt("g", "python_highlight_all", 1)
--opt("g", "python_version_2", 0)
--opt("b", "python_version_2", 0)

-- nvim Configuration
vim.opt.visualbell = true

opt("o", "termguicolors", true)
opt("o", "ttimeoutlen", 5)
vim.cmd([[filetype plugin indent on]])
vim.cmd([[set noea "set equalalways]])
vim.cmd([[set backspace=indent,eol,start]])
vim.cmd([[set updatetime=1000]])
opt("o", "splitright", true)
opt("o", "foldmethod", "manual")
opt("o", "virtualedit", "all")
opt("o", "mouse", "a")
opt("w", "wrap", true)
opt("o", "ttyfast",  true)
opt("o", "modelines", 0)

-- Search settings
opt("o", "hlsearch", true)
opt("o", "incsearch", true)

local indent = 4
opt("b", "expandtab", true)
opt("b", "tabstop", indent)
opt("b", "softtabstop", indent)
opt("b", "shiftwidth", indent)

opt("w", "number", true)
opt("w", "relativenumber", true)
opt("b", "formatoptions", "crot")
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
vim.cmd([[highlight search ctermbg = green]])
--opt("o", "noshowmode", "true")

vim.cmd([[highlight search guibg = green]])
nmap("<F5>", ":set norelativenumber! <CR> :set nonumber! <CR>")

		--bold
		--underline
		--underlineline	double underline
		--undercurl	curly underline
		--underdot	dotted underline
		--underdash	dashed underline
		--strikethrough
		--reverse
		--inverse		same as reverse
		--italic
		--standout
		--nocombine	override attributes instead of combining them
		--NONE		no attributes used (used to reset it)

vim.cmd("set rtp+=~/dotfiles/myhelp/")
vim.cmd("set rtp+=~/.fzf/")
vim.cmd([[colorscheme terafox]])


require('nightfox').setup({
    options = {
        --Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false,    -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,   -- Non focused panes set to alternative background
        styles = {              -- Style to be applied to different syntax groups
            comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        },
        inverse = {             -- Inverse highlight for different types
            match_paren = true,
            visual = false,
            search = false,
        },
        modules = {             -- List of various plugins and additional options
        -- ...
        },
    }
})
-- LSP settings --
cfg = {}
-- Have to add lsp_signature since it sits in /opt
vim.cmd([[packadd! lsp_signature.nvim]])
require "lsp_signature".setup(cfg)
vim.opt_global.shortmess:remove("F")
vim.keymap.set("n", "<leader>mc", ":Telescope metals commands <CR>")

-- Vtags settings --
-- Can't get to work with out of bounds issue --
--vim.g.python3_host_prog="/share/snorlax/scratch/tyler.heaton/basalisc_p2/rambus-ddr4/Galois_ddr4_beh_phy_PN3258_1_03_03112022/.venv/bin/python"
--vim.cmd('source ~/.vtags-3.01/vtags_vim_api.vim')

-- Tagbar Setup --
vim.g.tagbar_ctags_bin="/home/users/tim/.local/mybin/ctags"

-- plugins --
require('treesitter')
require('vtags')
