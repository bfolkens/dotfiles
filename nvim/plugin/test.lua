-- vim.pack.add({ 'https://github.com/vim-test/vim-test' })

-- vim.g["test#strategy"] = "basic"
-- vim.g["test#elixir#exunit#executable"] = "MIX_ENV=test mix test"

vim.pack.add({
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/nvim-neotest/neotest',
  'https://github.com/jfpedroza/neotest-elixir',
  'https://github.com/Jumziey/neotest-nix-unit.nvim'
})

-- NOTE: If a language isn't working, check to make sure a treesitter parser is installed for it.

local nt = require("neotest")

nt.setup({
  adapters = {
    require("neotest-elixir"),
    require("neotest-nix-unit"),
  },
})

vim.keymap.set("n", "<leader>t", function() nt.run.run() end, { desc = "Test nearest" })
vim.keymap.set("n", "<leader>tf", function() nt.run.run(vim.fn.expand("%")) end, { desc = "Test entire file" })

vim.keymap.set("t", "<C-o>", "<C-\\><C-n>", { silent = true, desc = "Go back to normal mode from terminal mode" })
