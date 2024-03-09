return {
	'SmiteshP/nvim-navic',
	dependencies = 'neovim/nvim-lspconfig',
	config = function()
		require("nvim-navic").setup {
			separator = "  "
		}
	end
}
