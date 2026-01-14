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
                "<leader>w",
                "<CMD>wa<CR>",
                desc = "[W]rite all",
                mode = "n",
                icon = { icon = "", color = "green" },
            },
            {
                "<leader>E",
                "<CMD>Neotree<CR>",
                desc = "[E]xplorer Tree",
                mode = "n",
                icon = { icon = "󰙅", color = "green" },
            },
            {
                "<leader>e",
                "<CMD>Oil<CR>",
                desc = "[E]xplorer Oil",
                mode = "n",
                icon = { icon = "󰙅", color = "green" },
            },
            {
                "<leader>s",
                ":w<CR>:luafile %<CR>",
                desc = "[S]ource Init.lua",
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
            -- {
            --     "<leader>T",
            --     ":ToggleTerm<CR>",
            --     desc = "[T]erminal Open",
            --     icon = { icon = "", color = "green" },
            -- },
            {
                "kj",
                "<C-\\><C-N>",
                desc = "Exit Terminal Insert Mode",
                mode = "t",
            },
            {
                "jk",
                "<C-\\><C-N>",
                desc = "Exit Terminal Insert Mode",
                mode = "t",
            },
        })

        -- Visual changes
        wk.add({
            {
                "<leader>z",
                "<CMD>ZenMode<CR>",
                desc = "[Z]en Mode",
                icon = { icon = "", color = "green"},
            },
            { "<leader>a", group = "[A]ppearance...", icon = { icon = "󱠓", color = "pink" } },
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
                desc = "[C]olorschemes",
                mode = "n",
                icon = { icon = "", color = "pink" },
            },
        })

        wk.add({
            { "<leader>t", group = "[T]ext...", icon = { icon = "A", color = "grey" } },
            {
                "<leader>tm",
                "<CMD>Markview Toggle<CR>",
                desc = "[M]arkdown Preview",
                mode = "n",
            },
            {
                "<leader>tt",
                "<CMD>TypstPreview<CR>",
                desc = "[T]ypst Preview",
                mode = "n",
            }
        })

        -- Telescope / file switching keymaps
        wk.add({
            { "<leader>f", group = "[F]ind...", icon = { icon = "", color = "brown" } },
            {
                "<leader>ff",
                "<CMD>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
                desc = "[F]ile Find",
                mode = "n",
            },
            {
                "<leader>fr",
                "<CMD>GrugFar<CR>",
                desc = "Find and [R]eplace",
                mode = "n",
            },
            {
                "<leader>ft",
                "<CMD>Telescope live_grep<CR>",
                desc = "[T]ext Find",
                mode = "n",
            },
            {
                "<leader>fd",
                function()
                    require("dropbar.api").pick()
                end,
                desc = "Pick in [D]ropbar",
                mode = "n",
            },
            {
                "<leader>fn",
                "<CMD>Telescope notify<CR>",
                desc = "[N]otifications Find",
                mode = "n",
            },
        })

        -- Git keymaps
        wk.add({
            { "<leader>g", group = "[G]it...", icon = { icon = "󰊢", color = "orange" } },
            {
                "<leader>gs",
                "<CMD>Git status<CR>",
                desc = "Git [S]tatus",
                icon = { icon = "󱖫", color = "orange" },
            },
            {
                "<leader>ga",
                "<CMD>Git add -A<CR>",
                desc = "Git [A]dd All",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>gc",
                ":Git commit -m ",
                desc = "Git [C]ommit (+ message)",
                icon = { icon = "󰜘", color = "orange" },
            },
            {
                "<leader>gp",
                "<CMD>Git push<CR>",
                desc = "Git [P]ush",
                icon = { icon = "", color = "orange" },
            },
            {
                "<leader>gP",
                "<CMD>Git pull<CR>",
                desc = "Git [P]ull",
                icon = { icon = "󰓂", color = "orange" },
            },
            {
                "<leader>gb",
                "<CMD>GitBlameToggle<CR>",
                desc = "Toggle Git [B]lame",
                icon = { icon = "", color = "orange"},
            },
        })

        -- LSP keymaps
        wk.add({
            { "<leader>l", group = "[L]SP...", icon = { icon = "󰍉", color = "teal" } },
            -- { "<leader>lg", group = "Go to...", icon = "" },
            {
                "<leader>ld",
                "<CMD>lua vim.lsp.buf.definition()<CR>",
                desc = "Go to [D]efinition",
                icon = { icon = "󰅩", color = "teal" },
            },
            {
                "<leader>lD",
                "<CMD>lua vim.lsp.buf.declaration()<CR>",
                desc = "Go to [D]eclaration",
                icon = { icon = "󰅲", color = "teal" },
            },
            {
                "<leader>lr",
                "<CMD>lua vim.lsp.buf.references()<CR>",
                desc = "Get [R]eferences",
                icon = { icon = "", color = "teal" },
            },
            {
                "<leader>lI",
                "<CMD>lua vim.lsp.buf.implementation()<CR>",
                desc = "Go to [I]mplementation",
                icon = { icon = "󰯗", color = "teal" },
            },
            {
                "<leader>ls",
                "<CMD>lua vim.diagnostic.open_float()<CR>",
                desc = "Get Diagno[s]tic",
                icon = { icon = "󱕠", color = "teal" },
            },
            {
                "<leader>ll",
                "<CMD>lua vim.diagnostic.jump({count = 1})<cr>",
                desc = "Next Diagnostic",
                icon = { icon = "󰼧", color = "teal" },
            },
            {
                "<leader>lh",
                "<CMD>lua vim.diagnostic.jump({count = -1})<cr>",
                desc = "Previous Diagnostic",
                icon = { icon = "󰼨", color = "teal" },
            },
            {
                "<leader>lf",
                -- "<CMD>lua vim.lsp.buf.format{ async = true }<cr>",
                function()
                    require("conform").format({
                        lsp_format = "fallback",
                        async = false,
                        timeout_ms = 500,
                    })
                end,
                desc = "[F]ormat",
                icon = { icon = "󰉼", color = "teal" },
            },
            {
                "<leader>li",
                "<CMD>LspInfo<cr>",
                desc = "LSP [I]nfo",
                icon = { icon = "", color = "teal" },
            },
            {
                "<leader>la",
                "<CMD>lua vim.lsp.buf.code_action()<cr>",
                desc = "Code [A]ction",
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
                "<Cmd>UndotreeToggle<CR>",
                desc = "Toggle [U]ndo Tree",
                mode = "n",
                icon = { icon = "", color = "green" },
            },
        })

        -- Buffers keymaps
        wk.add({
            { "<leader>b", group = "[B]uffers...", icon = { icon = "B", color = "red" } },
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
                desc = "[P]in Buffer",
                icon = { icon = "", color = "grey" },
            },
            {
                "<leader>bc",
                "<Cmd>BufferClose<CR>",
                desc = "[C]lose Buffer",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>bxc",
                "<Cmd>BufferClose!<CR>",
                desc = "Force Close Buffer",
                icon = { icon = "", color = "red" },
            },
            {
                "<leader>bC",
                "<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
                desc = "[C]lean Buffers",
                icon = { icon = "", color = "red" },
            },
            -- Go to specific buffers
            {
                "<leader>b0",
                "<Cmd>BufferGoto 1<CR>",
            },
            {
                "<leader>b1",
                "<Cmd>BufferGoto 2<CR>",
            },
            {
                "<leader>b2",
                "<Cmd>BufferGoto 3<CR>",
            },
            {
                "<leader>b3",
                "<Cmd>BufferGoto 4<CR>",
            },
            {
                "<leader>b4",
                "<Cmd>BufferGoto 5<CR>",
            },
            {
                "<leader>b5",
                "<Cmd>BufferGoto 6<CR>",
            },
            {
                "<leader>b6",
                "<Cmd>BufferGoto 7<CR>",
            },
            {
                "<leader>b7",
                "<Cmd>BufferGoto 8<CR>",
            },
            {
                "<leader>b8",
                "<Cmd>BufferGoto 9<CR>",
            },
            {
                "<leader>b9",
                "<Cmd>BufferLast<CR>",
            },
        })

        -- Code Runner
        wk.add({
            { "<leader>r", group = "[R]un...", icon = { icon = ">", color = "green" } },
            {
                "<leader>rr",
                ":w<CR>:RunCode<CR>",
                desc = "Run Code",
            },
            {
                "<leader>rR",
                ":w<CR>:RunCode ",
                desc = "Run Code with Arguments",
            },
            {
                "<leader>rf",
                ":w<CR>:RunFile<CR>",
                desc = "Run [F]ile",
            },
            {
                "<leader>rp",
                ":w<CR>:RunProject<CR>",
                desc = "Run [P]roject",
            },
            {
                "<leader>rc",
                ":RunClose<CR>",
                desc = "Run [C]lose",
            },
        })


        -- Help
        wk.add({
            { "<leader>h", group = "[H]elp", icon = { icon = "?", color = "yellow" } },
            {
                "<leader>he",
                ":h telescope-file-browser.actions<CR>",
                desc = "File [E]xplorer",
            },
        })
    end,
}
