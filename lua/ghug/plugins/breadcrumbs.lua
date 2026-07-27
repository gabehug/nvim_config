return {
    "LunarVim/breadcrumbs.nvim",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    opts = {
        installer = {
            enabled = false,
        },
    },
    config = function()
        require("breadcrumbs").setup()
    end,
}
