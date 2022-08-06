local keymap = vim.api.nvim_set_keymap
local opts = {}

keymap("n", "<Leader>a", ":Rg<Space>", opts)
