if has("termguicolors")
  set termguicolors
else
  set t_Co=256
endif

set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8
set ruler
" set spell
set spelllang=en
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set hidden                  " allows buffers to be hidden
set wildmenu
set wildmode=longest,list   " get bash-like tab completions
set history=1000            " keep 1000 lines of command line history
set showcmd                 " display incomplete commands
set title                   " show title in console title bar
set ttyfast                 " smoother changes
set scrolloff=3             " keep 3 lines when scrolling
set undodir=~/.vim/undodir  " config global undo
set undofile                " unset session undo

filetype on                 " Enable filetype detection
filetype plugin indent on   " Enable filetype-specific indenting and plugins

syntax on
" https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
" https://medium.com/@dhendyferdian/claiming-back-my-neovim-responsiveness-2d5c3b3cdeea
" set lazyredraw
" set synmaxcol=128
syntax sync minlines=256

let mapleader = ";"

" window nav maps
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" Use ripgrep if it exists
if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
