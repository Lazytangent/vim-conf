set runtimepath+=~/.vim_conf

source ~/.vim_conf/vimrcs/basic.vim
source ~/.vim_conf/vimrcs/autocmds.vim
source ~/.vim_conf/vimrcs/mappings.vim
source ~/.vim_conf/vimrcs/filetypes.vim
source ~/.vim_conf/vimrcs/plugins_config.vim
source ~/.vim_conf/vimrcs/extended.vim

try
  source ~/.vim_conf/my_configs.vim
catch
endtry
