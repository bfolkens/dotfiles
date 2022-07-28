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
set laststatus=3    " global statusline
" set winbar=%f nvim 0.8+
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
nmap <leader>t :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ta :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>tg :TestVisit<CR>

" window nav maps
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" vim-vsnip
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" vim-polyglot (needs to be before plug#begin)
let g:polyglot_disabled = ['tex', 'rust', 'html', 'css', 'bash', 'json', 'html', 'java', 'javascript', 'typescript', 'lua', 'go', 'python', 'markdown', 'elm', 'yaml', 'julia']

" Plugins

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'kylechui/nvim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mileszs/ack.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'ryanoasis/vim-devicons'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-test/vim-test'
Plug 'srstevenson/vim-picker'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

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
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'

Plug 'nvim-lua/lsp-status.nvim'

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

" gitsigns
lua <<EOF
require('gitsigns').setup()
EOF

" nvim-lsp
lua <<EOF
local lsp_status = require('lsp-status')
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  navic.attach(client, bufnr)

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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { 'documentation', 'detail', 'additionalTextEdits', } }

--Enable lsp completion
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'
nvim_lsp.bashls.setup{
  on_attach = on_attach,
  cmd = { "bash-language-server", "start" }
}
nvim_lsp.clangd.setup({
  on_attach = on_attach,
  root_dir = util.root_pattern("build/compile_commands.json", "build/compile_flags.txt", ".git") or dirname,
  capabilities = capabilities,
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
  cmd = { "/usr/local/elixir-ls/language_server.sh" },
  capabilities = capabilities,
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
  capabilities = capabilities
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
require("lsp_lines").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = false,

    -- lsp_lines.nvim
    virtual_lines = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,

    underline = true,
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
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    -- { name = 'vsnip' }
  }
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  }
}
EOF

" highlight! LspDiagnosticsUnderline gui=undercurl term=undercurl cterm=undercurl
highlight! DiagnosticUnderlineHint guifg=#53FFE2
highlight! DiagnosticUnderlineInfo guifg=#FF53E6
highlight! DiagnosticUnderlineWarn guifg=#FF8C4B
highlight! DiagnosticUnderlineError guifg=#FF5370

highlight! DiagnosticHint guifg=#53FFE2
highlight! DiagnosticInfo guifg=#FF53E6
highlight! DiagnosticWarn guifg=#FF8C4B
highlight! DiagnosticError guifg=#FF5370

" lualine
lua << END
local navic = require("nvim-navic")
navic.setup {
  separator = "  "
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename',
      { navic.get_location, cond = navic.is_available }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

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
