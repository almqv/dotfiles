require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "rust_analyzer",
  "vhdl_ls",
  "hls",
  "tailwindcss",
  "pyright",
  "julials",
  "lua_ls",
  "verible", -- systemverilog
  -- "svls", -- systemverilog
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
