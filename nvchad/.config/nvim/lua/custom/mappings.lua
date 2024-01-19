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
		[">"] = { ">gv", "indent" },
	},

	s = {
		-- Move up and down when selected
		["J"] = { ":m '>+1<CR>gv=gv" },
		["K"] = { ":m '<-2<CR>gv=gv" },
	},
}

-- more keybinds!

return M
