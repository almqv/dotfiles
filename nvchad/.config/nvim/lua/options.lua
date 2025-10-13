require("nvchad.options")

-- add yours here!

local o = vim.o
o.cursorlineopt = "both"

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	command = "if mode() != 'c' | checktime | endif",
})
