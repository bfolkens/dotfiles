return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require('telescope').setup {
			defaults = {
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						-- map actions.which_key to <C-h> (default: <C-/>)
						-- actions.which_key shows the mappings for your picker,
						-- e.g. git_{create, delete, ...}_branch for the git_branches picker
						["<C-h>"] = "which_key",
						["<esc>"] = actions.close
					}
				}
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
				}
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
			}
		}

		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope - find buffers" })
		vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope - find files" })
		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telscope - help tags" })
		vim.keymap.set("n", "<leader>a", builtin.live_grep, { desc = "Telescope - live grep" })
	end
}
