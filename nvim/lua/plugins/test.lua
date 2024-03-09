return {
	'vim-test/vim-test',
	config = function()
		vim.g["test#strategy"] = "basic"
		vim.g["test#elixir#exunit#executable"] = "MIX_ENV=test mix test"

		vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Test nearest" })
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test entire file" })
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test suite" })
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test last" })
		vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>", { desc = "Test visit" })

		vim.keymap.set("t", "<C-o>", "<C-\\><C-n>", { silent = true, desc = "Go back to normal mode from terminal mode" })
	end
}
