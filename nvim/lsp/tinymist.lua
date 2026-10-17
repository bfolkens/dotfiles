return {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, { ".git" }) or vim.uv.cwd())
  end,
  single_file_support = true,
  settings = {
    formatterMode = "typstyle",
  }
}
