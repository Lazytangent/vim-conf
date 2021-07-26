set runtimepath+=~/.vim_conf

" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500
filetype plugin indent on
set autoread
autocmd FocusGained,BufEnter * checktime

" Leader setup
let mapleader = ","
let maplocalleader = " "
noremap \ ,

" Quick Save Commands
nnoremap <leader>w :w<cr>
nnoremap <localleader>wq :wq<cr>
cnoremap Q q!
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" More things
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Line numbering shortcuts
nnoremap <leader>rnu :set rnu!<cr>
nnoremap <leader>nnu :set nu!<cr>

" Reload vimrc
nnoremap <localleader>rc :source ~/.vimrc<cr>

" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
let $LANG='en'

set wildmenu
set wildmode=longest:full,list:full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set showcmd
set cmdheight=1
set ruler
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1

set number
set numberwidth=5
set relativenumber
set clipboard=unnamed
set list
set listchars=tab:▸\ ,trail:▫
set mouse=a
set spell
set cursorline
set modeline

set foldenable
set foldlevelstart=10
nnoremap <leader>fu zM<cr>
nnoremap <leader>uf zR<cr>

set path+=**
nnoremap <localleader>ct :!ctags -R .<cr><cr>
command! MakeTags !ctags -R .
set tags=./tags,tags;$HOME

nnoremap <localleader>cd :cd %:h<cr>

nmap j gj
nmap k gk

map Q gq

" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
set termguicolors
set encoding=utf8
set ffs=unix,dos,mac

" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=2
set tabstop=8
set softtabstop=2

set linebreak
set wrap

set autoindent

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Visual Mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Moving around, tabs, windows, and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader><cr> :noh<cr>

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabonly<cr>

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss : setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set spell

" Misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>q :e ~/buffer<cr>
map <leader>x :e ~/buffer.md<cr>
map <leader>pp :setlocal paste!<cr>

nnoremap <C-k> :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<cr>``
nnoremap <C-j> :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<cr>``

vnoremap <C-k> :<C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv
vnoremap <C-j> :<C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv

" Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" Auto Pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap {<cr> {<cr>}<Esc>O
inoremap {;<cr> {<cr>};<Esc>O

" open new split panes to right and below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

" turn terminal to normal mode with escape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif | :set nospell

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
" set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cnoremap $h e ~/
cnoremap $d e ~/Desktop/
cnoremap $j e ./
cnoremap $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cnoremap $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

autocmd vimenter * let &shell='/bin/zsh -i'

set textwidth=80
set formatoptions+=t
