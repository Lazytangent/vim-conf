" Leader setup
let mapleader = ","
let maplocalleader = " "
noremap \ ,

" Quick Save Commands
nnoremap <leader>w :w<cr>
nnoremap <localleader>wq :wq<cr>
nnoremap <localleader>fs :w<cr>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" More things
nnoremap <localleader>ao o<Esc>
nnoremap <localleader>aO O<Esc>

" Line numbering shortcuts
nnoremap <leader>rnu :set relativenumber!<cr>
nnoremap <leader>nnu :set number!<cr>

" Reload vimrc
nnoremap <localleader>rc :source ~/.vimrc<cr>

" Ctags
nnoremap <localleader>ct :!ctags -R .<cr><cr>

" Change directory
nnoremap <localleader>cd :cd %:h<cr>

" Move vertically by visual line
nmap j gj
nmap k gk

" Visual Mode related
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Moving around, tabs, windows, and buffers
map <silent> <leader><cr> :nohlsearch<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Spell Checking
map <leader>ss : setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Misc.
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

nnoremap <C-k> :<C-U>exec "exec 'norm m`' \| move -" . (1+v:count1)<cr>``
nnoremap <C-j> :<C-U>exec "exec 'norm m`' \| move +" . (0+v:count1)<cr>``

vnoremap <C-k> :<C-U>exec "'<,'>move '<-" . (1+v:count1)<cr>gv
vnoremap <C-j> :<C-U>exec "'<,'>move '>+" . (0+v:count1)<cr>gv

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" Auto Pairs
inoremap {<cr> {<cr>}<Esc>O
inoremap {;<cr> {<cr>};<Esc>O

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

command! MakeTags !ctags -R .
