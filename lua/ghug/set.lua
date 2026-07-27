vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Highlighting on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-hightlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Setup for OSC 52 clipboard
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}

-- Paste from buffer on p
vim.opt.clipboard = "unnamedplus"

-- Syntax highlighting
-- example and can add more later on
vim.cmd [[hi @function.builtin guifg=red]]

-- Use rg instead of ripgrep
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"

