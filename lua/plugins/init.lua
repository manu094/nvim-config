return {

	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	{
		"tpope/vim-dispatch",
		opt = true,
		cmd = { "Dispatch", "Make", "Focus", "Start" },
	}, -- some async stuff
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
	}, -- Previews markdown in browser
	"andymass/vim-matchup", -- enhances the "%" command
	"zaldih/themery.nvim",

	-- Enhanced motions
	"wellle/targets.vim", -- vim plugin that provides additional text objects

	-- Colorschemes
	"folke/tokyonight.nvim", -- really cool colorscheme, works with most plugins
	"lunarvim/colorschemes", -- a bunch of colorschemes
	"sainnhe/everforest", -- this has to be my favorite
	"sainnhe/gruvbox-material", -- incredibly beautiful
	"AlexvZyl/nordic.nvim", -- trying things out
	"rebelot/kanagawa.nvim", -- Top rated

	-- LSP
	"neovim/nvim-lspconfig", -- enable lsp

	-- Treesitter

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Debugger
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"nvim-neotest/nvim-nio",
	"rcarriga/nvim-dap-ui",
	"folke/neodev.nvim",
	"theHamsta/nvim-dap-virtual-text",

	-- Winbar
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	"romgrk/barbar.nvim",
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"mong8se/actually.nvim",
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
}
