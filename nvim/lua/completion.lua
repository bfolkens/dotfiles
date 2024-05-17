local lspkind = require("lspkind")
lspkind.init {}

local cmp = require("cmp")

-- local function has_words_before()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

cmp.setup({
  sources = {
    { name = "nvim_lsp", keyword_length = 3 },
    { name = "buffer",   keyword_length = 3 },
    { name = "luasnip",  keyword_length = 2 },
    { name = "path" },
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- Better way of doing things
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<C-e>"] = cmp.mapping.abort(),
  },
  window = {
    documentation = cmp.config.window.bordered()
  },

  -- Enable luasnip to handle snippet expansion for nvim-cmp
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
})

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
}

local ls = require("luasnip")
ls.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })
