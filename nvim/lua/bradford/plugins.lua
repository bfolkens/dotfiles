-- Bootstrap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins

local plugins = {
	'tpope/vim-fugitive',
	'tpope/vim-commentary',
	'tpope/vim-projectionist',
	'tpope/vim-unimpaired',
	'tpope/vim-endwise',
	'tpope/vim-repeat',
	'kylechui/nvim-surround',
	'ntpeters/vim-better-whitespace',
	'lukas-reineke/indent-blankline.nvim',
	'nvim-lualine/lualine.nvim',
	{
		'SmiteshP/nvim-navic',
		dependencies = 'neovim/nvim-lspconfig'
	},
	'ryanoasis/vim-devicons',
	'edkolev/tmuxline.vim',
	'vim-test/vim-test',
	'sbdchd/neoformat',
	'mbbill/undotree',
	{
		'lewis6991/gitsigns.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'ThePrimeagen/harpoon',
	'ggandor/leap.nvim',
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
	'folke/twilight.nvim',
	'folke/zen-mode.nvim',

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		dependencies = {
			'nvim-treesitter/nvim-treesitter'
		}
	},
	-- 'nvim-treesitter/playground',

	-- LSP/Completion
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	'onsails/lspkind-nvim',
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path'
		}
	},
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip', -- after nvim-cmp
	'linrongbin16/lsp-progress.nvim',

	-- Formats
	'sheerun/vim-polyglot',
	{ 'earthly/earthly.vim', branch = 'main' },
	'ledger/vim-ledger',
	'rcaputo/vim-ledger_x',
	-- 'lervag/vimtex',
	-- 'xuhdev/vim-latex-live-preview', { 'for': 'tex' },
	-- 'slashmili/alchemist.vim',
	-- 'elixir-editors/vim-elixir',
	-- 'c-brenn/phoenix.vim',

	-- Themes
	'drewtempelmeyer/palenight.vim',
	-- 'kyazdani42/blue-moon',
	-- 'altercation/vim-colors-solarized',
	-- 'morhetz/gruvbox',
}


-- Startup

require("lazy").setup(plugins, {
	ui = {
		border = "rounded"
	}
})
