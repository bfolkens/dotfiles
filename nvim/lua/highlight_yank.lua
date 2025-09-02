local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.hl.on_yank({
      higroup = 'Substitute',
      timeout = 100,
      on_visual = false
    })
  end,
})
