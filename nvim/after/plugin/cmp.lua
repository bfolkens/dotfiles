local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp', keyword_length = 2 },
    { name = 'buffer', keyword_length = 2 },
    { name = 'path' },
    -- { name = 'vsnip', keyword_length = 2 }
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
}
