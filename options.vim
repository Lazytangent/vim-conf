set history=500
set autoread

" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7

set textwidth=80
set formatoptions+=t

set wildmenu
set wildmode=longest,list
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set completeopt=noinsert,menuone,popup
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
set matchtime=2
set foldcolumn=1

set numberwidth=5
set number
set relativenumber
set clipboard=unnamedplus
set list
set listchars=tab:▸\ ,trail:▫
set mouse=a
set spell
set modeline

set foldenable
set foldlevelstart=10

set path+=**
set tags=./tags,tags;$HOME

" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
set encoding=utf8
set fileformats=unix,dos,mac

" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set tabstop=8
set shiftwidth=2
set softtabstop=2

set linebreak
set wrap

set autoindent

set spell

" open new split panes to right and below
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow
