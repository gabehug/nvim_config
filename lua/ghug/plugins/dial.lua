return {
    "monaqa/dial.nvim",
    keys = {
        {
            "<C-a>",
            function()
                return require("dial.map").inc_normal()
            end,
            expr = true,
            desc = "Increment",
        },
        {
            "<C-x>",
            function()
                return require("dial.map").dec_normal()
            end,
            expr = true,
            desc = "Decrement",
        },
        {
            "g<C-a>",
            function()
                return require("dial.map").inc_visual()
            end,
            expr = true,
            desc = "Increment",
        },
        {
            "g<C-x>",
            function()
                return require("dial.map").dec_visual()
            end,
            expr = true,
            desc = "Decrement",
        },
        {
            "g<C-a>",
            function()
                return require("dial.map").inc_gvisual()
            end,
            expr = true,
            desc = "Increment",
        },
        {
            "g<C-x>",
            function()
                return require("dial.map").dec_gvisual()
            end,
            expr = true,
            desc = "Decrement",
        },
    },
    config = function()
        local dial = require("dial")
        dial.setup({
            groups = {
                default = {
                    dial.number.hex,
                    dial.number.binary,
                    dial.number.octal,
                    dial.number.decimal,
                    dial.constant.bool,
                    dial.operator,
                },
            },
        })
    end,
}