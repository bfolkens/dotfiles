return {
  cmd = { '/Users/bfolkens/local/opt/elixir-ls/language_server.sh' },
  filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  root_markers = { 'mix.exs', '.git' },
  single_file_support = true,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = true,
      enableTestLenses = true,
      suggestSpecs = true,
      incrementalDialyzer = true,
      signatureAfterComplete = true,
    },
  }
}
