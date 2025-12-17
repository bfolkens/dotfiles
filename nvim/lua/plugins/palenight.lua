return {
  'drewtempelmeyer/palenight.vim',
  config = function()
    vim.cmd.colorscheme "palenight"

    vim.g.palenight_terminal_italics = 1

    -- Fix some colors... I think these are missing in palenight
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#292D3E" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#697098" })
    vim.api.nvim_set_hl(0, "VertSplit", { fg = "#3E425B" })
    vim.api.nvim_set_hl(0, "HorizSplit", { fg = "#3E425B" })

    -- Set diagnostic colors

    local c = {
      hint = "#53FFE2",
      info = "#FF53E6",
      warn = "#FF8C4B",
      error = "#FF5370"
    }

    vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = c.hint })
    vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = c.info })
    vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = c.warn })
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = c.error })

    -- FIXME: For some reason the "sp" option isn't working for underline
    -- FIXME: undercurl looks like an underline?
    -- https://github.com/neovim/neovim/issues/13734
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = c.hint, sp = c.hint, undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = c.info, sp = c.info, undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = c.warn, sp = c.warn, undercurl = true })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = c.error, sp = c.error, undercurl = true })

    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#BDC7D6", bg = "#32384F" })
    vim.api.nvim_set_hl(0, "PmenuKind", { fg = "#BDC7D6", bg = "#32384F" })
    vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = "#292D3E", bg = "#75b2ff" })
    vim.api.nvim_set_hl(0, "PmenuExtra", { fg = "#BDC7D6", bg = "#32384F" })
    vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = "#292D3E", bg = "#75b2ff" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#292D3E", bg = "#75b2ff" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#464e6e" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1e222f" })

    vim.api.nvim_set_hl(0, "LspReferenceRead", { bold = true, bg = "#4D435C" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bold = true, bg = "#4D435C" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bold = true, bg = "#4D435C" })
  end
}
