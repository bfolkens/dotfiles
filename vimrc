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
" set spell
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
set signcolumn=yes  " keep the gutter open so it doesn't jar the screen
set undodir=~/.vim/undodir " config global undo
set undofile        " unset session undo

" Completion
set shortmess+=c
set shortmess-=F
set completeopt=menuone,noinsert,noselect

" Might speedup
" https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
" https://medium.com/@dhendyferdian/claiming-back-my-neovim-responsiveness-2d5c3b3cdeea
" set lazyredraw
" set synmaxcol=128
syntax sync minlines=256

if has('folding')
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" snippets
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
" if has('conceal')
"   set conceallevel=1 concealcursor=n
" endif

" vim-polyglot (needs to be before plug#begin)
let g:polyglot_disabled = ['tex', 'ex', 'exs', 'eex', 'leex', 'rust', 'html', 'css', 'bash', 'json', 'html', 'javascript', 'typescript', 'toml', 'lua', 'go', 'python', 'markdown', 'elm', 'yaml', 'julia']

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
Plug 'edkolev/tmuxline.vim'
Plug 'janko-m/vim-test'
Plug 'srstevenson/vim-picker'
Plug 'sbdchd/neoformat'
Plug 'junegunn/goyo.vim'
Plug 'xi/limelight.vim' " until merged into junegunn/limelight.vim - PR #57

Plug 'nvim-treesitter/nvim-treesitter'

" Completion
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
" Plug 'nvim-lua/completion-nvim'
" Plug 'Shougo/echodoc.vim'
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

" color schemes need to go before initializing plugins
set background=dark
colorscheme palenight
" colorscheme solarized
" colorscheme gruvbox

" vim-picker
let g:picker_height = 16
let g:picker_custom_find_executable = 'fd'
let g:picker_custom_find_flags = '--color never'

" theme configs
let g:palenight_terminal_italics = 1
" let g:gruvbox_italic=1

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
  " augroup Neofmt
  "   autocmd!
  "   autocmd BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
  " augroup END

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
augroup END
let g:livepreview_previewer = 'open -ag Preview'

" neosnippet
" let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets'
" let g:neosnippet#enable_snipmate_compatibility = 1

" nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = { enable = true },
    navigation = { enable = true },
  },
  textobjects = { enable = true },
}
EOF

" nvim-lsp
lua <<EOF
local diagnostic = require('diagnostic')
local completion = require('completion')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
  local opts = { noremap=true, silent=true }
  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
end

lsp_status.register_progress()
lsp_status.config({
  status_symbol = 'S',
  indicator_errors = '',
  indicator_warnings = '',
  indicator_info = '',
  indicator_hint = '',
  indicator_ok = 'K',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

local nvim_lsp = require('nvim_lsp')
nvim_lsp.bashls.setup{}
nvim_lsp.clangd.setup({
  callbacks = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.cmake.setup{
  on_attach = on_attach
}
nvim_lsp.cssls.setup{
  on_attach = on_attach
}
nvim_lsp.dockerls.setup{
  on_attach = on_attach
}
nvim_lsp.elixirls.setup{
  on_attach = on_attach
}
nvim_lsp.elmls.setup{
  on_attach = on_attach
}
nvim_lsp.julials.setup{
  on_attach = on_attach
}
nvim_lsp.jsonls.setup{
  on_attach = on_attach
}
nvim_lsp.pyls.setup{
  on_attach = on_attach
}
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.solargraph.setup{
  on_attach = on_attach
}
nvim_lsp.sourcekit.setup{
  on_attach = on_attach
}
nvim_lsp.texlab.setup{
  on_attach = on_attach
}
nvim_lsp.vimls.setup{
  on_attach = on_attach
}
nvim_lsp.yamlls.setup{
  on_attach = on_attach
}
EOF

" diagnostic-nvim
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_virtual_text_prefix = ' '

" highlight! LspDiagnosticsUnderline gui=undercurl term=undercurl cterm=undercurl
highlight! LspDiagnosticsUnderlineHint guifg=#53FFE2
highlight! LspDiagnosticsUnderlineInformation guifg=#FF53E6
highlight! LspDiagnosticsUnderlineWarning guifg=#FF8C4B
highlight! LspDiagnosticsUnderlineError guifg=#FF5370

highlight! LspDiagnosticsHint guifg=#53FFE2
highlight! LspDiagnosticsInformation guifg=#FF53E6
highlight! LspDiagnosticsWarning guifg=#FF8C4B
highlight! LspDiagnosticsError guifg=#FF5370

call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHint"})

" lightline
let g:lightline = {
  \ 'component': {
  \   'lineinfo': '%3l:%-2v'
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'vista': 'NearestMethodOrFunction',
  \   'lsp_status': 'LSPStatus'
  \ },
  \ 'active': {
  \   'left': [['mode'], ['readonly', 'fugitive', 'relativepath', 'modified'], ['lsp_status', 'vista']],
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

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" vista
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 50

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

augroup Vista
  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
augroup END

" echodoc
" set cmdheight=2
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'echo'

" yarp
let g:python_host_prog = '~/.asdf/shims/python'
let g:python3_host_prog = '~/.asdf/shims/python'
