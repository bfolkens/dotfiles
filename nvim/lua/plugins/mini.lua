return {
  {
    'echasnovski/mini.ai',
    event = "BufEnter",
    config = {}
  },
  {
    'echasnovski/mini.bracketed',
    event = "BufEnter",
    config = {}
  },
  {
    'echasnovski/mini.comment',
    event = "BufEnter",
    config = {}
  },
  {
    'echasnovski/mini.icons',
    event = "BufEnter",
    config = function ()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end
  },
  {
    'echasnovski/mini.pairs',
    event = "BufEnter",
    config = {}
  },
  {
    'echasnovski/mini.splitjoin',
    event = "BufEnter",
    config = {}
  },
  {
    'echasnovski/mini.move',
    event = "BufEnter",
    config = {
      mappings = {
        line_up = '[e',
        line_down = ']e',
      }
    }
  },
  {
    'echasnovski/mini.surround',
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
  }
}
