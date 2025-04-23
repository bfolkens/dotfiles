return {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
  settings = {
    -- escape 'nil' bc it's a keyword
    ['nil'] = {
      formatting = {
        command = { 'nixfmt' }
      },
    },
  }
}
