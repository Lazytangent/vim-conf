set runtimepath+=~/.vim_conf
runtime! **/mappings.vim
runtime! **/options.vim
runtime! **/autocmds.vim

filetype plugin indent on
syntax enable

try
    set undodir=~/.vim_conf/temp_dirs/undodir
    set undofile
catch
endtry
