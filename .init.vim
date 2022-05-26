""------------------------------------------------------------------------------"
""                             Plug Configuration                               "
""------------------------------------------------------------------------------"
set nocompatible
"filetype off " required

lua require('init')


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/tarikgraba/vim-lefdef.git'
Plug 'junegunn/fzf.vim'
Plug 'noah/vim256-color'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/verilog_emacsauto.vim'
"Plug 'junegunn/vim-easy-align'
Plug 'benmills/vimux' "From vim can open tmux terminals
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
"Plug 'thinca/vim-localrc'
Plug 'camspiers/lens.vim'
"Plug 'camspiers/animate.vim'
Plug 'lervag/vimtex'
"Plug 'ycm-core/YouCompleteMe'
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-syntax-extra' " c highlighting
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/tcl.vim--smithfield'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
"Plug 'aserebryakov/vim-todo-lists'
"Plug 'tagexplorer.vim'
"Plug 'liuchengxu/vista.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'dhruvasagar/vim-table-mode'
call plug#end()
"""""""""""""""""""""""""""""""""""""
set updatetime=1000
let g:python_highlight_all = 1
let g:python_version_2 = 0
let b:python_version_2 = 0

set rtp+=~/dotfiles/myhelp/
syntax on
filetype plugin indent on
set foldmethod=manual
set virtualedit=all
set mouse=a
set noea "set equalalways
set modelines =0
set wrap
set backspace=indent,eol,start
set ttyfast
set matchpairs+=<:>
set hlsearch
set incsearch
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number relativenumber
set formatoptions=crot
set t_Co=256
set clipboard=unnamed
set encoding=utf-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
highlight search ctermbg = green

"------------------------------------------------------------------------------"
"                                Keybind Changes                               "
"------------------------------------------------------------------------------"
let mapleader ="\<Space>" " Change spacebar to leader key
let maplocalleader ="\<Space>"
nnoremap <leader>q :qa! <CR>
nnoremap <leader>c :q   <CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
"nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

"------------------------------------------------------------------------------"
"                              Load Vim Functions                              "
"------------------------------------------------------------------------------"
if filereadable(expand("$HOME/dotfiles/vim_functions.vim"))
    source $HOME/dotfiles/vim_functions.vim
endif

if filereadable(expand("$HOME/dotfiles/vim_binds.vim"))
    source $HOME/dotfiles/vim_binds.vim
endif

"------------------------------------------------------------------------------"
"                        Add fzf to rtp for all systems                        "
"------------------------------------------------------------------------------"
set rtp+=~/.fzf/

"------------------------------------------------------------------------------"
"                              Tab Movement in vim                             "
"------------------------------------------------------------------------------"
nnoremap tn :tabnew <CR>
nnoremap tc :tabclose <CR>
nnoremap tN :tab sball <CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"------------------------------------------------------------------------------"
"                             Window Control in vim                            "
"------------------------------------------------------------------------------"
nnoremap <silent> <leader>l :redraw! <CR>
nnoremap <silent> <leader>we :exe "vertical resize " . (winheight(0) * 17/4)<CR>
nnoremap <silent> <leader>wq :exe "vertical resize " . (winheight(0) * 12/16)<CR>
nnoremap <silent> <leader>ww <C-w>= <CR>
nnoremap <silent> <leader>w- :sp <CR>
nnoremap <silent> <leader>w/ :vsp <CR>

"------------------------------------------------------------------------------"
"                               Filetype Updates                               "
"------------------------------------------------------------------------------"
au BufRead,BufNewFile *.scs set filetype=spectre
au BufRead,BufNewFile *.il set filetype=skill
au BufRead,BufNewFile *.ils set filetype=skill
au BufRead,BufNewFile *.cdsinit set filetype=skill
au BufRead,BufNewFile *.cdsenv set filetype=skill
au BufRead,BufNewFile *.v,*.vg,*.sv set filetype=verilog_systemverilog.verilog
au BufRead,BufNewFile *.xdc set filetype=xdc
au BufRead,BufNewFile *.txt set filetype=notes
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.py set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=80
    \ autoindent
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"------------------------------------------------------------------------------"
"                                 Vim-Fugitive + vimbinds                      "
"------------------------------------------------------------------------------"
nnoremap <leader>g   :Git
nnoremap <leader>gl  :Git log <CR>
nnoremap <leader>gp  :Git log -p % <CR>
nnoremap <leader>gd  :Gvdiffsplit!
nnoremap <leader>gb  :Git blame
nnoremap <leader>gs  :Git status <CR>
nnoremap <leader>gw  :Gwrite <CR>
nnoremap <leader>g   :Git <CR>
nnoremap <leader>o   :only <CR>
" Note that Vim-Fugitive uses //2 and //3 for 3-way diff puts/gets
nnoremap <leader>gdh  :diffget //2 <CR>
nnoremap <leader>gdl  :diffget //3 <CR>


"------------------------------------------------------------------------------"
"                              tmux / vimux config                             "
"------------------------------------------------------------------------------"
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vz :VimuxZoomRunner<CR>

"------------------------------------------------------------------------------"
"                             Vim Buffer Naviation                             "
"------------------------------------------------------------------------------"
nnoremap <silent> <leader>wh :TmuxNavigateLeft <CR>
nnoremap <silent> <leader>wj :TmuxNavigateDown <CR>
nnoremap <silent> <leader>wk :TmuxNavigateUp <CR>
nnoremap <silent> <leader>wl :TmuxNavigateRight <CR>

