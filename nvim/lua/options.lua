local opt = vim.opt

-- Set options

opt.termguicolors = true
opt.showmatch = true                -- Show matching brackets.
opt.ignorecase = true               -- Do case insensitive matching
opt.hlsearch = true                 -- Highlight search results
opt.tabstop = 2                     -- Number of columns occupied by a tab character
opt.showtabline = 2
opt.softtabstop = 2                 -- See multiple spaces as tabstops so <BS> does the right thing
opt.expandtab = true                -- Converts tabs to white space
opt.shiftwidth = 2                  -- Width for autoindents
opt.autoindent = true               -- Indent a new line the same amount as the line just typed
opt.number = true                   -- Add line numbers
opt.relativenumber = true
opt.encoding = "utf8"
opt.fileencoding = "utf8"
opt.ruler = true
opt.spelllang = "en"
opt.backup = false
opt.swapfile = false
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hidden = true                   -- Allows buffers to be hidden
opt.inccommand = "split"
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- Set via ~/.agignore
-- vim.opt.wildignore = "*/.git/*,.data/*,*/tmp/*,*/node_modules/*,_build/*,dist/*,deps/*,priv/static/*,*.pyc,*.so,*.a,*.o,*.swp"
vim.cmd("filetype on")                 -- Enable filetype detection
vim.cmd("filetype plugin indent on")
opt.history = 1000                  -- Keep 1000 lines of command line history
opt.showcmd = true                  -- Display incomplete commands
opt.title = true                    -- Show title in console title bar
opt.ttyfast = true                  -- Smoother changes
opt.scrolloff = 3                   -- Keep 3 lines when scrolling
opt.laststatus = 3                  -- Global statusline
opt.signcolumn = "yes"              -- Keep the gutter open so it doesn't jar the screen
opt.cursorcolumn = true             -- Vertical cursor alignment column
-- opt.winbar = "%f" nvim 0.8+

-- Keep this off for now until telescope and others fix double border
-- https://github.com/nvim-telescope/telescope.nvim/issues/3436
opt.winborder = 'none'

-- Config global undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Completion
opt.shortmess:append("c")
opt.shortmess:append("F")
opt.completeopt = {"menu", "menuone", "noselect"}

-- Syntax Coloring
vim.cmd("syntax on")
-- Might speedup
-- https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
-- https://medium.com/@dhendyferdian/claiming-back-my-neovim-responsiveness-2d5c3b3cdeea
-- vim.opt.lazyredraw = true
-- vim.opt.synmaxcol = 128
vim.cmd("syntax sync minlines=256")

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter.foldexpr()"
opt.foldlevelstart = 4

if vim.fn.has("windows") then
  -- Middle dot (U+00B7, UTF-8: C2 B7)
  opt.fillchars = { fold = "·" }

  -- Current theme sets these, so ignore for now
  -- Box drawings heavy vertical (U+2503, UTF-8: E2 94 83)
  -- vim.opt.fillchars=vert:┃

  -- hi VertSplit ctermbg=NONE guibg=#FF5C8F
end
