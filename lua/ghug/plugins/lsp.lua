-- lua/ghug/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Supress LSP progress notifications
        vim.lsp.handlers["$/progress"] = function() end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "python", "lua", "rust", "typescript", "go" },
            callback = function(args)
                local filetype = args.match
                local servers = {
                    python = "pyright",
                    lua = "lua_ls",
                    rust = "rust_analyzer",
                    typescript = "ts_ls",
                    go = "gopls",
                }
                local server = servers[filetype]
                if server then
                    vim.lsp.enable(server)
                end
            end,
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = { globals = { "vim" } },
                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry = { enable = false },
                },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                local buf = args.buf

                -- Diagnostics
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = buf, desc = "Show diagnostic" })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = buf, desc = "Next diagnostic" })
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = buf, desc = "Prev diagnostic" })

                -- LSP
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover docs" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "Go to references" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })

                -- Format on save

                if
                    not client:supports_method("textDocument/willSaveWaitUntil")
                    and client:supports_method("textDocument/formatting")
                then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = args.buf,
                                id = client.id,
                                timeout_ms = 1000,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
