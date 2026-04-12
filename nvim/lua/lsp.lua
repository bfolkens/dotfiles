-- https://lugh.ch/switching-to-neovim-native-lsp.html
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#lspa
-- https://neovim.io/doc/user/lsp.html#lsp-config

vim.lsp.enable({
  'bashls',
  'dot',
  'fish-lsp',
  'expert',
  -- 'elixir-ls',
  -- 'lexical',
  -- 'next-ls',
  -- 'nil-ls',
  'nixd',
  'postgres-lsp',
  'solargraph',
  'sumneko',
  'tailwindcss',
  'terraform-ls',
  'texlab',
  'ty',
  'typescript-ls',
  'r'
})

-- Add border to the diagnostic popup window
vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      vim.treesitter.stop(args.buf)
    end
  end,
})
