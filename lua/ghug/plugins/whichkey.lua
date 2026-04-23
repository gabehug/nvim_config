return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.timeout = true
        vim.opt.timeoutlen = 300
    end,
    opts = {
        spec = {
            { "<leader><tab>", group = "tabs" },
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>gh", group = "hunks" },
            { "<leader>q", group = "quit/session" },
            { "<leader>s", group = "search" },
            { "<leader>u", group = "ui" },
            { "<leader>w", group = "windows" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
            { "gz", group = "surround" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
    end,
}