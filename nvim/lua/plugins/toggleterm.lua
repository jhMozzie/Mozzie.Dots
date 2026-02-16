return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-t>]], -- Este abre/cierra la actual
			direction = "float",
			float_opts = { border = "curved" },
		})

		local set_keymap = vim.keymap.set

		-- Atajos para abrir terminales específicas
		set_keymap("n", "<leader>1", "<cmd>1ToggleTerm<cr>", { desc = "Terminal 1" })
		set_keymap("n", "<leader>2", "<cmd>2ToggleTerm<cr>", { desc = "Terminal 2" })
		set_keymap("n", "<leader>3", "<cmd>3ToggleTerm<cr>", { desc = "Terminal 3" })

		-- EL TRUCO: Mapeos para que los atajos funcionen INCLUSO dentro de la terminal
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- Permite usar Esc para salir al modo normal dentro de la terminal
			set_keymap("t", "<esc>", [[<C-\><C-n>]], opts)
			-- Permite usar Ctrl+t para CERRAR la terminal desde adentro
			set_keymap("t", "<C-t>", [[<C-\><C-n><cmd>ToggleTerm<cr>]], opts)
			-- Permite saltar a la terminal 1 o 2 directamente desde OTRA terminal
			set_keymap("t", "<leader>1", [[<C-\><C-n><cmd>1ToggleTerm<cr>]], opts)
			set_keymap("t", "<leader>2", [[<C-\><C-n><cmd>2ToggleTerm<cr>]], opts)
		end

		-- Aplicar estos atajos cada vez que se abra una terminal
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
