local keymap = vim.api.nvim_set_keymap
local opts = {}

keymap("n", "<leader>t", ":TestNearest<CR>", opts)
keymap("n", "<leader>tf", ":TestFile<CR>", opts)
keymap("n", "<leader>ta", ":TestSuite<CR>", opts)
keymap("n", "<leader>tl", ":TestLast<CR>", opts)
keymap("n", "<leader>tg", ":TestVisit<CR>", opts)

-- by default in terminal mode, you have to press ctrl-\-n to get into normal mode
keymap("t", "<C-o>", "<C-\\><C-n>", { noremap = true, silent = true })
