return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- mason.nvim
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "clang-format",
          "cmake-format",
          "csharpier",
          "rustfmt",
          "stylua",
          "prettier",
          "prettierd",
          "beautysh",
          "shellcheck",
        },
        run_on_start = true,
        start_delay = 3000,
        debounce_hours = 24,
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
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

      local mason_lspconfig = require "mason-lspconfig"
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities
      -- Temp workaround while setup_handlers do not work
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        -- Specific rust-analyzer setup.
        if server == "rust_analyzer" then
          vim.lsp.config(server, {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                cargo = {
                  features = "all",
                },
                check = {
                  command = "clippy",
                },
                interpret = {
                  tests = true,
                },
              },
            },
          })
        -- Other servers.
        else
          vim.lsp.config(server, {
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
