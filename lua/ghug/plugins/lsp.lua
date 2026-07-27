-- lua/ghug/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Supress LSP progress notifications
        vim.lsp.handlers["$/progress"] = function() end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local blink_ok, blink = pcall(require, "blink.cmp")
        if blink_ok and blink.get_lsp_capabilities then
            capabilities = blink.get_lsp_capabilities(capabilities)
        end

        local servers = {
            pyright = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            },
            rust_analyzer = {},
            ts_ls = {},
            gopls = {},
        }

        for server_name, server_opts in pairs(servers) do
            server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
            vim.lsp.config(server_name, server_opts)
            vim.lsp.enable(server_name)
        end

        local format_group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = false })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                local buf = args.buf

                -- navic for breadcrumbs
                local ok, navic = pcall(require, "nvim-navic")
                if ok and client:supports_method("textDocument/documentSymbol") then
                    navic.attach(client, buf)
                end

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
                    vim.api.nvim_clear_autocmds({ group = format_group, buffer = buf })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = format_group,
                        buffer = buf,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = buf,
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
