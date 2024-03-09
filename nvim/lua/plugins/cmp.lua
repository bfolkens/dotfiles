return {
  'hrsh7th/nvim-cmp',
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim'
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- local function has_words_before()
    --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    --   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    -- end

    local select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          if not luasnip then
            return
          end
          luasnip.lsp_expand(args.body)
        end
      },
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
      },
      sources = {
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "buffer",   keyword_length = 3 },
        { name = "luasnip",  keyword_length = 2 },
        { name = "path" },
      },
      window = {
        documentation = cmp.config.window.bordered()
      },
    })

    local lspkind = require("lspkind")
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
      }
    }
  end,
  experimental = {
    ghost_text = true
  }
}
