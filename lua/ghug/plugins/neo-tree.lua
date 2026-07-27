return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    opts = {
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
            follow_current_file = { enabled = true },
            hijack_netrw_behavior = "open_default",
            use_libuv_file_watcher = true,
            blind_to_cwd = false,
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
            },
        },
    },
}

