local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "beautysh" },
    sh = { "shellcheck" },
    zsh = { "beautysh" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    cmake = { "cmake_format" },
    cs = { "csharpier" },
    rust = { "rustfmt" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    ["*"] = { "lsp_format" }, -- fallback formatter
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
