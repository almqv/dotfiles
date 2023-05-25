--      __     ___
--    __\ \   / (_)_ __ ___
--   / _ \ \ / /| | '_ ` _ \
--  |  __/\ V / | | | | | | |
--   \___| \_/  |_|_| |_| |_|
--        epsilons Viim

require("evim.init")

-- Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme "base16-gruvbox-dark-hard"

-- Editor settings
vim.opt.nu         = true
vim.opt.scrolloff  = 4

vim.opt.autoindent = true
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4

vim.opt.hlsearch   = false
vim.opt.incsearch  = true
