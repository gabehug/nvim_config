require("ghug.remap")
require("ghug.set")
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup {}
require("lspconfig").ts_ls.setup {}
require("lspconfig").tailwindcss.setup {}
