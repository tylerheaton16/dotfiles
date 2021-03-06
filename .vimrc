""------------------------------------------------------------------------------"
""                             Plug Configuration                               "
""------------------------------------------------------------------------------"
set nocompatible
"filetype off " required

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/tarikgraba/vim-lefdef.git'
Plug 'junegunn/fzf.vim'
Plug 'noah/vim256-color'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'godlygeek/tabular'
"Plug 'vim-scripts/verilog_emacsauto.vim'
"Plug 'raingo/vim-matlab'
"Plug 'junegunn/vim-easy-align'
Plug 'benmills/vimux' "From vim can open tmux terminals
Plug 'christoomey/vim-tmux-navigator'
"Plug 'amal-khailtash/vim-xdc-syntax'
Plug 'psliwka/vim-smoothie'
"Plug 'thinca/vim-localrc'
Plug 'camspiers/lens.vim'
"Plug 'camspiers/animate.vim'
Plug 'cometsong/CommentFrame.vim'
Plug 'lervag/vimtex'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', { 'for': ['scala', 'sbt']}
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-syntax-extra' " c highlighting
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/tcl.vim--smithfield'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
"Plug 'aserebryakov/vim-todo-lists'
"Plug 'tagexplorer.vim'
"Plug 'dense-analysis/ale'
"Plug 'liuchengxu/vista.vim'
"Plug 'ludovicchabant/vim-gutentags'
call plug#end()
"""""""""""""""""""""""""""""""""""""
set updatetime=1000
let g:python_highlight_all = 1
let g:python_version_2 = 0
let b:python_version_2 = 0

set rtp+=~/dotfiles/myhelp/
colorscheme elda
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
au BufRead,BufNewFile *.v,*.vg set filetype=verilog_systemverilog
au BufRead,BufNewFile *.xdc set filetype=xdc
au BufRead,BufNewFile *.txt set filetype=notes
au BufRead,BufNewFile *.tex setlocal textwidth=80
au BufRead,BufNewFile *.py set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=80
    \ autoindent

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
"                               ale Configuration                              "
"------------------------------------------------------------------------------"
let g:ale_c_parse_makefile = 1
let g:ale_linters = {'c': ['gcc']}

"------------------------------------------------------------------------------"
"                              animate/lens Config                             "
"------------------------------------------------------------------------------"
"let g:lens#disabled_filetypes = ['vundle', 'qf', 'vista', '']
let g:lens#height_resize_max = (winheight(0)*8/10)
let g:lens#height_resize_min = (winheight(0)*8/10)
let g:lens#width_resize_max = (winwidth(0)*8/10)
let g:lens#width_resize_min = (winwidth(0)*8/10)

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
if ($USER == "tim.heaton")
    source ~/.vtags-3.01/vtags_vim_api.vim
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


"let g:ycm_language_server = [
"  \   { 'name': 'scala',
"  \     'filetypes': [ 'scala', 'sbt' ],
"  \     'cmdline': [ 'metals-vim' ],
"  \     'project_root_files': [ 'build.sbt' ]
"  \   },
"  \ ]

"------------------------------------------------------------------------------"
"                                vim-todo-lists                                "
"------------------------------------------------------------------------------"
let g:VimTodoListsDatesEnabled = 1
let g:VimTodoListsMoveItems = 0

"Adding in coc-nvim keybinds for METALS
" ~/.vimrc
" Configuration for coc.nvim

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

