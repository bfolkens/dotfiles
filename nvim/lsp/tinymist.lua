return {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({ ".git" }, { path = fname, upward = true })[1])
        or vim.loop.cwd()
  end,
  single_file_support = true,
  settings = {
    formatterMode = "typstyle",
  }
}
