return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Set up the build command
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = { "c", "lua", "typescript", "javascript", "python", "vim", "vimdoc", "query", "markdown", "markdown_inline", "yaml" },
                auto_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                },
            }
        end,
    }
}
