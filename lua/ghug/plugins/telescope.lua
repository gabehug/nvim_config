-- Telescope plugin setup
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        width = 300,
                        height = 100,
                    },
                },
            },
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
