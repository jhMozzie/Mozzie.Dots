return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Nueva API (sin require('lspconfig'))
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("lua_ls")

			-- Angular Config
			-- Mason install 'angular-language-server'
			vim.lsp.config("angularls", {})
			vim.lsp.enable("angularls")

			-- Typescript/Javascript Config
			vim.lsp.config("ts_ls", {})
			vim.lsp.enable("ts_ls")

			vim.lsp.config("eslint", {})
			vim.lsp.enable("eslint")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
