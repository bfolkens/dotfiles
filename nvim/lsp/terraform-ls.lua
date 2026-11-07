return {
  cmd = { 'terraform-ls', 'serve' },
  -- root_markers = { ".terraform", ".git" },
  filetypes = { "terraform", "terraform-vars", "hcl" },

  -- intercept and filter out invalid URIs, otherwise this seems to crash the LSP
  root_dir = function(bufnr)
    local bufname = vim.api.nvim_buf_get_name(bufnr or 0)

    if bufname == "" or bufname:match("^%a+://") then
      return nil
    end

    return vim.fs.root(bufnr, { ".terraform", ".git" })
  end,
}
