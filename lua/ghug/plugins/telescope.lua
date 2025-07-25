-- Telescope plugin setup
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                find_files = {
                    hidden = true,
                },
                -- Show hidden files and git ignored files
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",            -- Include hidden files
                    "--no-ignore",         -- Include gitignored files
                },
                file_ignore_patterns = {}, -- Remove default ignore patterns
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

        -- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({
                hidden = true,
                no_ignore = true,
            })
        end)
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = { "--hidden", "--no-ignore" }
            })
        end)
    end,
}
