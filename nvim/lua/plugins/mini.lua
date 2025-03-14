return {
  {
    'echasnovski/mini.ai',
    event = "BufEnter",
    opts = {}
  },
  {
    'echasnovski/mini.bracketed',
    event = "BufEnter",
    opts = {}
  },
  {
    'echasnovski/mini.comment',
    event = "BufEnter",
    opts = {}
  },
  {
    'echasnovski/mini.icons',
    event = "BufEnter",
    opts = function ()
      require('mini.icons').setup()
      MiniIcons.mock_nvim_web_devicons()
    end
  },
  {
    'echasnovski/mini.pairs',
    event = "BufEnter",
    opts = {}
  },
  {
    'echasnovski/mini.splitjoin',
    event = "BufEnter",
    opts = {}
  },
  {
    'echasnovski/mini.move',
    event = "BufEnter",
    opts = {
      mappings = {
        line_up = '[e',
        line_down = ']e',
      }
    }
  }
}
