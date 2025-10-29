-- Telescope plugin setup
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",                   -- Ripgrep
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                },
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        width = 300,
                        height = 100,
                        prompt_position = "top",
                        mirror = true,
                    },
                },
            },
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    end,
}
