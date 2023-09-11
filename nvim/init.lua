-- Neovim Configurations
--
--
--local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
--if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--      vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
--      vim.api.nvim_command("packadd packer.nvim")
--end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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
--set_ft(buf, ft_vlog, "verilog_systemverilog.verilog.systemverilog", [[softtabstop=4 shiftwidth=4 textwidth=80]])
set_ft(buf, ft_vlog, "verilog_systemverilog", [[tabstop=2 softtabstop=2 shiftwidth=2 textwidth=80]])
--set_ft({"FileType"}, {"verilog_systemverilog"}, nil, [[setlocal foldmethod=manual]])

-- Vim-Fugitive + vimbinds
nmap("<leader>g",  ":Git")
nmap("<leader>gl", ":Git log <CR>")
nmap("<leader>gp", ":Git log -p % <CR>")
nmap("<leader>gd", ":Gvdiffsplit!")
nmap("<leader>gD", ":Git diff master % <CR>")
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
nmap("<leader>fe", "<cmd>Telescope env<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nmap("<leader>gr", "<cmd>Telescope advanced_git_search checkout_reflog<cr>")
nmap("<leader>gf", "<cmd>Telescope advanced_git_search diff_commit_file<cr>")
nmap("<leader>gc", "<cmd>Telescope advanced_git_search diff_commit_line<cr>")

-- airline themes
vim.cmd[[let g:airline_powerline_fonts=1]]
vim.cmd[[let g:airline_theme='deus']]

--vim-diagon settings
--vim.cmd[[let g:diagon_use_echo=1]]

-- Global Settings
--opt("g", "python_highlight_all", 1)
--opt("g", "python_version_2", 0)
--opt("b", "python_version_2", 0)

-- nvim Configuration
vim.opt.visualbell = true
-- need cmdheight = 1 or searching makes me hit enter all the time
vim.opt.cmdheight = 1

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
vim.cmd("set rtp+=~/.fzf")

--nightfox colorschemes
--vim.cmd([[colorscheme nightfox]])

-- file not edited by Vim  updates on own
vim.cmd([[set autoread]])
vim.cmd([[au CursorHold * checktime]])
vim.cmd([[au FocusGained,BufEnter * :checktime]])
-- fugitive-gitlab
--vim.g.fugitive_gitlab_domains = {'https://gitlab-ext.galois.com', 'https://gitlab-ext'}
--vim.g.gitlab_api_keys = {['gitlab-ext.galois.com'] = 'FugitiveToken'}

-- Must happen after colorscheme or gets overridden
vim.opt.list = true
vim.opt.listchars = {
    -- Place a '#' in the last column when 'wrap' is off and the line continues beyond the right of the screen
    extends = "#",
    -- Place a '#' in the first column when 'wrap' is off and there is text preceding the character visible in the
    -- first column
    precedes = "#",
    -- Show non-breaking space characters
    nbsp = "¬",
    -- Show tabs
    tab = ".→",
    -- Show trailing spaces
    trail = "◊",
}

-- LSP settings --
cfg = {}
-- Have to add lsp_signature since it sits in /opt
--vim.cmd([[packadd! lsp_signature.nvim]])
--require "lsp_signature".setup(cfg)
vim.opt_global.shortmess:remove("F")
vim.keymap.set("n", "<leader>mc", ":Telescope metals commands <CR>")

-- Vtags settings --
-- Can't get to work with out of bounds issue --
--vim.g.python3_host_prog="/share/snorlax/scratch/tyler.heaton/basalisc_p2/rambus-ddr4/Galois_ddr4_beh_phy_PN3258_1_03_03112022/.venv/bin/python"
--vim.cmd('source ~/.vtags-3.01/vtags_vim_api.vim')

-- Tagbar Setup --
vim.g.tagbar_ctags_bin="/home/users/tim/.local/mybin/ctags"
vim.g['lightline'] = {
	colorscheme = 'PaperColor'
}
require("lazy").setup({
    spec = {
        { import = "plugins"},
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "matchit",
                "matchparen",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "rrhelper",
                "spellfile_plugin",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        },
    },
})
-- plugins --
require('config.vtags')
--vim.cmd[[autocmd BufReadPost * lua require('config.vtags')]]
