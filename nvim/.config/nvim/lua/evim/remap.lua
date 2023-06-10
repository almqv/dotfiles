vim.g.mapleader = " "

-- Generic binds
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<A-f>", builtin.find_files, {})
-- vim.keymap.set("n", "<A-g>", builtin.live_grep, {})
vim.keymap.set("n", "<A-b>", builtin.buffers, {})
vim.keymap.set("n", "<A-h>", builtin.help_tags, {})

-- Editor binds
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy/paste stuff
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Prettier
vim.keymap.set("n", "<leader>g", function()
	vim.cmd "Prettier" -- NOTE: this is super hacky but fuck you
end, { buffer = bufnr, desc = "[lsp] Format" })
