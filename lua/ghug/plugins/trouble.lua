return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
    opts = {
        icons = false,
        fold_open = "v",
        fold_closed = ">",
        signs = {
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info",
        },
        use_diagnostics_signs = false,
    },
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>cs",
            "<cmd>Trouble symbols toggle<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cS",
            "<cmd>Trouble lsp toggle<cr>",
            desc = "Workspace Symbols (Trouble)",
        },
        {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>xQ",
            "<cmd>Trouble quickfix toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    vim.cmd.cprev()
                end
            end,
            desc = "Previous trouble/quickfix item",
        },
        {
            "]q",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    vim.cmd.cnext()
                end
            end,
            desc = "Next trouble/quickfix item",
        },
    },
}