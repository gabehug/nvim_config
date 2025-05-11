return {
  -- Mason plugin
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- optional: updates registry on install
    config = function()
      require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                 },
             },
        })
    end,
  },

  -- Mason LSPConfig bridge (so Mason can install LSPs configured via lspconfig)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "elixirls" }, -- add the LSPs you want auto-installed
        automatic_installation = true,
      })
    end,
  },

  -- LSPConfig (required for configuring the actual LSPs)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Example: Lua language server setup
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Add more language servers here:
      -- lspconfig.tsserver.setup({})
      -- lspconfig.elixirls.setup({})
    end,
  },
}

