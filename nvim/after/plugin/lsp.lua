require("mason").setup()
require("mason-lspconfig").setup { automatic_installation = true }

local lsp_status = require('lsp-status')
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  navic.attach(client, bufnr)

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
  vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { desc = "Jumps to the declaration of the symbol under the cursor" })
  vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { desc = "Jumps to the definition of the symbol under the cursor" })
  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Show the hover window for the symbol under the cursor" })
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Jumps to the implementation of the symbol under the cursor" })
  vim.keymap.set('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = "Lists all symbols in the current buffer in the quickfix window" })
  vim.keymap.set('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { desc = "Lists all symbols in the current workspace in the quickfix window" })
  vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Displays signature information about the symbol under the cursor in a floating window" })
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { desc = "Add the folder at path to the workspace folders" })
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { desc = "Remove the folder at path from the workspace folders" })
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { desc = "List workspace folders" })
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = "Jumps to the definition of the type of the symbol under the cursor" })
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = "Renames all references to the symbol under the cursor" })
  vim.keymap.set('n', '<space>ca', function() vim.lsp.buf.code_action({ apply = true }) end, { desc = "Selects a code action available at the current cursor position" })
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "Lists all the references to the symbol under the cursor in the quickfix window" })

  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', { desc = "Go to the previous diagnostic" })
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', { desc = "Go to the next diagnostic" })
  -- vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "" })
  -- vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = "" })

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
    vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Formats a buffer using the attached (and optionally filtered) language server clients" })
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec([[
      :hi LspReferenceRead cterm=bold ctermbg=red guibg=#3d435c
      :hi LspReferenceText cterm=bold ctermbg=red guibg=#3d435c
      :hi LspReferenceWrite cterm=bold ctermbg=red guibg=#3d435c
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

lsp_status.register_progress()

--Enable lsp completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'
nvim_lsp.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.clangd.setup({
  root_dir = util.root_pattern("build/compile_commands.json", "build/compile_flags.txt", ".git"),
  on_attach = on_attach,
  capabilities = capabilities,
})
nvim_lsp.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
-- nvim_lsp.elmls.setup{
--   on_attach = on_attach
-- }
-- nvim_lsp.julials.setup{
--  on_attach = on_attach
-- }
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = {
  --   "rustup", "run", "stable", "rust-analyzer"
  -- }
})
nvim_lsp.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- NOTE: some discussion on Reddit about this loading up all the plugin files? slowdown?
        -- library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
nvim_lsp.nil_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.vimls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.vls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  -- This will disable virtual text, like doing:
  -- let g:diagnostic_enable_virtual_text = 0
  virtual_text = false,

  -- This is similar to:
  -- let g:diagnostic_show_sign = 1
  -- To configure sign display,
  --  see: ":help vim.lsp.diagnostic.set_signs()"
  signs = true,

  -- This is similar to:
  -- "let g:diagnostic_insert_delay = 1"
  update_in_insert = false,

  underline = true,
}
)

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = "rounded",
}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
  border = 'rounded'
}
)

-- vim.lsp.set_log_level("trace")
