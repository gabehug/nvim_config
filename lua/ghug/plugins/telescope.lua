-- Telescope plugin setup
return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "%.git/",
                    "bazel%-",
                    "node_modules/",
                    "%.venv/",
                    "venv/",
                    "__pycache__/",
                    "%.mypy_cache/",
                    "%.pytest_cache/",
                    "%.ruff_cache/",
                    "%.idea/",
                    "%.vscode/",
                    "%.pyc$",
                },
                find_files = {
                    hidden = true,
                },
                -- Search hidden source files while honoring .gitignore.
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden",
                    "--glob=!**/.git/**",
                    "--glob=!**/bazel-*/**",
                    "--glob=!**/node_modules/**",
                    "--glob=!**/.venv/**",
                    "--glob=!**/venv/**",
                    "--glob=!**/__pycache__/**",
                    "--glob=!**/.mypy_cache/**",
                    "--glob=!**/.pytest_cache/**",
                    "--glob=!**/.ruff_cache/**",
                    "--glob=!**/.idea/**",
                    "--glob=!**/.vscode/**",
                },
                layout_strategy = "vertical", -- or "horizontal" or "center"
                layout_config = {
                    vertical = {
                        width = 0.6,  -- 60% of screen width
                        height = 0.7, -- 70% of screen height
                        preview_cutoff = 20,
                        prompt_position = "top",
                        mirror = true,
                    },
                    horizontal = {
                        width = 0.7,
                        height = 0.7,
                        preview_width = 0.5,
                    },
                    center = {
                        width = 0.5,
                        height = 0.5,
                    },
                },
            },
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({ hidden = true, follow = true })
        end, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.live_grep({ hidden = true, follow = true })
        end, {})
    end,
}
