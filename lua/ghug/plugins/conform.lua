return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                rust = { "rustfmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                go = { "gofmt", "goimports" },
            },
            format_on_save = function(bufnr)
                if vim.b[bufnr].disableConform or vim.g.disableConform then
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })
    end,
}