return {
    {
        'Exafunction/codeium.nvim',
        config = function()
            require('codeium').setup {
                workspace_root = {
                    find_root = function()
                        local root = require('plenary.path').new(vim.fn.getcwd())
                        return root:absolute()
                    end
                },
                enable_cmp_source = false,
                virtual_text = {
                    enabled = true,
                    manual = false,
                    filetypes = {
                        python = true,
                        lua = true,
                        markdown = true,
                        oil = false,
                    },
                    default_filetype_enabled = true,
                    idle_delay = 55,
                    virtual_text_priority = 65535,
                    map_keys = true,
                    key_bindings = {
                        accept = "<Tab>",
                        accept_word = "<C-y>",
                        accept_line = "<C-l>",
                        clear = "<C-x>"
                    }
                }
            }
        end,
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono'
            },

            completion = {
                documentation = { auto_show = true },
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label",    "label_description", gap = 1 },
                        },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                                highlight = function(ctx) return { { group = ctx.kind_hl, priority = 20000 } } end,
                            },
                            kind = {
                                ellipsis = false,
                                width = { fill = true },
                                text = function(ctx) return ctx.kind end,
                                highlight = function(ctx) return ctx.kind_hl end,
                            },
                        },
                    },
                },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    codeium = {
                        name = 'Codeium',
                        module = 'codeium.blink',
                        async = true,
                    },
                },
                per_filetype = {
                    python = { 'lsp', 'codeium', 'path', 'snippets', 'buffer' },
                    lua = { 'lsp', 'codeium', 'path', 'snippets', 'buffer' },
                    markdown = { 'lsp', 'codeium', 'path', 'snippets', 'buffer' },
                },
            },
        },
        opts_extend = { "sources.default" }
    },
}
