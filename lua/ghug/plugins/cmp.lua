return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('cmp').setup {
                sources = {
                    { name = 'codeium' },
                    -- ... (other sources)
                },
            }
        end,
    },
}
