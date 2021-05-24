augroup startup
  autocmd!
  autocmd FocusGained,BufEnter * checktime

  " start terminal in insert mode
  autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif | :set nospell
augroup END

augroup closeout
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

function! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
augroup python
  autocmd!
  autocmd FileType python syn keyword pythonDecorator True None False self

  autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
  autocmd BufNewFile,BufRead *.mako set ft=mako

  autocmd FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
  autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 expandtab autoindent shiftwidth=4 textwidth=79
augroup END

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
augroup javascript
  autocmd!
  autocmd FileType javascript call JavaScriptFold()
  autocmd FileType javascript setl fen
  autocmd FileType javascript setl nocindent

  function! JavaScriptFold()
      setl foldmethod=syntax
      setl foldlevelstart=1
      syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

      function! FoldText()
          return substitute(getline(v:foldstart), '{.*', '{...}', '')
      endfunction
      setl foldtext=FoldText()
  endfunction
augroup END

""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
augroup coffeescript
  autocmd!
  function! CoffeeScriptFold()
      setl foldmethod=indent
      setl foldlevelstart=1
  endfunction
  autocmd FileType coffee call CoffeeScriptFold()
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
  autocmd FileType gitcommit setlocal textwidth=72
augroup END

""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html

""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1
autocmd FileType markdown setl shiftwidth=4 softtabstop=4 expandtab

autocmd BufNewFile,BufRead /*.rasi setf css

autocmd FileType go setlocal shiftwidth=4 softtabstop=4
