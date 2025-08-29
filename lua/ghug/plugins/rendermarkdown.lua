return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {
        preset = 'none',
        code = {
            use_treesitter = true, -- custom code block icons
        },
        heading = {
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- Custom heading icons
        },
        bullet = {
            icons = { "•", "•", "•" }, -- Custom bullet points
        },
        render_modes = { 'n', 'c' },
    },
}
