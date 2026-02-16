return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim", -- Added as dependency
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			-- 1. Main Setup & UI-Select Extension
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- Additional options can go here
						}),
					},
				},
			})

			-- 2. Load extensions
			telescope.load_extension("ui-select")

			-- 3. Keymaps (Your favorite shortcuts)
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

			-- Recommended: Helper for your thesis components
			-- This allows you to search through files you currently have open
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
		end,
	},
}
