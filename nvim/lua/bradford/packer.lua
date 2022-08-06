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
	use 'jremmen/vim-ripgrep'
	use 'nvim-lualine/lualine.nvim'
	use 'SmiteshP/nvim-navic'
	use 'ryanoasis/vim-devicons'
	use 'edkolev/tmuxline.vim'
	use 'vim-test/vim-test'
	use 'srstevenson/vim-picker'
	use 'sbdchd/neoformat'
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
	-- use 'ThePrimeagen/harpoon'

	use 'folke/twilight.nvim'
	use 'folke/zen-mode.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-treesitter/playground'
	-- use 'nvim-treesitter/completion-treesitter'

	-- Completion
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind-nvim'
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path', 'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip'
		}
	}

	use 'nvim-lua/lsp-status.nvim'

	use 'liuchengxu/vista.vim'

	-- Formats
	use 'sheerun/vim-polyglot'
	use {'earthly/earthly.vim', branch = 'main'}
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
