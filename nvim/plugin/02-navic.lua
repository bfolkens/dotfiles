vim.pack.add({ 'https://github.com/SmiteshP/nvim-navic' })

require('nvim-navic').setup({
  separator = "  "
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local navic = require("nvim-navic")
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    if client:supports_method('textDocument/documentSymbol') then
      navic.attach(client, ev.buf)
    end
  end,
})
