local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = "Harpoon - add file mark" })
vim.keymap.set("n", "<C-i>", ui.toggle_quick_menu, { desc = "Harpoon - toggle quick menu" })

for i = 1, 9 do
  vim.keymap.set("n", string.format("<C-%d>", i), function() ui.nav_file(i) end)
end
