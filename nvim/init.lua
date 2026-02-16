-- [[ 1. Bootstrap lazy.nvim ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ 2. Mapleader ]]
-- Define the space bar as your leader key
vim.g.mapleader = " "

-- [[ 3. Diagnostics Toggle (The Interruptor) ]]
-- English comment: Toggle all visual error hints (LSP Diagnostics)
vim.keymap.set("n", "<leader>td", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
		print("Diagnostics Disabled (Silent Mode)")
	else
		vim.diagnostic.enable(true)
		print("Diagnostics Enabled")
	end
end, { desc = "Toggle inline diagnostics" })

-- [[ 4. Plugin Management ]]
require("vim-options")
require("lazy").setup("plugins")

-- [[ 5. Buffer Navigation ]]
-- Alan's preferred navigation: Use Tab to switch between open files
-- This mimics a modern IDE behavior for a seamless workflow
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
