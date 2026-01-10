return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
                packages = {
                    enable = true
                },
				shortcut = {
					{
						desc = "󰊳 Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find Text",
						group = "Label",
						action = "Telescope live_grep",
						key = "t",
					},
					{
						desc = "Tree Explorer",
						group = "DiagnosticHint",
						action = "Neotree",
						key = "e",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
