return {
    'echasnovski/mini.nvim',
    config = function()
        -- setup for mini.statusline
        local statusline = require 'mini.statusline'
        statusline.setup { use_icons = true }

        -- setup for mini.pairs
        local pairs = require 'mini.pairs'
        pairs.setup {
            modes = { insert = true, command = false, terminal = false }
        }

        -- setup for mini.comment
        local comment = require 'mini.comment'
        comment.setup {}

    end
}

