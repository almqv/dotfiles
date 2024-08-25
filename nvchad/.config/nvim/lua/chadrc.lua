-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

local custom_logo = {
	"                                                         ",
	"                                                         ",
	"          ________________________________               ",
	"         /                                '-_            ",
	"        /      .  |  .                       \\           ",
	"       /      : \\ | / :                       \\          ",
	"      /        '-___-'                         \\         ",
	"     /_________________________________________ \\        ",
	"          _______| |________________________--''-L       ",
	"         /       F J                              \\      ",
	"        /       F   J                              L     ",
	"       /      :'     ':                            F     ",
	"      /        '-___-'                            /      ",
	"     /_________________________________________--'       ",
	"                                                         ",
	"                                                         ",
}

local function split_string(s)
	local t = {}
	for str in string.gmatch(s, "([^\n]+)") do
		table.insert(t, str)
	end
	return t
end

M.ui = {
	theme = "gruvchad",
	theme_toggle = { "gruvchad", "blossom_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = {
		theme = "vscode",
	},

	hl_override = {
		NvDashAscii = { bg = "blue", fg = "white" },
	},

	nvdash = {
		load_on_startup = true,
		header = custom_logo,
		width = 100,
	},
}

return M
