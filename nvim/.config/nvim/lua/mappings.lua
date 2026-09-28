require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Format with conform
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "formatting" })

-- Keep the selection after indenting
map("v", ">", ">gv", { desc = "indent" })

-- Move selection up/down with K/J in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

-- Copilot accept in insert mode (guarded: copilot.vim is not in the plugin list)
map("i", "<C-l>", function()
  if vim.fn.exists "*copilot#Accept" == 1 then
    vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
  end
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })
