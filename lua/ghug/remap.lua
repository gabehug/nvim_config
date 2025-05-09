vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--[[vim.keymap.set({"n","v"}), "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true})
end, { desc = "Format file or range" })]]
