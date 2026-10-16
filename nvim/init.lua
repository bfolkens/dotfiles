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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("TypstFiletype", { clear = true }),
  pattern = "*.typ",
  callback = function(event)
    vim.bo[event.buf].filetype = "typst"
  end,
})
