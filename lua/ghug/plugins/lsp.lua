-- lua/ghug/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    config = function()
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

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                if not client:supports_method('textDocument/willSaveWaitUntil')
                    and client:supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = args.buf,
                                id = client.id,
                                timeout_ms = 1000
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
