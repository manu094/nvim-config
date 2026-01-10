return {

	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	{
		"tpope/vim-dispatch",
		opt = true,
		cmd = { "Dispatch", "Make", "Focus", "Start" },
	}, -- Some async stuff
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
	}, -- Previews markdown in browser
	"andymass/vim-matchup", -- Enhances the "%" command
	"ThePrimeagen/vim-be-good",

	-- Enhanced motions
	"wellle/targets.vim", -- Vim plugin that provides additional text objects
	"tpope/vim-surround",

	-- Git
	"tpope/vim-fugitive",

	-- Colorschemes
	{
		"zaldih/themery.nvim",
		priority = 1000,
	}, -- Colorscheme switcher
	"folke/tokyonight.nvim", -- Really cool colorscheme, works with most plugins
	"lunarvim/colorschemes", -- A bunch of colorschemes
	"sainnhe/everforest", -- This has to be my favorite
	"sainnhe/gruvbox-material", -- Incredibly beautiful
	"AlexvZyl/nordic.nvim", -- Trying things out
	"rebelot/kanagawa.nvim", -- Top rated

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
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		opts = {
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = false,
			insert_at_end = true,
		},
	},
	"mong8se/actually.nvim",
    -- Typst Preview
	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
}
