return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		config = function()
			require("blink.cmp").setup({
				keymap = { preset = "default" },
				appearance = {
					nerd_font_variant = "mono",
				},
			})
		end,
	},
}
