vim.pack.add({ 'https://github.com/RRethy/nvim-treesitter-endwise' })

require('nvim-treesitter').setup {
  endwise = {
    enable = true,
  },
}
