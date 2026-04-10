vim.pack.add({
  'https://github.com/nvim-mini/mini.ai',
  'https://github.com/nvim-mini/mini.bracketed',
  'https://github.com/nvim-mini/mini.comment',
  'https://github.com/nvim-mini/mini.icons',
  -- 'nvim-mini/mini.pairs',
  'https://github.com/nvim-mini/mini.splitjoin',
  'https://github.com/nvim-mini/mini.move',
  'https://github.com/nvim-mini/mini.pick',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.trailspace',
})

require('mini.ai').setup()
require('mini.bracketed').setup()
require('mini.comment').setup()

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.splitjoin').setup()

require('mini.move').setup({
  mappings = {
    line_up = '[e',
    line_down = ']e',
  }
})

require('mini.pick').setup({
  mappings = {
    choose_marked = '<C-q>'
  }
})

vim.keymap.set("n", "<leader>b", '<Cmd>Pick buffers<CR>', { desc = "MiniPick - find buffers" })
vim.keymap.set("n", "<leader>f", '<Cmd>Pick files<CR>', { desc = "MiniPick - find files" })
vim.keymap.set("n", "<leader>h", '<Cmd>Pick help<CR>', { desc = "MiniPick - help tags" })
vim.keymap.set("n", "<leader>a", '<Cmd>Pick grep_live<CR>', { desc = "MiniPick - live grep (rg) project" })

require('mini.surround').setup({
  mappings = {
    add = 'ra',            -- Add surrounding in Normal and Visual modes
    delete = 'rd',         -- Delete surrounding
    find = 'rf',           -- Find surrounding (to the right)
    find_left = 'rF',      -- Find surrounding (to the left)
    highlight = 'rh',      -- Highlight surrounding
    replace = 'rr',        -- Replace surrounding
    update_n_lines = 'rn', -- Update `n_lines`

    suffix_last = 'l',     -- Suffix to search with "prev" method
    suffix_next = 'n',     -- Suffix to search with "next" method
  }
})

require('mini.trailspace').setup()
