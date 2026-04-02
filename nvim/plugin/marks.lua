vim.pack.add({ 'https://github.com/chentoast/marks.nvim' })

require('marks').setup({
  default_mappings = true,
  signs = true,
  mappings = {}
})
