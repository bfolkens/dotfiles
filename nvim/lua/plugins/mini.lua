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
  -- This clobbers 's', need to find a different keymap
  -- {
  --   'echasnovski/mini.surround',
  --   event = "BufEnter",
  --   config = {}
  -- }
}
