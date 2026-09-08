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

        local map = require 'mini.map'
        map.setup {
            integrations = {
                map.gen_integration.builtin_search(),
                map.gen_integration.diagnostic(),
                map.gen_integration.gitsigns(),
            },
            symbols = {
                encode = map.gen_encode_symbols.dot '3x2',
                scroll_line = '▶',
                scroll_view = '┃',
            },
            window = {
                show_integration_count = false,
                width = 10,
                winblend = 100,
            },
        }

        -- Open map automatically
        vim.api.nvim_create_autocmd('BufEnter', {
            callback = function() map.open() end,
        })
    end
}
