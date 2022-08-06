local keymap = vim.api.nvim_set_keymap
local opts = {}

keymap("n", "<Leader>a", ":Ack!<Space>", opts)
