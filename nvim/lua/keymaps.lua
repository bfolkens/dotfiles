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

-- Better window navigation
set("n", "<C-l>", "<C-w><C-l>", { silent = true })
set("n", "<C-h>", "<C-w><C-h>", { silent = true })
set("n", "<C-j>", "<C-w><C-j>", { silent = true })
set("n", "<C-k>", "<C-w><C-k>", { silent = true })
