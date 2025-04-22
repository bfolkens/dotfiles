require("options")
require("keymaps")
require("colors")
require("highlight_yank")
require("disable_new_line_comment")
require("cursor_hold_highlight")
require("lazy-bootstrap")


-- https://lugh.ch/switching-to-neovim-native-lsp.html
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#lspa
-- https://neovim.io/doc/user/lsp.html#lsp-config

vim.lsp.enable({ 'sumneko', 'typescript-ls', 'lexical', 'solargraph', 'tailwindcss', 'terraform-ls' })

-- vim.lsp.set_log_level("trace")
