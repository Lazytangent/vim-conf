augroup python
  autocmd!
  autocmd FileType python syn keyword pythonDecorator True None False self

  autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
  autocmd BufNewFile,BufRead *.mako set ft=mako

  autocmd FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
  autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 expandtab autoindent shiftwidth=4 textwidth=79
augroup END
