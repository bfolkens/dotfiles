vim.opt.termguicolors = true
vim.opt.showmatch = true                -- Show matching brackets.
vim.opt.ignorecase = true               -- Do case insensitive matching
vim.opt.hlsearch = true                 -- Highlight search results
vim.opt.tabstop = 2                     -- Number of columns occupied by a tab character
vim.opt.showtabline = 2
vim.opt.softtabstop = 2                 -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true                -- Converts tabs to white space
vim.opt.shiftwidth = 2                  -- Width for autoindents
vim.opt.autoindent = true               -- Indent a new line the same amount as the line just typed
vim.opt.number = true                   -- Add line numbers
vim.opt.relativenumber = true
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
vim.opt.termencoding = "utf8"
vim.opt.ruler = true
vim.opt.spelllang = "en"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true                   -- Allows buffers to be hidden
vim.opt.inccommand = "split"
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
-- Set via ~/.agignore
-- vim.opt.wildignore = "*/.git/*,.data/*,*/tmp/*,*/node_modules/*,_build/*,dist/*,deps/*,priv/static/*,*.pyc,*.so,*.a,*.o,*.swp"
vim.cmd("filetype on")                 -- Enable filetype detection
vim.cmd("filetype plugin indent on")
vim.opt.history = 1000                  -- Keep 1000 lines of command line history
vim.opt.showcmd = true                  -- Display incomplete commands
vim.opt.title = true                    -- Show title in console title bar
vim.opt.ttyfast = true                  -- Smoother changes
vim.opt.scrolloff = 3                   -- Keep 3 lines when scrolling
vim.opt.laststatus = 3                  -- Global statusline
vim.opt.signcolumn = "yes"              -- Keep the gutter open so it doesn't jar the screen
-- vim.opt.winbar = "%f" nvim 0.8+

-- Config global undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Completion
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("F")
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Syntax Coloring
vim.cmd("syntax on")
-- Might speedup
-- https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
-- https://medium.com/@dhendyferdian/claiming-back-my-neovim-responsiveness-2d5c3b3cdeea
-- vim.opt.lazyredraw = true
-- vim.opt.synmaxcol = 128
vim.cmd("syntax sync minlines=256")

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter.foldexpr()"
vim.opt.foldlevelstart = 4

if vim.fn.has("windows") then
  -- Middle dot (U+00B7, UTF-8: C2 B7)
  vim.opt.fillchars = { fold = "·" }

  -- Current theme sets these, so ignore for now
  -- Box drawings heavy vertical (U+2503, UTF-8: E2 94 83)
  -- vim.opt.fillchars=vert:┃

  -- hi VertSplit ctermbg=NONE guibg=#FF5C8F
end

if vim.fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
