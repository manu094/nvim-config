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
        config = function()
            require("themery").setup({
                themes = {
                    { name = "Tokyonight",  colorscheme = "tokyonight-storm" },
                    {
                        name = "Gruvbox",
                        colorscheme = "gruvbox-material",
                        before = [[
                            -- vim.opt.background = "light"
                        ]],
                    },
                    { name = "Aurora",   colorscheme = "aurora" },
                    { name = "Darkplus", colorscheme = "darkplus" },
                    { name = "Dragon",   colorscheme = "kanagawa-dragon" },
                    { name = "NightFox", colorscheme = "nightfox" },
                    { name = "Catppuccin", colorscheme = "catppuccin" },
                },
            })
        end,
    },
    { "folke/tokyonight.nvim",   lazy = true },
    { "lunarvim/colorschemes",   lazy = true },
    { "sainnhe/everforest",      lazy = true },
    { "sainnhe/gruvbox-material", lazy = true },
    { "AlexvZyl/nordic.nvim",   lazy = true },
    { "rebelot/kanagawa.nvim",  lazy = true },
    { "EdenEast/nightfox.nvim", lazy = true },
    -- catppuccin configured in plugins/ui/auto-dark-mode.lua

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
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
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
        opts = {},
    },
}
