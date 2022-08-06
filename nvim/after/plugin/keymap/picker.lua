local keymap = vim.api.nvim_set_keymap
local opts = {}

keymap("n", "<leader>b", "<Plug>(PickerBuffer)", opts)
keymap("n", "<leader>f", "<Plug>(PickerEdit)", opts)
keymap("n", "<leader>s", "<Plug>(PickerSplit)", opts)
keymap("n", "<leader>v", "<Plug>(PickerVsplit)", opts)
keymap("n", "<leader>]", "<Plug>(PickerTag)", opts)
keymap("n", "<leader>h", "<Plug>(PickerHelp)", opts)
