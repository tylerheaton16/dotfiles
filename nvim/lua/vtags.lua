-- Create vtags keybinds. This is pretty clanky compared to other plugins
local vtags_version = "https://www.vim.org/scripts/download_script.php?src_id=26794" -- 3.01
local vtags_3p10= "https://www.vim.org/scripts/download_script.php?src_id=27765" --3.10
local version = "3.01"
local dest = ".vtags-" .. version

-- Curl down vtags and install it in the home directory

local vtags_path = "$HOME/"..dest.."/vtags_vim_api.vim"

local vlog_group = vim.api.nvim_create_augroup("verilog_key_bindings", {})

function vlog_bind(cmd, augroup)
    vim.api.nvim_create_autocmd("Filetype", { 
        pattern = "*verilog_systemverilog*",
        command = cmd,
        group = augroup,
    })
end

vlog_bind('map <leader>a <Plug>VerilogEmacsAutoAdd :redraw! <CR>', vlog_group)
vlog_bind('map <leader><leader>a <Plug>VerilogEmacsAutoAdd', vlog_group)
vlog_bind('map <leader>d <Plug>VerilogEmacsAutoDelete :redraw! <CR>', vlog_group)
vlog_bind('map <leader><leader>d <Plug>VerilogEmacsAutoDelete', vlog_group)
vlog_bind('nnoremap <buffer> <leader>v : py3 try_show_frame() <CR> <C-w>h <CR> : set filetype=verilog_systemverilog <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader>i : py3 try_go_into_submodule() <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader>u : py3 try_go_upper_module() <CR> : py try_show_frame() <CR> : py try_print_module_trace() <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader>mt      : py3 try_print_module_trace()        <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader>ct      : py3 clear_trace()                   <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader><Left>  : py3 try_trace_signal_sources()      <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <leader><Right> : py3 try_trace_signal_destinations() <CR>', vlog_group)
vlog_bind('nnoremap <buffer> gi              : py3 try_go_into_submodule()           <CR>', vlog_group)
vlog_bind('nnoremap <buffer> gu              : py3 try_go_upper_module()             <CR>', vlog_group)
vlog_bind('nnoremap <buffer> mt              : py3 try_print_module_trace()          <CR>', vlog_group)
vlog_bind('nnoremap <buffer> ct              : py3 clear_trace()                     <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space><Down>   : py3 try_roll_back()                   <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space><Up>     : py3 try_go_forward()                  <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space>c        : py3 try_add_check_point()             <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space>b        : py3 try_add_base_module()             <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space>         : py3 try_space_operation()             <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space>s        : py3 try_save_env_snapshort()          <CR>', vlog_group)
vlog_bind('nnoremap <buffer> <Space>r        : py3 try_reload_env_snapshort()        <CR>', vlog_group)

vim.keymap.set("n", "<leader>vt", ":source "..vtags_path.." <CR>")
vim.cmd[[source $HOME/dotfiles/verilog_emacsauto.vim]]
