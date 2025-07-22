-- https://lugh.ch/switching-to-neovim-native-lsp.html
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#lspa
-- https://neovim.io/doc/user/lsp.html#lsp-config

vim.lsp.enable({
  -- 'elixir-lsp',
  'lexical',
  -- 'next-ls',
  -- 'nil-ls',
  'postgres-lsp',
  'solargraph',
  'sumneko',
  'tailwindcss',
  'terraform-ls',
  'texlab',
  'typescript-ls',
  'r'
})

-- Add border to the diagnostic popup window
vim.diagnostic.config({
  float = { border = "rounded" },
})
