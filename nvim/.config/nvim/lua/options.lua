require "nvchad.options"

-- add yours here!

local o = vim.o

o.cursorlineopt = "both"

-- Pick up changes made to files outside of nvim (see autocmds.lua for the trigger)
o.autoread = true
