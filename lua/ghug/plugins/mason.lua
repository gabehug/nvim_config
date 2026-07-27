return {
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)

            require("mason-lspconfig").setup({
                automatic_enable = false,
                ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "ts_ls", "gopls" },
            })

            require("mason-tool-installer").setup({
                ensure_installed = { "pyright", "lua-language-server", "rust-analyzer", "typescript-language-server", "gopls" },
                auto_update = false,
                run_on_start = true,
            })
        end,
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