"------------------------------------------------------------------------------"
"                                  Binary R/W                                  "
"------------------------------------------------------------------------------"
nmap <leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

"------------------------------------------------------------------------------"
"                                  fzf Config                                  "
"------------------------------------------------------------------------------"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"------------------------------------------------------------------------------"
"                              animate/lens Config                             "
"------------------------------------------------------------------------------"
"let g:lens#disabled_filetypes = ['vundle', 'qf', 'vista', '']
let g:lens#height_resize_max = (winheight(0)*8/10)
let g:lens#height_resize_min = (winheight(0)*8/10)
let g:lens#width_resize_max = (winwidth(0)*8/10)
let g:lens#width_resize_min = (winwidth(0)*8/10)

"------------------------------------------------------------------------------"
"                           Vim Table - ReSt Support                           "
"------------------------------------------------------------------------------"
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

""""""" superbar Configuration"""""""
let g:SuperTabDefaultCompletionType = 'context'

"""""""File Finder Commands"""""
nmap <leader>ff :Files
nmap <leader>tt :Tags <CR>
nmap <leader>bb :Buffers <CR>

"""""""EasyAlign File Finder"""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <leader>w; vip :EasyAlign /\ze\S\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>
nnoremap <leader>w' vip :EasyAlign /\ze\s\+\s*[,;=]/<CR> vip :Tabular /=<CR> vip :Tabular /;<CR>

"------------------------------------------------------------------------------"
"                              Latex Configuration                             "
"------------------------------------------------------------------------------"
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 2
let g:vimtex_view_general_viewer="zathura"
set conceallevel=0
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:vimtex_quickfix_ignore_filters = [
    \ 'Underfull',
    \ 'Overfull',
    \]

"------------------------------------------------------------------------------"
"                                vtags Keybinds                                "
"------------------------------------------------------------------------------"
if filereadable(expand("$HOME/.vtags-3.01/vtags_vim_api.vim"))
    source ~/.vtags-3.01/vtags_vim_api.vim
else
    echo "Vtags Not Installed: Re-Run Install"
endif

"------------------------------------------------------------------------------"
"                          Verilog Autos / Vtags Confiurations                 "
"------------------------------------------------------------------------------"
augroup verilogBindings
    autocmd! verilogBindings
    autocmd Filetype verilog_systemverilog map <buffer> <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>
    autocmd Filetype verilog_systemverilog map <buffer> <leader><leader>a <Plug>VerilogEmacsAutoAdd
    autocmd Filetype verilog_systemverilog map <buffer> <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>
    autocmd Filetype verilog_systemverilog map <buffer> <leader><leader>d <Plug>VerilogEmacsAutoDelete
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>v       : py3 try_show_frame()                <CR> <C-w>h <CR> : set filetype=verilog_systemverilog <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>i       : py3 try_go_into_submodule()         <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>u       : py3 try_go_upper_module()           <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>mt      : py3 try_print_module_trace()        <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader>ct      : py3 clear_trace()                   <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Left>  : py3 try_trace_signal_sources()      <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <leader><Right> : py3 try_trace_signal_destinations() <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gi              : py3 try_go_into_submodule()           <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  gu              : py3 try_go_upper_module()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  mt              : py3 try_print_module_trace()          <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  ct              : py3 clear_trace()                     <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Down>   : py3 try_roll_back()                   <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space><Up>     : py3 try_go_forward()                  <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>c        : py3 try_add_check_point()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>b        : py3 try_add_base_module()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>         : py3 try_space_operation()             <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>s        : py3 try_save_env_snapshort()          <CR>
    autocmd Filetype verilog_systemverilog nnoremap <buffer>  <Space>r        : py3 try_reload_env_snapshort()        <CR>
augroup end

"------------------------------------------------------------------------------"
"                             YCM/Gutentags Control                            "
"------------------------------------------------------------------------------"
let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'markdown': 1,
        \ 'netrw': 1,
        \ 'unite': 1,
        \ 'vimwiki': 1,
        \ 'pandoc': 1,
        \ 'infolog': 1,
        \ 'leaderf': 1,
        \ 'mail': 1
        \}

"set tags=./tags;,tags; "Use ctags -R --fields=+l
set tags^=.git/tags;
let g:gutentags_ctags_tagfile=".git/tags"
let g:gutentags_ctags_extra_args = [
      \ '--fields=l',
      \ ]

"------------------------------------------------------------------------------"
"                               Vista Tag Display                              "
"------------------------------------------------------------------------------"
let g:vista#renderer#enable_icon = 0
let g:vista_icon_indent= ['▸', '▾']
let g:vista_fold_toggle_icons= ['▸', '▾']

"------------------------------------------------------------------------------"
"                            Floaterm Configuration                            "
"------------------------------------------------------------------------------"
let g:floaterm_keymap_new = '<F1>'
let g:floaterm_keymap_prev = '<F2>'
let g:floaterm_keymap_next = '<F3>'
let g:floaterm_keymap_toggle = '<F4>'


"------------------------------------------------------------------------------"
"                                vim-fugitive                                  "
"------------------------------------------------------------------------------"
"sets up folding when doing a git log
autocmd FileType git setlocal foldmethod=syntax
"------------------------------------------------------------------------------"
"                                vim-todo-lists                                "
"------------------------------------------------------------------------------"
"Key Mappings
map("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

"--------------------------------------------------------------------"
let g:VimTodoListsDatesEnabled = 1
let g:VimTodoListsMoveItems = 0
set ambw=double
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='serene'
let g:airline_theme='deus'
set noshowmode
