return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      -- https://sbulav.github.io/vim/neovim-setting-up-luasnip/

      local ls = require("luasnip")
      -- some shorthands...
      local snip = ls.snippet
      local node = ls.snippet_node
      local text = ls.text_node
      local insert = ls.insert_node
      local func = ls.function_node
      local choice = ls.choice_node
      local dynamicn = ls.dynamic_node

      local date = function() return { os.date('%Y-%m-%d') } end

      ls.add_snippets(nil, {
        all = {
          -- TODO: Add some
        },
      })
    end
  },
  {
    'saadparwaiz1/cmp_luasnip',
    dependencies = { 'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip' }
  }
}
