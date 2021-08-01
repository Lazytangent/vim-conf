" General
filetype plugin indent on
set history=500
set autoread

" Vim UI
set scrolloff=7

set wildmenu
set wildmode=longest:full,list:full
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set ruler
set cmdheight=1
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
set noshowmode
set number
set relativenumber
set clipboard=unnamed
set list
set listchars=tab:▸\ ,trail:▫
set mouse=a

" Colors and Fonts
syntax enable
set background=dark
set termguicolors
set encoding=utf8
set fileformats=unix,dos,mac
colorscheme murphy

" Files, backups and undo
set nobackup
set nowritebackup
set noswapfile

" Text, tab and indent related
set expandtab
set smarttab
set shiftwidth=2
set tabstop=8
set softtabstop=2

set linebreak
set textwidth=80
set wrap
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set autoindent
set smartindent

set spell

set splitright
set splitbelow

" Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
