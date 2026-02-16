return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets", -- Contiene los snippets de Java, Vue, Angular, etc.
	},
	version = "*",
	opts = {
		keymap = { preset = "default" },

		-- Configuración para que reconozca los fragmentos de código
		snippets = { preset = "default" },

		sources = {
			-- LSP para Java/Angular, Path para rutas de Tailwind, Buffer para SQL
			default = { "lsp", "path", "snippets", "buffer" },
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 250 },
			ghost_text = { enabled = true },
		},
	},
}
