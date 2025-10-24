require "nvchad.autocmds"

-- Set filetype for SystemVerilog files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sv", "*.svh" },
  callback = function()
    vim.bo.filetype = "systemverilog"
  end,
})
