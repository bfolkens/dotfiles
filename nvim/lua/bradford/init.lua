require("bradford.set")
require("bradford.plugins")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
		group = yank_group,
		pattern = '*',
		callback = function()
			vim.highlight.on_yank({
					higroup = 'Substitute',
					timeout = 100,
					on_visual = false
				})
		end,
	})

-- Turn off annoying comment continuations
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})
