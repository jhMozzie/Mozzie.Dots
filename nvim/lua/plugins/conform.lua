return {
	"stevearc/conform.nvim",
	-- Load when writing a buffer
	event = { "BufWritePre" },
	-- Lazy-loaded keymaps for better startup performance
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "Format buffer (Manual)",
		},
	},
	opts = {
		-- This replaces the "sources" block you see in null-ls
		formatters_by_ft = {
			-- Use stylua for your Neovim config files
			lua = { "stylua" },
			-- Use prettier for Angular (TS, HTML, CSS)
			typescript = { "prettier" },
			javascript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
		},
		-- Automatically format when saving
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
