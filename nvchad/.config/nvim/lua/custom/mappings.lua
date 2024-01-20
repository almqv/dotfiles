---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		--  format with conform
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"formatting",
		},
	},

	v = {
		-- Indentation
		[">"] = { ">gv", "indent" },
		-- Move selection up/down with K/J
		["J"] = { ":m '>+1<CR>gv=gv", "move selection down" },
		["K"] = { ":m '<-2<CR>gv=gv", "move selection up" },
	},

	i = {
		["<C-l>"] = {
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			"Copilot Accept",
			{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		},
	},
}

-- more keybinds!

return M
