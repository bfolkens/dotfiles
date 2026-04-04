-- https://tduyng.com/blog/neovim-basic-setup

vim.cmd("packadd nvim.undotree")

require("options")
require("keymaps")
require("colors")
require("highlight_yank")
require("disable_new_line_comment")
require("cursor_hold_highlight")
require("lsp")

-- vim.lsp.set_log_level("trace")

-- New experimental UI2
require("vim._core.ui2").enable { }
