local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "clangd",
    "csharp_ls",
    "cmake",
    "rust_analyzer",
    "ts_ls",
    "bashls",
  },
}

local lspconfig = require "lspconfig"

-- Setup each installed server
for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server == "rust_analyzer" then
    opts.settings = {
      ["rust-analyzer"] = {
        cargo = { features = "all" },
        check = { command = "clippy" },
        interpret = { tests = true },
      },
    }
  end

  lspconfig[server].setup(opts)
end
