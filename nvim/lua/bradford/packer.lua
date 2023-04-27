-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'tpope/vim-projectionist'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-endwise'
	use 'tpope/vim-repeat'
	use 'kylechui/nvim-surround'
	use 'ntpeters/vim-better-whitespace'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-lualine/lualine.nvim'
	use 'SmiteshP/nvim-navic'
	use 'ryanoasis/vim-devicons'
	use 'edkolev/tmuxline.vim'
	use 'vim-test/vim-test'
	use 'sbdchd/neoformat'
	use 'mbbill/undotree'
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	-- use 'ThePrimeagen/harpoon'

	use 'ggandor/leap.nvim'

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use 'folke/twilight.nvim'
	use 'folke/zen-mode.nvim'

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- use 'nvim-treesitter/playground'
	-- use 'nvim-treesitter/completion-treesitter'

	-- LSP/Completion
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use 'onsails/lspkind-nvim'
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path'
		}
	}
	use { 'saadparwaiz1/cmp_luasnip' }
	use {
		'L3MON4D3/LuaSnip',
		after = 'nvim-cmp'
	}

	use 'nvim-lua/lsp-status.nvim'

	use 'liuchengxu/vista.vim'

	-- Formats
	use 'sheerun/vim-polyglot'
	use { 'earthly/earthly.vim', branch = 'main' }
	use 'ledger/vim-ledger'
	use 'rcaputo/vim-ledger_x'
	-- use 'lervag/vimtex'
	-- use 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	-- use 'slashmili/alchemist.vim'
	-- use 'elixir-editors/vim-elixir'
	-- use 'c-brenn/phoenix.vim'

	use 'kana/vim-textobj-user'
	use 'gaving/vim-textobj-argument'
	use 'andyl/vim-textobj-elixir'
	-- use 'rhysd/vim-textobj-ruby'

	-- Themes
	use 'drewtempelmeyer/palenight.vim'
	-- use 'kyazdani42/blue-moon'
	-- use 'altercation/vim-colors-solarized'
	-- use 'morhetz/gruvbox'
end)
