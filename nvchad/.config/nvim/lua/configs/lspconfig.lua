local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "vhdl_ls", "hls", "tailwindcss", "pyright", "julials" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- typescript
-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- })

-- Haskell
-- lspconfig.hls.setup({
-- 	on_attach = on_attach,
-- 	on_init = on_init,
-- 	capabilities = capabilities,
-- 	filetypes = { "haskell", "lhaskell", "cabal" },
-- })
