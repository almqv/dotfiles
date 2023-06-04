--      __     ___
--    __\ \   / (_)_ __ ___
--   / _ \ \ / /| | '_ ` _ \
--  |  __/\ V / | | | | | | |
--   \___| \_/  |_|_| |_| |_|
--        epsilons Viim

require("evim.init")

-- Theme
vim.opt.termguicolors = true
local theme = require("onedark")

theme.setup {
	-- Main options --
	style = "warmer",          -- Default theme style. Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
	transparent = false,       -- Show/hide background
	term_colors = true,        -- Change terminal color as per the selected theme style
	ending_tildes = false,     -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil,                                                           -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma separated, For e.g., keywords = "italic,bold"
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "bold",
		strings = "none",
		variables = "none"
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {},  -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
}
vim.cmd.colorscheme "onedark"

-- Editor settings
vim.opt.nu         = true
vim.opt.scrolloff  = 4

vim.opt.autoindent = true
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4

vim.opt.hlsearch   = false
vim.opt.incsearch  = true
