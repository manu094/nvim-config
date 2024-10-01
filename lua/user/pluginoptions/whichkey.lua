local wk = require("which-key")
wk.setup({
	preset = "modern",
	filter = function(mapping)
		-- example to exclude mappings without a description
		return mapping.desc and mapping.desc ~= ""
	end,
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
	},
	win = {
		title = true,
		title_pos = "center",
	},
	layout = {
		width = { min = 20 },
		spacing = 3,
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "󰄷", -- symbol prepended to a group
		ellipsis = "…",
		-- set to false to disable all mapping icons,
		-- both those explicitly added in a mapping
		-- and those from rules
		mappings = true,
		colors = true,
		-- used by key format
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰭜",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},
})

wk.add({
	-- Basic Neovim keymaps
	{
		"<leader>e",
		"<cmd>Lex 25<CR>",
		desc = "Open Explorer",
		mode = "n",
		icon = "󰙅",
	},
	{
		"<leader>/",
		"<cmd>nohlsearch<CR>",
		desc = "Erase Highlight",
		mode = "n",
		icon = "󰇾",
	},

	-- Telescope keymaps
	{ "<leader>f", group = "Find...", icon = "" },
	{
		"<leader>ff",
		"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
		desc = "Find File",
		mode = "n",
	},
	{
		"<leader>ft",
		"<cmd>Telescope live_grep<CR>",
		desc = "Find Text",
		mode = "n",
	},

	-- LSP keymaps
	{ "g", group = "Go to...", icon = "" },
	{
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		desc = "Go to Definition",
		icon = "󰘦",
	},
	{
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		desc = "Go to Declaration",
		icon = "󰅲",
	},
	{
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		desc = "Get References",
		icon = "",
	},
	{
		"gI",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		desc = "Go to Implementation",
		icon = "󰯗",
	},
	{
		"gl",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		desc = "Get Diagnostic",
		icon = "",
	},
})
