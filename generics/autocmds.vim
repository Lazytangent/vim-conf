augroup Time
  autocmd!
  autocmd FocusGained,BufEnter * checktime
augroup END

augroup Closeout
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup terminal
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif | :set nospell
augroup END
