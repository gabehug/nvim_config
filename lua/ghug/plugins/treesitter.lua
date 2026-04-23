return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.config").setup({
                ensure_installed = { "lua", "python", "javascript", "typescript", "yaml" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end,
    },
}
