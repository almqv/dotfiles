-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "flex-light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

return M
