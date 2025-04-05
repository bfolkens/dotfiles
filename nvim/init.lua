require("options")
require("keymaps")
require("colors")
require("highlight_yank")
require("disable_new_line_comment")
require("lazy-bootstrap")


-- https://lugh.ch/switching-to-neovim-native-lsp.html
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/#lspa
-- https://neovim.io/doc/user/lsp.html#lsp-config

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Setup hover document symbol highlighting
    if client:supports_method('textDocument/documentHighlight') then
      local doc_highlight = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })

      vim.api.nvim_create_autocmd({ 'CursorHold' }, {
        callback = vim.lsp.buf.document_highlight,
        group = doc_highlight
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
        callback = vim.lsp.buf.clear_references,
        group = doc_highlight
      })
    end
  end,
})

vim.lsp.enable({ 'sumneko', 'typescript-ls', 'lexical', 'solargraph', 'tailwindcss' })

-- vim.lsp.set_log_level("trace")
