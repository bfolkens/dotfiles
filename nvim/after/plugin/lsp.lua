local lsp_status = require('lsp-status')
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  navic.attach(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- Format on save
    -- vim.api.nvim_exec([[
    --   augroup lsp_document_autoformat
    --     autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)
    --   augroup END
    -- ]], false)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

--Enable window/workDoneProgress for lsp-status
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { 'documentation', 'detail', 'additionalTextEdits', } }

--Enable lsp completion
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'
nvim_lsp.bashls.setup{
  on_attach = on_attach,
  cmd = { "bash-language-server", "start" }
}
nvim_lsp.clangd.setup({
  on_attach = on_attach,
  root_dir = util.root_pattern("build/compile_commands.json", "build/compile_flags.txt", ".git") or dirname,
  capabilities = capabilities,
  cmd = { "/opt/homebrew/opt/llvm/bin/clangd" }
})
nvim_lsp.cmake.setup{
  on_attach = on_attach,
  cmd = { "cmake-language-server" }
}
nvim_lsp.cssls.setup{
  on_attach = on_attach,
  cmd = { "vscode-css-language-server", "--stdio" },
  capabilities = capabilities,
}
nvim_lsp.html.setup{
  on_attach = on_attach,
  cmd = { "vscode-html-language-server", "--stdio" },
  capabilities = capabilities,
}
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
  cmd = { "docker-langserver", "--stdio" }
}
nvim_lsp.elixirls.setup{
  on_attach = on_attach,
  cmd = { "/Users/bfolkens/local/opt/elixir-ls/language_server.sh" },
  capabilities = capabilities,
}
-- nvim_lsp.elmls.setup{
--   on_attach = on_attach
-- }
-- nvim_lsp.julials.setup{
--  on_attach = on_attach
-- }
nvim_lsp.jsonls.setup{
  on_attach = on_attach,
  cmd = { "vscode-json-language-server", "--stdio" }
}
nvim_lsp.pylsp.setup{
  on_attach = on_attach
}
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
nvim_lsp.solargraph.setup{
  on_attach = on_attach
}
nvim_lsp.sourcekit.setup{
  on_attach = on_attach
}
nvim_lsp.sumneko_lua.setup {
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
        globals = {'vim'},
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
nvim_lsp.texlab.setup{
  on_attach = on_attach,
  cmd = { "texlab" }
}
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vim-language-server", "--stdio" }
}
nvim_lsp.yamlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "yaml-language-server", "--stdio" }
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
