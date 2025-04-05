vim.g.mapleader = ";"

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c"

local set = vim.keymap.set

set("n", "<esc>", ":noh<CR>", { silent = true, desc = "Stop highlighting on Enter" })

-- https://neovim.io/doc/user/lsp.html#lsp-config
set("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
        { desc = "Formats a buffer using the attached (and optionally filtered) language server clients" })
