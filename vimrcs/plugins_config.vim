" Disable ALE's LSP to use CoC
let g:ale_disable_lsp = 1

" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin("~/.nvim/plugged")
  " Plugin Section
  " Themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'

  " Languages/Syntax
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html', 'python']
    \ }
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'
  Plug 'mattn/emmet-vim'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'plasticboy/vim-markdown'
  Plug 'mrdotb/vim-tailwindcss'
  Plug 'nvie/vim-flake8'
  Plug 'jmcantrell/vim-virtualenv'

  " General Use
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'terryma/vim-smooth-scroll'

call plug#end()

" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1
let g:NERDTreeeMinimalUI = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERGTreeStatusLink = ''

" Automatically close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeFocus<cr>

" Vim-Prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>py :Prettier<cr>

" Vim-Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [ 'html', 'python', 'css',
      \ 'javascript', 'js=javascript', 'json=javascript',
      \ 'sass' ]

" Vim-TailwindCSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>tt :set completefunc=tailwind#complete<cr>

" Vim-Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'python': ['autopep8', 'yapf'],
      \}

" Vim-CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-emmet', 'coc-css',
      \ 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver',
      \ 'coc-git', 'coc-pyright', 'coc-sql',
      \ 'coc-sh', 'coc-yank', 'coc-vimlsp', 'coc-jedi',
      \ 'coc-clangd', 'coc-go', 'coc-yaml', 'coc-toml',
      \ 'coc-texlab', 'coc-tailwindcss']

" Vim-Ale Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>aF :ALEFix<cr>
nnoremap <leader>aI :ALEInfo<cr>

" Vim-Smooth-Scroll
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 5, 2)<cr>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 5, 2)<cr>
nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 5, 4)<cr>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 5, 4)<cr>

" Vim and Git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gst<cr>

" Porting in zshrc aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * let &shell='/bin/zsh -i'
