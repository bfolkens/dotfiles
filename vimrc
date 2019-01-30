if !has('gui_running')
  set t_Co=256
endif

syntax on

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set showtabline=2
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
set nobackup
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set hidden          " allows buffers to be hidden
set wildmenu
set wildmode=longest,list   " get bash-like tab completions
set wildignore=*/.git/*,.data/*,*/tmp/*,*/node_modules/*,_build/*,dist/*,deps/*,priv/static/*,*.pyc,*.so,*.a,*.o,*.swp
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins
set history=1000    " keep 1000 lines of command line history
set showcmd         " display incomplete commands
set title           " show title in console title bar
set ttyfast         " smoother changes
set scrolloff=3     " keep 3 lines when scrolling
set laststatus=2    " allways show status line
set noshowmode      " modeline not necessary with lightline
"set synmaxcol=132

let mapleader = ","

" Keymaps

nnoremap <leader>c ddO
nnoremap <leader>d :TagbarToggle<CR>

" Stop highlighting on Enter
nnoremap <esc> :noh<CR>

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>y :History<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>a :Ag<Space>

map <C-n> :NERDTreeToggle<CR>

map <C-l> <C-w><C-l>
map <C-h> <C-w><C-h>

" Plugins

call plug#begin()
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
"Plug 'janko-m/vim-test'
"Plug 'w0rp/ale'
"Plug 'maximbaz/lightline-ale'

" Themes
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()

" color schemes
set background=dark
colorscheme palenight

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_buffers_jump=1

" Palenight
let g:palenight_terminal_italics = 1
let g:lightline = {
  \ 'component': {
  \   'lineinfo': '%3l:%-2v',
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \   'gutentags': '%{gutentags#statusline("[","]")}'
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive'
  \ },
  \ 'active': {
  \   'left': [['mode'], ['readonly', 'filename', 'modified'], ['tagbar', 'gutentags']]
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'colorscheme' : 'palenight'
  \ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" gutentags
let g:gutentags_ctags_exclude_wildignore=1

" gutentags+lightline
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" deoplete
let g:deoplete#enable_at_startup = 1

" NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use ag with Ack.vim instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
