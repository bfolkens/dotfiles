require("bradford.set")
require("bradford.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
		group = yank_group,
		pattern = '*',
		callback = function()
			vim.highlight.on_yank({
					higroup = 'IncSearch',
					timeout = 100,
				})
		end,
	})

-- augroup highlight_yank
--   autocmd!
--   autocmd TextYankPost * silent! lua require 'vim.highlight'.on_yank {higroup='Substitute', timeout=100, on_visual=false}
-- augroup END
