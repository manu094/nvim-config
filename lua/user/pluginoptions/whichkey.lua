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

-- Basic Neovim keymaps
wk.add({
	{
		"<leader>e",
		"<CMD>Lex 25<CR>",
		desc = "Open Explorer",
		mode = "n",
		icon = "󰙅",
	},
	{
		"<leader>s",
		":w<CR>:luafile %<CR>",
		desc = "Source Init.lua",
		icon = "",
	},
	{
		"<leader><UP>",
		"<C-w>+",
		desc = "Increase Window Size",
	},
	{
		"<leader><DOWN>",
		"<C-w>-",
		desc = "Decrease Window Size",
	},
	-- Quick rundown of terminal mode mapppings:
	-- in normal mode, pressing leader + t opens the terminal.
	--  note that it is also opened from the "compile and run" command.
	-- In general, mappings that open the terminal should enter terminal-insert
	-- mode to save time.
	-- to exit terminal-insert mode, press CTRL + c.
	-- to close the terminal window, leader + c.
	-- leader + c also works with any buffer, but it does not save it.
	{
		"<leader>t",
		":term<CR>i",
		desc = "Open Terminal",
		icon = "",
	},
	{
		"<leader>c",
		":bd!<CR>",
		desc = "Force Close Buffer",
		icon = "󰅘",
	},
	{
		"<C-c>",
		"<C-\\><C-N>",
		desc = "Exit Terminal Insert Mode",
		mode = "t",
	},
})

-- Run code
wk.add({
	{
		"<leader>c",
		function()
			vim.cmd("w")
			vim.cmd("make")
		end,
		desc = "Compile",
	},
	{
		"<leader>r",
		":term ./%< <CR>i",
		desc = "Run",
		icon = "",
	},
	{ "<leader>R", group = "Run options...", icon = "" },
	{
		"<leader>Rc",
		":set makeprg=gcc\\ %\\ -o\\ %< <CR>",
		desc = "Compile in C/C++",
		icon = "",
	},
	{
		"<leader>Rn",
		":cnext<CR>",
		desc = "Next Error",
		icon = "󰼧",
	},
	{
		"<leader>Rp",
		":cprev<CR>",
		desc = "Previous Error",
		icon = "󰼨",
	},
})

-- Visual changes
wk.add({
	{ "<leader>a", group = "Appearance...", icon = "󱠓" },
	{
		"<leader>a/",
		"<CMD>nohlsearch<CR>",
		desc = "Erase Highlight",
		mode = "n",
		icon = "󰇾",
	},
	{
		"<leader>ac",
		"<CMD>Themery<CR>",
		desc = "Colorschemes",
		mode = "n",
		icon = "",
	},
})

-- Telescope keymaps
wk.add({
	{ "<leader>f", group = "Find...", icon = "" },
	{
		"<leader>ff",
		"<CMD>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
		desc = "Find File",
		mode = "n",
	},
	{
		"<leader>ft",
		"<CMD>Telescope live_grep<CR>",
		desc = "Find Text",
		mode = "n",
	},
})

-- Git keymaps
wk.add({
	{ "<leader>g", group = "Git...", icon = "󰊢" },
	{
		"<leader>gs",
		"<CMD>!git status<CR>",
		desc = "Git Status",
		icon = "󱖫",
	},
	{
		"<leader>ga",
		"<CMD>!git add -A<CR>",
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
		"<CMD>!git push<CR>",
		desc = "Git Push",
		icon = "",
	},
	{
		"<leader>gP",
		"<CMD>!git pull<CR>",
		desc = "Git Pull",
		icon = "󰓂",
	},
})

-- LSP keymaps
wk.add({
	{ "<leader>l", group = "LSP...", icon = "󰍉" },
	-- { "<leader>lg", group = "Go to...", icon = "" },
	{
		"<leader>ld",
		"<CMD>lua vim.lsp.buf.definition()<CR>",
		desc = "Go to Definition",
		icon = "󰅩",
	},
	{
		"<leader>lD",
		"<CMD>lua vim.lsp.buf.declaration()<CR>",
		desc = "Go to Declaration",
		icon = "󰅲",
	},
	{
		"<leader>lr",
		"<CMD>lua vim.lsp.buf.references()<CR>",
		desc = "Get References",
		icon = "",
	},
	{
		"<leader>lI",
		"<CMD>lua vim.lsp.buf.implementation()<CR>",
		desc = "Go to Implementation",
		icon = "󰯗",
	},
	{
		"<leader>ll",
		"<CMD>lua vim.diagnostic.open_float()<CR>",
		desc = "Get Diagnostic",
		icon = "󱕠",
	},
	{
		"<leader>ln",
		"<CMD>lua vim.diagnostic.goto_next({buffer=0})<cr>",
		desc = "Next Diagnostic",
		icon = "󰼧",
	},
	{
		"<leader>lp",
		"<CMD>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		desc = "Previous Diagnostic",
		icon = "󰼨",
	},
	{
		"<leader>lf",
		"<CMD>lua vim.lsp.buf.format{ async = true }<cr>",
		desc = "Format",
		icon = "󰉼",
	},
	{
		"<leader>li",
		"<CMD>LspInfo<cr>",
		desc = "LSP Info",
		icon = "",
	},
	{
		"<leader>la",
		"<CMD>lua vim.lsp.buf.code_action()<cr>",
		desc = "Code Action",
		icon = "",
	},
})

-- Debugging keymaps

local dap = require("dap")
local dapui = require("dapui")
wk.add({
	{ "<leader>d", group = "Debugging...", icon = "" },
	{
		"<leader>dd",
		function()
			dap.toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
		icon = "🔴",
	},
	{
		"<leader>dc",
		function()
			dap.continue()
		end,
		desc = "Continue Debugging",
		icon = { icon = "", color = "green" },
	},
	{
		"<leader>du",
		function()
			dapui.toggle()
		end,
		desc = "Toggle Dap UI",
		icon = "",
	},
	{
		"<leader>dj",
		function()
			dap.step_into()
		end,
		desc = "Step Into",
		icon = "",
	},
	{
		"<leader>dk",
		function()
			dap.step_out()
		end,
		desc = "Step Out",
		icon = "",
	},
	{
		"<leader>dl",
		function()
			dap.step_over()
		end,
		desc = "Step Over",
		icon = "",
	},
	{
		"<leader>dh",
		function()
			dap.step_back()
		end,
		desc = "Step Back",
		icon = "",
	},
	{
		"<leader>ds",
		function()
			dap.repl.open()
		end,
		desc = "Inspect State",
	},
	{
		"<leader>dp",
		function()
			require("dap.ui.widgets").preview()
		end,
		desc = "Preview Widget",
	},
})
