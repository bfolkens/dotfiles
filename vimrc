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
set spelllang=en
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
set completeopt=menu,menuone,noselect

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
let g:polyglot_disabled = ['tex', 'rust', 'html', 'css', 'bash', 'json', 'html', 'java', 'javascript', 'typescript', 'lua', 'go', 'python', 'markdown', 'elm', 'yaml', 'julia']

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
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'janko-m/vim-test'
Plug 'srstevenson/vim-picker'
Plug 'sbdchd/neoformat'

Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Plug 'nvim-treesitter/completion-treesitter'

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-lua/lsp-status.nvim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'

Plug 'liuchengxu/vista.vim'

Plug 'sheerun/vim-polyglot'
Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'ledger/vim-ledger'
Plug 'rcaputo/vim-ledger_x'
" Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'slashmili/alchemist.vim'
" Plug 'elixir-editors/vim-elixir'
" Plug 'c-brenn/phoenix.vim'

Plug 'kana/vim-textobj-user'
Plug 'gaving/vim-textobj-argument'
Plug 'andyl/vim-textobj-elixir'
" Plug 'rhysd/vim-textobj-ruby'

Plug 'rizzatti/dash.vim'

" Themes
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'kyazdani42/blue-moon'
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
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Format on save
    -- vim.api.nvim_exec([[
    --   augroup lsp_document_autoformat
    --     autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)
    --   augroup END
    -- ]], false)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      :hi LspReferenceRead cterm=bold ctermbg=red guibg=#3d435c
      :hi LspReferenceText cterm=bold ctermbg=red guibg=#3d435c
      :hi LspReferenceWrite cterm=bold ctermbg=red guibg=#3d435c
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

end

lsp_status.register_progress()

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'
nvim_lsp.bashls.setup{
  on_attach = on_attach,
  cmd = { "bash-language-server", "start" }
}
nvim_lsp.clangd.setup({
  on_attach = on_attach,
  root_dir = util.root_pattern("build/compile_commands.json", "build/compile_flags.txt", ".git") or dirname,
  capabilities = lsp_status.capabilities,
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd" }
})
nvim_lsp.cmake.setup{
  on_attach = on_attach,
  cmd = { "cmake-language-server" }
}
nvim_lsp.cssls.setup{
  on_attach = on_attach,
  cmd = { "css-languageserver", "--stdio" },
  capabilities = capabilities,
}
nvim_lsp.html.setup{
  on_attach = on_attach,
  cmd = { "html-languageserver", "--stdio" },
  capabilities = capabilities,
}
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
  cmd = { "docker-langserver", "--stdio" }
}
nvim_lsp.elixirls.setup{
  on_attach = on_attach,
  cmd = { "/usr/local/elixir-ls/language_server.sh" }
}
-- nvim_lsp.elmls.setup{
--   on_attach = on_attach
-- }
-- nvim_lsp.julials.setup{
--  on_attach = on_attach
-- }
nvim_lsp.jsonls.setup{
  on_attach = on_attach,
  cmd = { "vscode-json-languageserver", "--stdio" }
}
nvim_lsp.pylsp.setup{
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
  on_attach = on_attach,
  cmd = { "texlab" }
}
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  cmd = { "vim-language-server", "--stdio" }
}
nvim_lsp.yamlls.setup{
  on_attach = on_attach,
  cmd = { "yaml-language-server", "--stdio" }
}
EOF

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    -- virtual_text = false,
    virtual_text = {
      spacing = 4,
      prefix = '',
    },
    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false
  }
)

-- vim.lsp.set_log_level("trace")
EOF

augroup NvimLspAutoFormatters
  " autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_sync(nil, 5000)
  " autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 5000)
  " autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 5000)
  " autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 5000)
augroup END

" nvim-cmp
lua <<EOF
require'cmp'.setup({
  sources = {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp' }
  },
})
EOF

" highlight! LspDiagnosticsUnderline gui=undercurl term=undercurl cterm=undercurl
highlight! LspDiagnosticsUnderlineHint guifg=#53FFE2
highlight! LspDiagnosticsUnderlineInformation guifg=#FF53E6
highlight! LspDiagnosticsUnderlineWarning guifg=#FF8C4B
highlight! LspDiagnosticsUnderlineError guifg=#FF5370

highlight! LspDiagnosticsDefaultHint guifg=#53FFE2
highlight! LspDiagnosticsDefaultInformation guifg=#FF53E6
highlight! LspDiagnosticsDefaultWarning guifg=#FF8C4B
highlight! LspDiagnosticsDefaultError guifg=#FF5370

" call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsDefaultError"})
" call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsDefaultWarning"})
" call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsDefaultInformation"})
" call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsDefaultHint"})

" lightline
let g:lightline = {
  \ 'component': {
  \   'lineinfo': '%3l:%-2v'
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive',
  \   'vista': 'NearestMethodOrFunction',
  \   'lsp_status': 'LspStatus'
  \ },
  \ 'active': {
  \   'left': [['mode'], ['readonly', 'fugitive', 'relativepath', 'modified'], ['lsp_status']],
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

" yarp
let g:python_host_prog = '~/.asdf/shims/python'
let g:python3_host_prog = '~/.asdf/shims/python'

" TextYankPost
if exists("##TextYankPost")
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require 'vim.highlight'.on_yank {higroup='Substitute', timeout=100, on_visual=false}
  augroup END
endif
