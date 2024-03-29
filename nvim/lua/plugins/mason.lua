return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    build = ':MasonUpdate',
    config = function()
      require('mason').setup {
        ui = {
          border = 'rounded'
        }
      }
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      auto_install = true
    }
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'SmiteshP/nvim-navic'
    },
    config = function()
      require("mason-lspconfig").setup { automatic_installation = true }

      local navic = require("nvim-navic")

      local cmp = require('cmp_nvim_lsp')

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        -- Keybindings for LSPs
        -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
        vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',
          { desc = "Jumps to the declaration of the symbol under the cursor" })
        vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>',
          { desc = "Jumps to the definition of the symbol under the cursor" })
        vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>',
          { desc = "Show the hover window for the symbol under the cursor" })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
          { desc = "Jumps to the implementation of the symbol under the cursor" })
        vim.keymap.set('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',
          { desc = "Lists all symbols in the current buffer in the quickfix window" })
        vim.keymap.set('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',
          { desc = "Lists all symbols in the current workspace in the quickfix window" })
        vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
          { desc = "Displays signature information about the symbol under the cursor in a floating window" })
        vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
          { desc = "Add the folder at path to the workspace folders" })
        vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
          { desc = "Remove the folder at path from the workspace folders" })
        vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
          { desc = "List workspace folders" })
        vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
          { desc = "Jumps to the definition of the type of the symbol under the cursor" })
        vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
          { desc = "Renames all references to the symbol under the cursor" })
        vim.keymap.set('n', '<space>ca', function() vim.lsp.buf.code_action({ apply = true }) end,
          { desc = "Selects a code action available at the current cursor position" })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
          { desc = "Lists all the references to the symbol under the cursor in the quickfix window" })

        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>',
          { desc = "Go to the previous diagnostic" })
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>',
          { desc = "Go to the next diagnostic" })
        -- vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "" })
        -- vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = "" })

        -- Set some keybinds conditional on server capabilities
        if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
          vim.keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            { desc = "Formats a buffer using the attached (and optionally filtered) language server clients" })
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

      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
      local capabilities = cmp.default_capabilities()

      -- Configure all the LSPs
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,
          signs = true,
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
    end
  }
}
