let mapleader = ","
let maplocalleader = " "
noremap \ ,

nnoremap <leader>w :w<cr>
nnoremap <localleader>wq :wq<cr>
nnoremap <localleader>fs :w<cr>
nnoremap <leader>gw :Gw<cr>
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gp :Git push<cr>

nnoremap <localleader>ao o<Esc>
nnoremap <localleader>aO O<Esc>

nmap j gj
nmap k gk

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

" Visual Mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Moving around, tabs, windows, and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map      <silent> <leader><cr> :noh<cr>

map      <leader>bd :Bclose<cr>:tabclose<cr>gT
map      <leader>ba :bufdo bd<cr>
map      <leader>l  :bnext<cr>
map      <leader>h  :bprevious<cr>

map      <leader>tn :tabnew<cr>
map      <leader>to :tabonly<cr>
map      <leader>tc :tabclose<cr>
map      <leader>tm :tabmove<cr>
map      <leader>tt :tabonly<cr>

map      <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map      <leader>cd :cd %:p:h<cr>:pwd<cr>

" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map     <leader>ss : setlocal spell!<cr>
map     <leader>sn ]s
map     <leader>sp [s
map     <leader>sa zg
map     <leader>s? z=

" Misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>m  mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map     <leader>q  :e ~/buffer<cr>
map     <leader>x  :e ~/buffer.md<cr>
map     <leader>pp :setlocal paste!<cr>

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" turn terminal to normal mode with escape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

" NERDTree
map      <leader>nn :NERDTreeToggle<cr>
map      <leader>nb :NERDTreeFromBookmark<Space>
map      <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeFocus<cr>

" Vim-Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>py :Prettier<cr>

" Vim-TailwindCSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>

" Vim-Ale Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>aF :ALEFix<cr>
nnoremap <leader>aI :ALEInfo<cr>
