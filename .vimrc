" Configure runtime settings
set runtimepath+=~/.vim_conf
runtime! **/mappings.vim
runtime! **/options.vim
runtime! **/autocmds.vim

" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable

" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_conf/temp_dirs/undodir
    set undofile
catch
endtry
