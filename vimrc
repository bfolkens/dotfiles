if (has("termguicolors"))
  set termguicolors
else
  set t_Co=256
endif

syntax on

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
set shortmess+=c
set shortmess-=F
set undodir=~/.vim/undodir " config global undo
set undofile        " unset session undo

set completeopt=menu,menuone,noselect

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
nmap <Leader>a :Ack!<Space>
nnoremap <Leader>d :Vista<CR>

" Tab and shift-Tab to change buffer
"nnoremap <silent><tab>    :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"noremap <silent><s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
"nnoremap <silent><tab>   :b#<CR>

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

" git-gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" window nav maps
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" snippets
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
" if has('conceal')
"   set conceallevel=1 concealcursor=n
" endif

" Plugins

call plug#begin()
Plug 'roxma/nvim-yarp'
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
Plug 'edkolev/tmuxline.vim'
Plug 'janko-m/vim-test'
Plug 'srstevenson/vim-picker'
Plug 'sbdchd/neoformat'
Plug 'junegunn/goyo.vim'
Plug 'xi/limelight.vim' " until merged into junegunn/limelight.vim - PR #57
Plug 'liuchengxu/vim-which-key'

" Completion
Plug 'natebosch/vim-lsc' " https://bluz71.github.io/2019/10/16/lsp-in-vim-with-the-lsc-plugin.html
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'

Plug 'liuchengxu/vista.vim'

Plug 'sheerun/vim-polyglot'
Plug 'ledger/vim-ledger'
Plug 'rcaputo/vim-ledger_x'
" Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'c-brenn/phoenix.vim'

Plug 'kana/vim-textobj-user'
Plug 'gaving/vim-textobj-argument'
Plug 'andyl/vim-textobj-elixir'
Plug 'rhysd/vim-textobj-ruby'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'

call plug#end()

" vim-picker
let g:picker_height = 16
let g:picker_custom_find_executable = 'fd'
let g:picker_custom_find_flags = '--color never'

" vim-polyglot
let g:polyglot_disabled = ['tex', 'ex', 'exs', 'eex', 'leex']

" theme configs
let g:palenight_terminal_italics = 1
" let g:gruvbox_italic=1

" lightline
let g:lightline = {
  \ 'component': {
  \   'lineinfo': '%3l:%-2v'
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'vista': 'NearestMethodOrFunction'
  \ },
  \ 'active': {
  \   'left': [['mode'], ['readonly', 'relativepath', 'modified', 'gitbranch'], ['vista']],
  \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype' ]]
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

let g:lightline['colorscheme'] = 'palenight'

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
if has('nvim')
  let test#strategy = "neovim"
  let test#elixir#exunit#executable = "MIX_ENV=test mix test"

  " by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  tnoremap <C-o> <C-\><C-n>
end

" Goyo/Limelight integration
augroup Goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" Limelight configuration
let g:limelight_priority = -1

" neoformat
if has('nvim')
  augroup Neofmt
    autocmd!
    autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  augroup END

  " let g:neoformat_verbose = 1
  let g:neoformat_only_msg_on_error = 1
end

" neomake
" if has('Neomake')
"   call neomake#configure#automake('w')
" end

" let g:neomake_javascript_enabled_makers = ['eslint_d']

" Use ripgrep or ag with Ack.vim instead
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vimtex
let g:vimtex_compiler_progname = 'nvr'

" vim-latex-live-preview
augroup LaTeXPreview
  autocmd Filetype tex setl updatetime=1
  let g:livepreview_previewer = 'open -ag Preview'
augroup END

" neosnippet
" let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets'
" let g:neosnippet#enable_snipmate_compatibility = 1

" ncm2
augroup Ncm2
  autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END

" vista
augroup Vista
  let g:vista#renderer#enable_icon = 1
  let g:vista_sidebar_width = 50

  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction

  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END

" LSC
let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'GoToDefinitionSplit': ['gd', 'sv'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}

let g:lsc_server_commands = {
 \  'bash': {
 \    'command': '/usr/local/bin/bash-language-server'
 \  },
 \  'elm': {
 \    'command': '/usr/local/bin/elm-language-server'
 \  },
 \  'ruby': {
 \    'command': '~/.rbenv/shims/solargraph stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'javascript': {
 \    'command': '/usr/local/bin/javascript-typescript-stdio'
 \  },
 \  'elixir': {
 \    'command': '/usr/local/src/elixir-ls/rel/language_server.sh'
 \  },
 \  'python': {
 \    'command': '/usr/local/bin/pyls'
 \  },
 \  'rust': {
 \    'command': '~/.cargo/bin/rustup run stable rls'
 \  },
 \  'latex': {
 \    'command': 'texlab'
 \  }
 \}

let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:true
let g:lsc_trace_level          = 'off'

" echodoc
" set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'

" yarp
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" color schemes
set background=dark
colorscheme palenight
" colorscheme solarized
" colorscheme gruvbox
