return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
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
        "scala",
        "verilog",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
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
          haskell = { "stylish-haskell" },

          -- systemverilog
          verilog = { "verible" },
        },
      }
      require("conform").setup(options)
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
