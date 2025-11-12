local function shorten_path(path, max_len)
    if #path <= max_len then
        return path
    end
    local parts = vim.split(path, '/', { plain = true })
    local shortened = ''
    for i = #parts, 1, -1 do
        local candidate = table.concat(parts, '/', i)
        if #candidate <= max_len then
            return '/' .. candidate
        end
    end
    return '/' .. parts[#parts]
end

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        function()
                            local path = vim.fn.expand('%:~:.')
                            return path
                            -- shorten_path(path, 40)
                        end,
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
            })
        end,
    },
}
