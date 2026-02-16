return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Coma añadida aquí
	config = function()
		require("lualine").setup({
			options = { -- 'options' corregido a plural
				theme = "dracula", -- Usamos catppuccin para combinar con tu tema
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
