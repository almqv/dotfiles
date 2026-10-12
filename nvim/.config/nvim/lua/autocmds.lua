require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Re-check files for outside changes (pairs with `autoread` in options.lua)
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
})

-- Set filetype for SystemVerilog files
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sv", "*.svh" },
  callback = function()
    vim.bo.filetype = "systemverilog"
  end,
})
