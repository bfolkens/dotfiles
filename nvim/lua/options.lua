local opt = vim.opt

opt.number = true -- Add line numbers
opt.relativenumber = true
opt.cursorline = false
opt.cursorcolumn = true -- Vertical cursor alignment column
opt.wrap = false        -- Don't wrap lines
opt.linebreak = true    -- Wrap lines at convenient points
opt.scrolloff = 3       -- Keep 3 lines when scrolling
opt.sidescrolloff = 0   -- Keep 0 columns left/right of cursor

-- Indentation
opt.tabstop = 2         -- Number of columns occupied by a tab character
opt.shiftwidth = 2      -- Width for autoindents
opt.softtabstop = 2     -- See multiple spaces as tabstops so <BS> does the right thing
opt.expandtab = true    -- Converts tabs to white space
opt.smartindent = false -- Smart auto-indenting
opt.autoindent = true   -- Indent a new line the same amount as the line just typed
opt.shiftround = false  -- Round indent

-- Search settings
opt.ignorecase = true -- Do case insensitive matching
opt.smartcase = true  -- Case sensitive if uppercase in search
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Show matches as you type

-- Visual settings
opt.termguicolors = true
opt.signcolumn = "yes" -- Keep the gutter open so it doesn't jar the screen
opt.showmatch = true   -- Show matching brackets.
opt.inccommand = "split"
opt.matchtime = 5      -- How long to show matching bracket
opt.cmdheight = 1      -- Command line height
opt.showtabline = 2
opt.showmode = true    -- Show mode in command line
-- opt.pumheight = 10        -- Popup menu height
-- opt.pumblend = 10         -- Popup menu transparency
-- opt.winblend = 0          -- Floating window transparency
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = false  -- Confirm to save changes before exiting modified buffer
opt.conceallevel = 0 -- Hide * markup for bold and italic, but not markers with substitutions
-- opt.concealcursor = ""    -- Don't hide cursor line markup
opt.synmaxcol = 3000 -- Syntax highlighting limit
opt.ruler = true
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width
opt.winborder = 'rounded'

-- File handling
opt.backup = false      -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false    -- Don't create swap files
opt.undofile = true     -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 300                          -- Faster completion
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 0                           -- Key code timeout
opt.autoread = true                           -- Auto reload files changed outside vim
opt.autowrite = false
opt.fileencoding = "utf8"

-- Behavior settings
opt.hidden = true                            -- Allows buffers to be hidden
opt.errorbells = false                       -- No error bells
opt.backspace = { "indent", "eol", "start" } -- Better backspace behavior
opt.autochdir = false                        -- Don't auto change directory
opt.iskeyword:append("-")                    -- Treat dash as part of word
-- opt.path:append("**")                                   -- include subdirectories in search
opt.selection = "inclusive"                  -- Selection behavior
opt.mouse = { i = true, n = true, v = true } -- Enable mouse support
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.modifiable = true                        -- Allow buffer modifications
opt.encoding = "UTF-8"                       -- Set encoding
opt.jumpoptions = "clean"

-- Folding settings
opt.smoothscroll = false
-- vim.wo.foldmethod = "expr"
opt.foldlevelstart = 8
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter.foldexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep -uu "

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- Set via ~/.agignore
-- vim.opt.wildignore = "*/.git/*,.data/*,*/tmp/*,*/node_modules/*,_build/*,dist/*,deps/*,priv/static/*,*.pyc,*.so,*.a,*.o,*.swp"

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Completion
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.shortmess:append({ c = true, F = true })

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end


-- Misc

opt.spelllang = "en"
vim.cmd("filetype on") -- Enable filetype detection
vim.cmd("filetype plugin indent on")
opt.history = 1000     -- Keep 1000 lines of command line history
opt.showcmd = true     -- Display incomplete commands
opt.title = true       -- Show title in console title bar
opt.ttyfast = true     -- Smoother changes
opt.laststatus = 3     -- Global statusline
-- opt.winbar = "%f" nvim 0.8+

vim.g.autoformat = true
vim.g.trouble_lualine = true

opt.list = false -- Show some invisible characters (tabs...

-- Syntax Coloring
vim.cmd("syntax on")
-- Might speedup
-- https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
-- https://medium.com/@dhendyferdian/claiming-back-my-neovim-responsiveness-2d5c3b3cdeea
-- vim.opt.lazyredraw = true
-- vim.opt.synmaxcol = 128
vim.cmd("syntax sync minlines=256")

if vim.fn.has("windows") then
  -- Middle dot (U+00B7, UTF-8: C2 B7)
  opt.fillchars = { fold = "·" }

  -- Current theme sets these, so ignore for now
  -- Box drawings heavy vertical (U+2503, UTF-8: E2 94 83)
  -- vim.opt.fillchars=vert:┃

  -- hi VertSplit ctermbg=NONE guibg=#FF5C8F
end
