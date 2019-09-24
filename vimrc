if (has("termguicolors"))
  set termguicolors
else
  set t_Co=256
endif

syntax on

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
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
set inccommand=split
set wildmenu
set wildmode=longest,list   " get bash-like tab completions
"Set via ~/.agignore
"set wildignore=*/.git/*,.data/*,*/tmp/*,*/node_modules/*,_build/*,dist/*,deps/*,priv/static/*,*.pyc,*.so,*.a,*.o,*.swp
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
set signcolumn=yes  " keep the gutter open so it doesn't jar the screen

set undodir=~/.vim/undodir " config global undo
set undofile        " unset session undo

if has('folding')
  set foldmethod=syntax
  set foldlevelstart=4

  if has('windows')
    set fillchars+=fold:· " Middle dot (U+00B7, UTF-8: C2 B7)
    " Current theme sets these, so ignore for nwo
    " set fillchars=vert:┃ " Box drawings heavy vertical (U+2503, UTF-8: E2 94 83)
    " hi VertSplit ctermbg=NONE guibg=#FF5C8F
  endif
endif

let mapleader = ";"

" Keymaps

nnoremap <leader>c ddO
nnoremap <leader>d :TagbarToggle<CR>
nmap <Leader>a :Ack!<Space>

" Tab and shift-Tab to change buffer
"nnoremap <silent><tab>    :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"noremap <silent><s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" nnoremap <silent><tab>   :b#<CR>

" Stop highlighting on Enter
nnoremap <esc> :noh<CR>

" vim-picker shortcuts
nmap <leader>b <Plug>(PickerBuffer)
nmap <leader>f <Plug>(PickerEdit)
nmap <leader>s <Plug>(PickerSplit)
nmap <leader>v <Plug>(PickerVsplit)
nmap <leader>] <Plug>(PickerTag)
nmap <leader>h <Plug>(PickerHelp)

map <C-n> :NERDTreeToggle<CR>

" vim-test maps
nmap <Leader>tt :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ta :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tg :TestVisit<CR>

" window nav maps
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" Plugins

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'gaving/vim-textobj-argument'
"Plug 'w0rp/ale'
"Plug 'maximbaz/lightline-ale'
Plug 'srstevenson/vim-picker'
" Plug 'sbdchd/neoformat'

" Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/echodoc.vim'

Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'

Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'c-brenn/phoenix.vim'

Plug 'kana/vim-textobj-user'
Plug 'andyl/vim-textobj-elixir'
Plug 'rhysd/vim-textobj-ruby'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'

call plug#end()

" color schemes
set background=dark
colorscheme palenight
" colorscheme solarized
" colorscheme gruvbox

" vim-picker
let g:picker_height = 16
let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '--color never --files'

" vim-polyglot
let g:polyglot_disabled = ['tex', 'ex', 'exs', 'eex', 'leex']

" theme configs
let g:palenight_terminal_italics = 1
" let g:gruvbox_italic=1

" lightline
let g:lightline = {
  \ 'component': {
  \   'lineinfo': '%3l:%-2v',
  \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive'
  \ },
  \ 'active': {
  \   'left': [['mode'], ['readonly', 'relativepath', 'modified', 'gitbranch'], ['tagbar']],
  \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype' ]]
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

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" vim-test
if has("nvim")
  let test#strategy = "neovim"

  let test#elixir#exunit#executable = "MIX_ENV=test mix test"

  " by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  tnoremap <C-o> <C-\><C-n>
end

" neoformat
if has("Neoformat")
  augroup fmt
    autocmd!
    autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END
end

" NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use ripgrep or ag with Ack.vim instead
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" deoplete
let g:deoplete#enable_at_startup = 1

" neosnippet
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets'
" let g:neosnippet#enable_snipmate_compatibility = 1

" LanguageClient-neovim
if has("LanguageClient_serverCommands")
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'elixir': ['/usr/local/src/elixir-ls/rel/language_server.sh'],
        \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
        \ 'python': ['/usr/local/bin/pyls']
        \ }

  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  " nnoremap <F5> :call LanguageClient_contextMenu()<CR>
end

if exists('g:loaded_echodoc')
  let g:echodoc#enable_at_startup = 1
  let g:echodoc#type = 'signature'
endif
