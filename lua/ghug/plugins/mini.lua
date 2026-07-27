return {
    'echasnovski/mini.nvim',
    config = function()
        -- local statusline = require 'mini.statusline'
        -- statusline.setup { use_icons = true }

        local pairs = require 'mini.pairs'
        pairs.setup {
            modes = { insert = true, command = false, terminal = false }
        }

        local comment = require 'mini.comment'
        comment.setup {}

        local surround = require 'mini.surround'
        surround.setup()
    end
}

