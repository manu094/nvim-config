local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("That didn't work")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({
		-- My plugins here
		"wbthomason/packer.nvim", -- Have packer manage itself
		"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
		"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
		{
			"tpope/vim-dispatch",
			opt = true,
			cmd = { "Dispatch", "Make", "Focus", "Start" },
		}, -- some async stuff
		{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" }, -- Previews markdown in browser
		"andymass/vim-matchup", -- enhances the "%" command
		"windwp/nvim-autopairs",
		"folke/which-key.nvim",
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
		{ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
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

<<<<<<< HEAD
    -- Colorschemes
    "folke/tokyonight.nvim", -- really cool colorscheme, works with most plugins
    "lunarvim/colorschemes", -- a bunch of colorschemes
    "sainnhe/everforest", -- this has to be my favorite
    "sainnhe/gruvbox-material", -- incredibly beautiful
    "AlexvZyl/nordic.nvim", -- trying things out
    "rebelot/kanagawa.nvim", -- Top rated
    "sontungexpt/witch",
    "rafamadriz/neon",
=======
		--cmp plugins
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
>>>>>>> 5fd11ad (Add multiple plugins)

		--snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",

		-- LSP
		"neovim/nvim-lspconfig", -- enable lsp
		"williamboman/mason.nvim", -- simple to use language server installer
		"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
		"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions
		"p00f/clangd_extensions.nvim", -- c/c++ LSP

		-- Telescope
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"BurntSushi/ripgrep",

		-- Treesitter
		"nvim-treesitter/nvim-treesitter",
		"p00f/nvim-ts-rainbow",
		"nvim-treesitter/playground",

		-- Git
		"lewis6991/gitsigns.nvim",

		-- Debugger
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"folke/neodev.nvim",
		"theHamsta/nvim-dap-virtual-text",

		-- Undo Tree
		"mbbill/undotree",

		-- Winbar
		{
			"Bekaboo/dropbar.nvim",
			requires = {
				"nvim-telescope/telescope-fzf-native.nvim",
			},
		},
		"romgrk/barbar.nvim",
		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			requires = { "nvim-tree/nvim-web-devicons" },
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
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
