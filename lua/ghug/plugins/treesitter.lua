return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Set up the build command
  config = function()
    local configs = require("nvim-treesitter.configs")

    -- Configure Treesitter settings
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

