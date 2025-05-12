vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
})

require("mason").setup()
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
