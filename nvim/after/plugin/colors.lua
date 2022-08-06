vim.opt.background = "dark"
vim.cmd("colorscheme palenight")

-- vim.g.gruvbox_italic = 1

if vim.g.colors_name == "palenight" then
  vim.g.palenight_terminal_italics = 1

  -- Fix some colors... I think these are missing in palenight
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#292D3E" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#697098" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#3E425B" })
  vim.api.nvim_set_hl(0, "HorizSplit", { fg = "#3E425B" })

  -- Set diagnostic colors
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = "#53FFE2" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "#FF53E6" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "#FF8C4B" })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#FF5370" })

  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#53FFE2" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#FF53E6" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FF8C4B" })
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF5370" })
end

-- vim.api.nvim_set_hl(0, "LspDiagnosticsUnderline", { undercurl = true })
