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
