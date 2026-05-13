-- lua/ghug/plugins/blink.lua
return {
    "saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
}
