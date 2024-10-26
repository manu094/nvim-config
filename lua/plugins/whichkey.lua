return {
	"folke/which-key.nvim",
	config = function()
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
				group = "", -- symbol prepended to a group
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
				"<CMD>Oil<CR>",
				desc = "Open Explorer",
				mode = "n",
				icon = { icon = "󰙅", color = "green" },
			},
			{
				"<leader>s",
				":w<CR>:luafile %<CR>",
				desc = "Source Init.lua",
				icon = { icon = "", color = "orange" },
			},
			{
				"<leader>k",
				"<C-w>+",
				desc = "Increase Window Size",
				icon = { icon = "", color = "white" },
			},
			{
				"<leader>j",
				"<C-w>-",
				desc = "Decrease Window Size",
				icon = { icon = "", color = "white" },
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
				icon = { icon = "", color = "green" },
			},
			{
				"<leader>c",
				":bd!<CR>",
				desc = "Force Close Buffer",
				icon = { icon = "󰅘", color = "green" },
			},
			{
				"<C-c>",
				"<C-\\><C-N>",
				desc = "Exit Terminal Insert Mode",
				mode = "t",
			},
		})

		-- Visual changes
		wk.add({
			{ "<leader>a", group = "Appearance...", icon = { icon = "󱠓", color = "pink" } },
			{
				"<leader>a/",
				"<CMD>nohlsearch<CR>",
				desc = "Erase Highlight",
				mode = "n",
				icon = { icon = "󰇾", color = "white" },
			},
			{
				"<leader>ac",
				"<CMD>Themery<CR>",
				desc = "Colorschemes",
				mode = "n",
				icon = { icon = "", color = "pink" },
			},
		})

		-- Telescope / file switching keymaps
		wk.add({
			{ "<leader>f", group = "Find...", icon = { icon = "", color = "brown" } },
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
			{
				"<leader>fd",
				function()
					require("dropbar.api").pick()
				end,
				desc = "Pick in Dropbar",
				mode = "n",
			},
		})

		-- Git keymaps
		wk.add({
			{ "<leader>g", group = "Git...", icon = { icon = "󰊢", color = "orange" } },
			{
				"<leader>gs",
				"<CMD>!git status<CR>",
				desc = "Git Status",
				icon = { icon = "󱖫", color = "orange" },
			},
			{
				"<leader>ga",
				"<CMD>!git add -A<CR>",
				desc = "Git Add All",
				icon = { icon = "", color = "orange" },
			},
			{
				"<leader>gc",
				":!git commit -m ",
				desc = "Git Commit (+ message)",
				icon = { icon = "󰜘", color = "orange" },
			},
			{
				"<leader>gp",
				"<CMD>!git push<CR>",
				desc = "Git Push",
				icon = { icon = "", color = "orange" },
			},
			{
				"<leader>gP",
				"<CMD>!git pull<CR>",
				desc = "Git Pull",
				icon = { icon = "󰓂", color = "orange" },
			},
		})

		-- LSP keymaps
		wk.add({
			{ "<leader>l", group = "LSP...", icon = { icon = "󰍉", color = "teal" } },
			-- { "<leader>lg", group = "Go to...", icon = "" },
			{
				"<leader>ld",
				"<CMD>lua vim.lsp.buf.definition()<CR>",
				desc = "Go to Definition",
				icon = { icon = "󰅩", color = "teal" },
			},
			{
				"<leader>lD",
				"<CMD>lua vim.lsp.buf.declaration()<CR>",
				desc = "Go to Declaration",
				icon = { icon = "󰅲", color = "teal" },
			},
			{
				"<leader>lr",
				"<CMD>lua vim.lsp.buf.references()<CR>",
				desc = "Get References",
				icon = { icon = "", color = "teal" },
			},
			{
				"<leader>lI",
				"<CMD>lua vim.lsp.buf.implementation()<CR>",
				desc = "Go to Implementation",
				icon = { icon = "󰯗", color = "teal" },
			},
			{
				"<leader>ll",
				"<CMD>lua vim.diagnostic.open_float()<CR>",
				desc = "Get Diagnostic",
				icon = { icon = "󱕠", color = "teal" },
			},
			{
				"<leader>ln",
				"<CMD>lua vim.diagnostic.goto_next({buffer=0})<cr>",
				desc = "Next Diagnostic",
				icon = { icon = "󰼧", color = "teal" },
			},
			{
				"<leader>lp",
				"<CMD>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
				desc = "Previous Diagnostic",
				icon = { icon = "󰼨", color = "teal" },
			},
			{
				"<leader>lf",
				"<CMD>lua vim.lsp.buf.format{ async = true }<cr>",
				desc = "Format",
				icon = { icon = "󰉼", color = "teal" },
			},
			{
				"<leader>li",
				"<CMD>LspInfo<cr>",
				desc = "LSP Info",
				icon = { icon = "", color = "teal" },
			},
			{
				"<leader>la",
				"<CMD>lua vim.lsp.buf.code_action()<cr>",
				desc = "Code Action",
				icon = { icon = "", color = "teal" },
			},
		})

		-- Debugging keymaps
		local dap = require("dap")
		local dapui = require("dapui")
		wk.add({
			{ "<leader>d", group = "Debugging...", icon = { icon = "", color = "red" } },
			{
				"<leader>dd",
				function()
					dap.toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
				icon = { icon = "🔴", color = "red" },
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
				icon = { icon = "", color = "pink" },
			},
			{
				"<leader>dj",
				function()
					dap.step_into()
				end,
				desc = "Step Into",
				icon = { icon = "", color = "blue" },
			},
			{
				"<leader>dk",
				function()
					dap.step_out()
				end,
				desc = "Step Out",
				icon = { icon = "", color = "blue" },
			},
			{
				"<leader>dl",
				function()
					dap.step_over()
				end,
				desc = "Step Over",
				icon = { icon = "", color = "blue" },
			},
			{
				"<leader>dh",
				function()
					dap.step_back()
				end,
				desc = "Step Back",
				icon = { icon = "", color = "blue" },
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

		-- Undo Tree keymaps
		wk.add({
			{
				"<leader>u",
				vim.cmd.UndotreeToggle,
				desc = "Toggle Undo Tree",
				mode = "n",
				icon = { icon = "", color = "green" },
			},
		})

		-- Buffers keymaps
		wk.add({
			{ "<leader>b", group = "Buffers...", icon = { icon = "B", color = "red" } },
			{
				"<leader>bh",
				"<Cmd>BufferMovePrevious<CR>",
				desc = "Move Left",
			},
			{
				"<leader>bl",
				"<Cmd>BufferMoveNext<CR>",
				desc = "Move Right",
			},
			{
				"<leader>bp",
				"<Cmd>BufferPin<CR>",
				desc = "Pin Buffer",
				icon = { icon = "", color = "grey" },
			},
			{
				"<leader>bc",
				"<Cmd>BufferClose<CR>",
				desc = "Close Buffer",
				icon = { icon = "", color = "red" },
			},
			{
				"<leader>bC",
				"<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
				desc = "Clean Buffers",
				icon = { icon = "", color = "red" },
			},
			-- Go to specific buffers
			{
				"<leader>b1",
				"<Cmd>BufferGoto 1<CR>",
			},
			{
				"<leader>b2",
				"<Cmd>BufferGoto 2<CR>",
			},
			{
				"<leader>b3",
				"<Cmd>BufferGoto 3<CR>",
			},
			{
				"<leader>b4",
				"<Cmd>BufferGoto 4<CR>",
			},
			{
				"<leader>b5",
				"<Cmd>BufferGoto 5<CR>",
			},
			{
				"<leader>b6",
				"<Cmd>BufferGoto 6<CR>",
			},
			{
				"<leader>b7",
				"<Cmd>BufferGoto 7<CR>",
			},
			{
				"<leader>b8",
				"<Cmd>BufferGoto 8<CR>",
			},
			{
				"<leader>b9",
				"<Cmd>BufferGoto 9<CR>",
			},
			{
				"<leader>b0",
				"<Cmd>BufferLast<CR>",
			},
		})

		-- Help
		wk.add({
			{ "<leader>h", group = "help", icon = { icon = "?", color = "yellow" } },
			{
				"<leader>he",
				":h telescope-file-browser.actions<CR>",
				desc = "File Explorer",
			},
		})
	end,
}
