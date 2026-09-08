return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
        {
            "<leader>bd",
            function()
                local bufnr = vim.api.nvim_get_current_buf()
                local buftype = vim.bo[bufnr].buftype
                if buftype ~= "" then
                    return
                end

                local bufname = vim.fn.bufname(bufnr)
                local modified = vim.bo[bufnr].modified

                -- Find the next buffer to switch to before deleting
                local buffers = vim.api.nvim_list_bufs()
                local next_bufnr = nil
                for _, b in ipairs(buffers) do
                    if b ~= bufnr and vim.bo[b].buftype == "" and vim.api.nvim_buf_is_loaded(b) and vim.fn.buflisted(b) == 1 then
                        next_bufnr = b
                        break
                    end
                end

                if next_bufnr then
                    vim.api.nvim_set_current_buf(next_bufnr)
                end

                if modified then
                    vim.ui.input({ prompt = "Save " .. vim.fn.fnamemodify(bufname, ":t") .. "?" }, function(input)
                        if input == "y" then
                            vim.api.nvim_buf_call(bufnr, function()
                                vim.cmd("write")
                            end)
                            vim.api.nvim_buf_delete(bufnr, { force = false })
                        elseif input == "n" then
                            vim.api.nvim_buf_delete(bufnr, { force = true })
                        end
                    end)
                else
                    vim.api.nvim_buf_delete(bufnr, { force = false })
                end
            end,
            desc = "Delete buffer",
        },
        { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "Prev buffer" },
        { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "Next buffer" },
        { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>",   desc = "Close buffers to the left" },
        { "<leader>bl", "<cmd>BufferLineCloseRight<cr>",  desc = "Close buffers to the right" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
    opts = {
        options = {
            mode = "buffers",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "",
                    separator = true,
                },
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict)
                local s = ""
                for severity, count in pairs(diagnostics_dict) do
                    local icon = severity:match("error") and "  " or severity:match("warning") and "  " or "  "
                    s = s .. icon .. count
                end
                return s
            end,
            separator_style = "none",
            tab_size = 0,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_tab_indicators = false,
            always_show_bufferline = false,
        },
        highlights = {
            fill = { bg = { attribute = "bg", highlight = "Normal" } },

            background = { fg = "#727169", bg = "#171616" },
            buffer = { fg = "#727169", bg = "#171616" },
            buffer_visible = { fg = "#727169", bg = "#171616" },
            buffer_selected = { fg = "#c5c9c5", bg = { attribute = "bg", highlight = "Normal" }, bold = true },

            tab = { fg = "#727169", bg = "#171616" },
            tab_selected = { fg = "#c5c9c5", bg = { attribute = "bg", highlight = "Normal" }, bold = true },

            separator = { fg = "#171616", bg = "#171616" },
            separator_visible = { fg = "#171616", bg = "#171616" },
            separator_selected = { fg = "#dca561", bg = { attribute = "bg", highlight = "Normal" } },

            tab_separator = { fg = "#171616", bg = "#171616" },
            tab_separator_selected = { fg = "#dca561", bg = { attribute = "bg", highlight = "Normal" } },

            indicator_selected = { fg = "#dca561", bg = { attribute = "bg", highlight = "Normal" } },
        },
    },
}
