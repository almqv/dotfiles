-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

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

M = {
  base46 = {
    theme = "doomchad",
    theme_toggle = { "doomchad", "everforest_light" },
  },
}

return M
