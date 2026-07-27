return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            enabled = true,
            sections = {
                { section = "header" },
                { section = "keys", indent = 2, padding = 1, title = "Keymaps", icon = " "  },
                { section = "projects", limit = 5, indent = 2, padding = 1, title = "Directories", icon = " " },
                { section = "recent_files", limit = 5, indent = 2, padding = 1, title = "Recent Files", icon = " " },
                { section = "startup" },
            },
        },
    },
}
