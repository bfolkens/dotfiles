local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

keymap("n", "<Leader>d", ":Vista<CR>", opts)
