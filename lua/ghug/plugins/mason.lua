return {
    -- First spec: mason-lspconfig with its dependencies
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                }
            },
            "neovim/nvim-lspconfig",
        },
    },

    -- Second spec: lazydev.nvim
    {
        "folke/lazydev.nvim",
        ft = "lua", -- Load only on Lua files
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } }, -- Load luvit types for vim.uv
            },
        },
    },
}
