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

	-- {
	-- 	"github/copilot.vim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		-- Mapping tab is already used by NvChad
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_assume_mapped = true
	-- 		vim.g.copilot_tab_fallback = ""
	-- 		-- The mapping is set to other key, see custom/lua/mappings
	-- 		-- or run <leader>ch to see copilot mapping section
	-- 	end,
	-- },

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
        "scala",
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

  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini", 
          extra_request_body = {
            -- timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
            temperature = 0.75,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

	{
	  "NvChad/nvim-colorizer.lua",
	  enabled = true
	},
}

return plugins
