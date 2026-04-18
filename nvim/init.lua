require("vim._core.ui2").enable {}
vim.cmd("packadd nvim.undotree")
-- vim.lsp.set_log_level("trace")

-- https://tduyng.com/blog/neovim-basic-setup
require("options")
require("keymaps")
require("colors")
require("highlight_yank")
require("disable_new_line_comment")
require("cursor_hold_highlight")
require("lsp")
