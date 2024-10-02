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
		group = "", -- symbol prepended to a group
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
	-- Visual changes
	{ "<leader>a", group = "Appearance...", icon = "󱠓" },
	{
		"<leader>a/",
		"<cmd>nohlsearch<CR>",
		desc = "Erase Highlight",
		mode = "n",
		icon = "󰇾",
	},
	{
		"<leader>ac",
		"<cmd>Themery<CR>",
		desc = "Colorschemes",
		mode = "n",
		icon = "",
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

    -- Git keymaps
    { "<leader>g", group = "Git...", icon = "󰊢" },
    {
      "<leader>gs",
      "<cmd>!git status<CR>",
      desc = "Git Status",
      icon = "󱖫",
    },
    {
      "<leader>ga",
      "<cmd>!git add -A<CR>",
      desc = "Git Add All",
      icon = "",
    },
    {
      "<leader>gc",
      ":!git commit -m ",
      desc = "Git Commit (+ message)",
      icon = "󰜘",
    },
    {
      "<leader>gp",
      "<cmd>!git push<CR>",
      desc = "Git Push",
      icon = "",
    },
    {
      "<leader>gP",
      "<cmd>!git pull<CR>",
      desc = "Git Pull",
      icon = "󰓂",
    },

	-- LSP keymaps
	{ "<leader>l", group = "LSP...", icon = "󰍉" },
	-- { "<leader>lg", group = "Go to...", icon = "" },
	{
		"<leader>ld",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		desc = "Go to Definition",
		icon = "󰅩",
	},
	{
		"<leader>lD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		desc = "Go to Declaration",
		icon = "󰅲",
	},
	{
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		desc = "Get References",
		icon = "",
	},
	{
		"<leader>lI",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		desc = "Go to Implementation",
		icon = "󰯗",
	},
	{
		"<leader>ll",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		desc = "Get Diagnostic",
		icon = "󱕠",
	},
	{
		"<leader>lj",
		"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
		desc = "Next Diagnostic",
		icon = "󰼧",
	},
	{
		"<leader>lk",
		"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		desc = "Previous Diagnostic",
		icon = "󰼨",
	},
	{
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
		desc = "Format",
		icon = "󰉼",
	},
	{
		"<leader>li",
		"<cmd>LspInfo<cr>",
		desc = "LSP Info",
		icon = "",
	},
	{
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<cr>",
		desc = "Code Action",
		icon = "",
	},
})
