local keymap = vim.api.nvim_set_keymap
local opts = {}

keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
