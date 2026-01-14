return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	opts = {
		-- Add 'typst' to the list of enabled filetypes
        preview = {
            icon_provider = "devicons",
        },
		filetypes = { "markdown", "typst" },

		-- Optional: specific settings for Typst
		typst = {
			enabled = true,
		},
	},
	-- Completion for `blink.cmp`
	-- dependencies = { "saghen/blink.cmp" },
}
