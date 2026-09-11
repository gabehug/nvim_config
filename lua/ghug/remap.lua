vim.keymap.set("n", "<leader><leader>x", "<cmd>source<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
-- vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- Window navigation
vim.keymap.set("n", "˙", "<C-w>h", { desc = "Focus left window (Option-h)" })
vim.keymap.set("n", "¬", "<C-w>l", { desc = "Focus right window (Option-l)" })

-- Neo-tree
vim.keymap.set("n", "<leader><tab>", "<cmd>Neotree toggle position=left<CR>", { desc = "Neo-tree (sidebar)" })
vim.keymap.set("n", "<leader>t", "<cmd>Neotree float toggle<CR>", { desc = "Neo-tree (float)" })

-- Git-blame toggle
vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>", { desc = "Toggle git blame" })
