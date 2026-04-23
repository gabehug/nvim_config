return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = {
            keymap = { preset = "default" },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
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
                                text = function(ctx)
                                    return ctx.kind_icon .. ctx.icon_gap
                                end,
                                highlight = function(ctx)
                                    return { { group = ctx.kind_hl, priority = 20000 } }
                                end,
                            },
                            kind = {
                                ellipsis = false,
                                width = { fill = true },
                                text = function(ctx)
                                    return ctx.kind
                                end,
                                highlight = function(ctx)
                                    return ctx.kind_hl
                                end,
                            },
                        },
                    },
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
    },
}
