return {
  {
    'nvim-mini/mini.ai',
    event = "BufEnter",
    opts = {}
  },
  {
    'nvim-mini/mini.bracketed',
    event = "BufEnter",
    opts = {}
  },
  {
    'nvim-mini/mini.comment',
    event = "BufEnter",
    opts = {}
  },
  {
    'nvim-mini/mini.icons',
    event = "BufEnter",
    opts = function ()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end
  },
  -- {
  --   'nvim-mini/mini.pairs',
  --   event = "BufEnter",
  --   opts = {}
  -- },
  {
    'nvim-mini/mini.splitjoin',
    event = "BufEnter",
    opts = {}
  },
  {
    'nvim-mini/mini.move',
    event = "BufEnter",
    opts = {
      mappings = {
        line_up = '[e',
        line_down = ']e',
      }
    }
  },
  {
    'nvim-mini/mini.surround',
    event = "BufEnter",
    config = {
      mappings = {
        add = 'ra', -- Add surrounding in Normal and Visual modes
        delete = 'rd', -- Delete surrounding
        find = 'rf', -- Find surrounding (to the right)
        find_left = 'rF', -- Find surrounding (to the left)
        highlight = 'rh', -- Highlight surrounding
        replace = 'rr', -- Replace surrounding
        update_n_lines = 'rn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
  },
  {
    'nvim-mini/mini.trailspace',
    event = "BufEnter",
    opts = {}
  }
}
