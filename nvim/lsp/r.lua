return {
  cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
  filetypes = { "r", "rmd", "quarto" },
  root_markers = { '.git' },
  settings = {
    -- escape 'nil' bc it's a keyword
    ['r_language_server'] = {
      formatting = {
        command = { 'air', 'format' }
      },
    },
  }
}
