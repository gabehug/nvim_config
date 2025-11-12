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
            width = 'block',
            backgrounds = {
                'RenderMarkdownH1Bg',
                'RenderMarkdownH2Bg',
                'RenderMarkdownH3Bg',
                'RenderMarkdownH4Bg',
                'RenderMarkdownH5Bg',
                'RenderMarkdownH6Bg',
            },
        },
        dash = {
            highlight = 'RenderMarkdownDash',
        },
        bullet = {
            icons = { "•", "•", "•" }, -- Custom bullet points
        },
        render_modes = { 'n', 'c' },
    },
    config = function(_, opts)
        require('render-markdown').setup(opts)

        -- H1: Bright Red - Most prominent
        vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', {
            bg = '#E78284',
            fg = '#303446',
            bold = true
        })
        -- H2: Bright Blue - Noticeable
        vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', {
            bg = '#8CAAEE',
            fg = '#303446'
        })
        -- H3: Bright Cyan - Mid-level
        vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', {
            bg = '#81C8BE',
            fg = '#303446'
        })
        -- H4: Bright Green - Subtle
        vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', {
            bg = '#A6D189',
            fg = '#303446'
        })
        -- H5: Bright Yellow - Most subtle
        vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', {
            bg = '#E5C890',
            fg = '#303446'
        })
        -- H6: Bright Purple - Very prominent
        vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', {
            bg = '#F4B8E4',
            fg = '#303446',
            bold = true
        })
        -- Dash Highlighting
        vim.api.nvim_set_hl(0, 'RenderMarkdownDash', {
            fg = '#E78284'
        })
    end,
}
