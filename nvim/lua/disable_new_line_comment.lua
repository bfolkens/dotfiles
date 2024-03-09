local autocmd = vim.api.nvim_create_autocmd

-- Turn off annoying comment continuations
autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})
