" Leader Keys
let mapleader = ","
let maplocalleader = " "
noremap \ ,

nnoremap <localleader>wq :wq<cr>
nnoremap <localleader>fs :w<cr>

nnoremap <localleader>gw :Gw<cr>
nnoremap <localleader>gs :Git<cr>
nnoremap <localleader>gc :Git commit<cr>
nnoremap <localleader>gp :Git push<cr>

nnoremap <localleader>ao o<Esc>
nnoremap <localleader>aO O<Esc>

nnoremap <leader>nr :set relativenumber!<cr>
nnoremap <leader>nn :set number!<cr>

command! MakeTags !ctags -R .
nnoremap <localleader>ct :!ctags -R .<cr><cr>
nnoremap <localleader>cd :cd %:h<cr>

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
map <silent> <leader><cr> :nohlsearch<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Spell Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>ss : setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Misc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
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
