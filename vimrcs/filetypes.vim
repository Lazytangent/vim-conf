" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
autocmd FileType python syn keyword pythonDecorator True None False self

autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
autocmd BufNewFile,BufRead *.mako set ft=mako

autocmd FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 expandtab autoindent shiftwidth=4 textwidth=79


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
autocmd FileType coffee call CoffeeScriptFold()

autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit setlocal textwidth=72


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
" set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


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
