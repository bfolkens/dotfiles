return {
	'lewis6991/gitsigns.nvim',
	event = "VeryLazy",
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('gitsigns').setup()

		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", {})
	end
}
