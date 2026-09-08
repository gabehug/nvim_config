-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
-- This puts lazy into the runtimepath for neovim
vim.opt.runtimepath:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- {
        --     "catppuccin/nvim",
        --     name = "catppuccin",
        --     opts = {
        --         flavour = "frappe",
        --         transparent_background = true,
        --         styles = {
        --             sidebars = "transparent",
        --             floats = "transparent",
        --         },
        --     },
        --     config = function(_, opts)
        --         require("catppuccin").setup(opts)
        --         vim.cmd.colorscheme "catppuccin"
        --     end
        -- },
        -- {
        --     "rebelot/kanagawa.nvim",
        --     lazy = false,
        --     priority = 1000,
        --     opts = {
        --         theme = "dragon",
        --         transparent = true,
        --     },
        --     config = function(_, opts)
        --         require("kanagawa").setup(opts)
        --         vim.cmd.colorscheme "kanagawa-dragon"
        --         vim.api.nvim_set_hl(0, "LineNr", { fg = "#54546d", bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c5c9c5", bg = "NONE", bold = true })
        --         vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#76946a", bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#dca561", bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#c34043", bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#c34043", bg = "NONE" })
        --         vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#dca561", bg = "NONE" })
        --         -- Floating windows keep solid bg
        --         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181616" })
        --         vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#54546d", bg = "#181616" })
        --         vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#dca561", bg = "#181616", bold = true })
        --     end,
        -- },
        {
            "rebelot/kanagawa.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                require("kanagawa").setup({
                    theme = "dragon",
                    transparent = true,
                    colors = {
                        theme = {
                            all = {
                                ui = {
                                    bg_gutter = "none"
                                }
                            }
                        }
                    },
                    overrides = function(colors)
                        local theme = colors.theme

                        local makeDiagnosticColor = function(color)
                            local c = require("kanagawa.lib.color")
                            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                        end

                        return {
                            -- solid floating windows
                            NormalFloat                 = { bg = theme.ui.bg },
                            FloatBorder                 = { fg = theme.ui.shade0, bg = theme.ui.bg },
                            FloatTitle                  = { fg = theme.ui.special, bg = theme.ui.bg, bold = true },

                            -- neo-tree
                            -- Neo-tree (Revised approach)
                            -- Link NeoTree's main window to Normal to get default bg, then override other groups
                            NeoTreeNormal               = { bg = theme.ui.bg_m1 }, -- Explicitly set main background for consistency
                            NeoTreeNormalNC             = { bg = theme.ui.bg_m1 }, -- Non-current window
                            NeoTreeVertSplit            = { fg = theme.ui.shade0, bg = theme.ui.bg_m1 },
                            NeoTreeWinSeparator         = { fg = theme.ui.shade0, bg = theme.ui.bg_m1 },
                            NeoTreeEndOfBuffer          = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },

                            NeoTreeRootName             = { fg = theme.ui.special, bold = true },
                            NeoTreeDirectoryName        = { fg = theme.ui.fg_dim },                               -- Dim directories
                            NeoTreeFileName             = { fg = theme.ui.fg },                                   -- Files
                            NeoTreeFileNameOpened       = { fg = theme.ui.special },                              -- Opened file (Kanagawa's special color)

                            NeoTreeSelected             = { bg = theme.ui.bg_m2, fg = theme.ui.fg, bold = true }, -- Highlighted entry

                            NeoTreeGitAdded             = { fg = theme.vcs.added },
                            NeoTreeGitModified          = { fg = theme.vcs.changed },
                            NeoTreeGitDeleted           = { fg = theme.vcs.removed },
                            NeoTreeGitUntracked         = { fg = theme.vcs.added },

                            NeoTreeIndentMarker         = { fg = theme.ui.shade0 },
                            NeoTreeExpander             = { fg = theme.ui.shade0 },

                            NeoTreeFileStats            = { fg = theme.ui.shade0 }, -- Metadata
                            NeoTreeFileStatsHeader      = { fg = theme.ui.fg_dim, bold = true },

                            -- Header/Footer (Status lines in neo-tree)
                            NeoTreeStatusLine           = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
                            NeoTreeStatusLineNC         = { fg = theme.ui.fg, bg = theme.ui.bg_p1 },
                            NeoTreeTabActive            = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
                            NeoTreeTabInactive          = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                            NeoTreeTabSeparatorActive   = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                            NeoTreeTabSeparatorInactive = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },

                            -- Floating windows within Neo-tree (like help or search)
                            NeoTreeFloatNormal          = { bg = theme.ui.bg_m1 },
                            NeoTreeFloatBorder          = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                            NeoTreeFloatTitle           = { fg = theme.ui.special, bg = theme.ui.bg_m1, bold = true },

                            -- telescope with visible float border
                            TelescopeTitle              = { fg = theme.ui.special, bold = true },
                            TelescopePromptNormal       = { bg = theme.ui.bg_p1 },
                            TelescopePromptBorder       = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                            TelescopeResultsNormal      = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                            TelescopeResultsBorder      = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                            TelescopePreviewNormal      = { bg = theme.ui.bg_dim },
                            TelescopePreviewBorder      = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },


                            -- cmdline styled like telescope prompt
                            NoiceCmdlinePopup          = { bg = theme.ui.bg_p1 },
                            NoiceCmdlinePopupBorder    = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                            NoiceCmdlinePopupTitle     = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
                            NoiceCmdlineIcon           = { fg = theme.ui.special, bg = theme.ui.bg_p1 },
                            NoicePopup                 = { bg = theme.ui.bg_p1 },
                            NoicePopupBorder           = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },

                            -- dark popup menu
                            Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                            PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
                            PmenuSbar                  = { bg = theme.ui.bg_m1 },
                            PmenuThumb                 = { bg = theme.ui.bg_p2 },

                            -- diagnostic tinting
                            DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                            DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                            DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

                            -- lazy/mason keep dark bg
                            LazyNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                            MasonNormal                = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        }
                    end,
                })
                vim.cmd.colorscheme "kanagawa-dragon"
            end,
        },
        { import = "ghug/plugins" },
    },
})
