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
                    "--hidden",
                    "--no-ignore-vcs",
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

        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ hidden = true, no_ignore = true, follow = true})
        end, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function() 
            builtin.live_grep({ hidden = true, no_ignore = true, follow = true})
        end, {})
            
    end,
}
