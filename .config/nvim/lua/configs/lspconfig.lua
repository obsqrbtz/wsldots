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

local function setup_server(server)
  local ok, opts = pcall(require, "configs.lsp.servers." .. server)
  if ok then
    vim.lsp.config(server, opts)
  else
    vim.notify("Could not load config for" + server)
  end
end

setup_server "rust_analyzer"
