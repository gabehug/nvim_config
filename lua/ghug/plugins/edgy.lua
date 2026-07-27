return {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    opts = {
        bottom = {
            {
                ft = "trouble",
                size = { height = 0.2 },
            },
            { ft = "qf", title = "QuickFix" },
            {
                ft = "help",
                size = { height = 20 },
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
            },
        },
        left = {
            {
                ft = "neo-tree",
                title = "Neo-Tree",
                filter = function(buf, win)
                    return vim.b[buf].neo_tree_source == "filesystem"
                    and vim.api.nvim_win_get_config(win).relative == ""
                end,
                size = { height = 0.5 },
            },
        },
        keys = {
            ["q"] = function(win)
                win:close()
            end,
            ["<c-q>"] = function(win)
                win:hide()
            end,
            ["Q"] = function(win)
                win.view.edgebar:close()
            end,
            ["]w"] = function(win)
                win:next({ visible = true, focus = true })
            end,
            ["[w"] = function(win)
                win:prev({ visible = true, focus = true })
            end,
            ["<leader><Right>"] = function(win) win:resize("width", 10) end,
            ["<leader><Left>"]  = function(win) win:resize("width", -10) end,
            ["<leader><Up>"]    = function(win) win:resize("height", 10) end,
            ["<leader><Down>"]  = function(win) win:resize("height", -10) end,
            ["Ò"] = function(win) win:resize("width", 15) end,
            ["Ó"] = function(win) win:resize("width", -15) end,
        },
    },
}

