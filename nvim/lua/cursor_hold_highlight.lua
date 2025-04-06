local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Setup hover document symbol highlighting
    if client:supports_method('textDocument/documentHighlight') then
      vim.api.nvim_create_autocmd({ 'CursorHold' }, { group = group, callback = vim.lsp.buf.document_highlight, buffer = ev.buf })
      vim.api.nvim_create_autocmd({ 'CursorMoved' }, { group = group, callback = vim.lsp.buf.clear_references, buffer = ev.buf })
    end
  end,
})

vim.api.nvim_create_autocmd('LspDetach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Clear hover document symbol highlighting
    if client:supports_method('textDocument/documentHighlight') then
      vim.api.nvim_clear_autocmds({ group = group, event = 'CursorHold', buffer = ev.buf })
      vim.api.nvim_clear_autocmds({ group = group, event = 'CursorMoved', buffer = ev.buf })
    end
  end,
})
