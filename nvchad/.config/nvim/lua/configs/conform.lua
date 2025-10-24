local options = {
  formatters_by_ft = {
    -- Divine Intellect Languages
    lua = { "stylua" },

    -- based
    c = { "clang-format" },
    cpp = { "clang-format" },
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

    -- cringe
    scala = { "scalafmt" },

    -- Joke langs
    haskell = { "stylish-haskell" },

    -- (system)verilog
    verilog = { "verible-verilog-format" },
    systemverilog = { "verible-verilog-format" },
  },

  formatters = {
    ["verible-verilog-format"] = {
      command = "verible-verilog-format",
      args = { "-" },
      stdin = true,
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)

return options
