---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- require "plugins.configs.lspconfig"
			require "configs.lspconfig"
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- rust
        "rust-analyzer",
      },
    },
	},

	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = overrides.treesitter, },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
      git = {
        enable = true,
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		config = function()
      local options = {
        lsp_fallback = true,

        formatters_by_ft = {
          -- Divine Intellect Languages
          lua = { "stylua" },

          -- rust 
          rust = { "rustfmt" },

          -- Web Dev shit
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          html = { "prettier" },

          -- Data Science & AI stuff
          python = { "black" },

          sh = { "shfmt" },

          -- Joke langs 
          haskell = { "stylish-haskell" }
        },
      }
      require("conform").setup(options)
		end,
	},

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			-- Mapping tab is already used by NvChad
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
			-- The mapping is set to other key, see custom/lua/mappings
			-- or run <leader>ch to see copilot mapping section
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		-- dependencies = {
		-- 	"JoosepAlviste/nvim-ts-context-commentstring",
		-- },
		opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "prisma",
        "haskell",
        "python",
        "zig",
        "rust",
        "vhdl",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
		-- config = function(_, opts)
		-- 	dofile(vim.g.base46_cache .. "syntax")
		-- 	require("nvim-treesitter.configs").setup(opts)
		--
		-- 	-- use markdown parser for mdx files
		-- 	vim.treesitter.language.register("mdx", "markdown", "tsx")
		-- end,
	},

	-- {
	-- 	"numToStr/Comment.nvim",
	-- 	dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	-- 	config = function()
	-- 		require("Comment").setup({
	-- 			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	-- 		})
	-- 	end,
	-- },

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
