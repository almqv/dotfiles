-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "gruvbox_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "plugins"

-- Get the mappings
M.mappings = require "mappings"

-- Load the mapping because the devs are retarded and changed it from a good system to a bad one
local function set_mappings(mode, key, value)
  local opts = value.opts or {}
  opts.desc = value[2]
  vim.keymap.set(mode, key, value[1], opts)
end

for mode, mode_mappings in pairs(M.mappings.general) do
  for key, mapping in pairs(mode_mappings) do
    set_mappings(mode, key, mapping)
  end
end

return M
