return {
	{
		"f-person/auto-dark-mode.nvim",
		priority = 1001, -- before catppuccin and themery
		opts = {
			set_dark_mode = function()
				vim.opt.background = "dark"
				vim.cmd("colorscheme nightfox")
			end,
			set_light_mode = function()
				vim.opt.background = "light"
				vim.cmd("colorscheme dayfox")
			end,
			update_interval = 3000,
			fallback = "dark",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "auto", -- picks mocha/latte from vim.opt.background
			background = {
				dark = "mocha",
				light = "latte",
			},
			transparent_background = false,
			integrations = {
				treesitter = true,
				telescope = { enabled = true },
				which_key = true,
				gitsigns = true,
				nvimtree = true,
				neo_tree = true,
				mini = { enabled = true },
				noice = true,
				notify = true,
				barbar = true,
			},
		},
	},
}
