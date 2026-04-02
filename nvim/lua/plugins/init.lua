require 'plugins.palenight'

vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/mfussenegger/nvim-dap',
  -- 'm4xshen/hardtime.nvim',
	-- 'folke/twilight.nvim',
	-- 'folke/zen-mode.nvim',
  -- 'nvim-treesitter/playground',
	-- 'ThePrimeagen/harpoon',

	-- Formats
	'https://github.com/sheerun/vim-polyglot',
	'https://github.com/earthly/earthly.vim',
	'https://github.com/ledger/vim-ledger',
	'https://github.com/rcaputo/vim-ledger_x',
	-- 'lervag/vimtex',
	-- 'xuhdev/vim-latex-live-preview', { 'for': 'tex' },
	-- 'slashmili/alchemist.vim',
	-- 'elixir-editors/vim-elixir',
	-- 'c-brenn/phoenix.vim',

	-- Themes
	-- 'kyazdani42/blue-moon',
	-- 'altercation/vim-colors-solarized',
	-- {
	-- 	'morhetz/gruvbox',
	-- 	config = function()
	-- 		vim.g.gruvbox_italic = 1
	-- 	end
	-- }
})

require 'plugins.completion'
require 'plugins.gitsigns'
require 'plugins.indent-blankline'
require 'plugins.leap'
require 'plugins.navic'
require 'plugins.progress'
require 'plugins.lualine'
require 'plugins.marks'
require 'plugins.mini'
require 'plugins.neoformat'
require 'plugins.telescope'
require 'plugins.test'
require 'plugins.text-case'
require 'plugins.treesitter'
require 'plugins.treesitter-endwise'
require 'plugins.treesitter-text-objects'
require 'plugins.which-key'
