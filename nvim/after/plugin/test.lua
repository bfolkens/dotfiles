vim.g["test#strategy"] = "basic"
vim.g["test#elixir#exunit#executable"] = "MIX_ENV=test mix test"

vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>")
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>")

-- by default in terminal mode, you have to press ctrl-\-n to get into normal mode
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>", { noremap = true, silent = true })
