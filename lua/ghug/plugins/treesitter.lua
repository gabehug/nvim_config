return {
    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("nvim-treesitter.install").prefer_git = true
        end,
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "markdown", "markdown_inline",
                    "python", "javascript", "typescript",
                    "lua", "bash", "html", "css", "json", "yaml"
                },
                auto_install = true,
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
