return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        -- Exclude j and k from labels so they always act as search characters
        labels = "asdfghlqwertyuiopzxcvbnm",
        label = {
            -- Show labels in rainbow colors for visibility
            rainbow = { enabled = true, shade = 5 },
            -- Show label after the match (default), set to true to show before
            after = true,
        },
        modes = {
            search = {
                enabled = true, -- flash labels appear during / search
            },
        },
    },
    keys = {
        { "s",     function() require("flash").jump() end,              desc = "Flash Jump",              mode = { "n", "x", "o" } },
        { "S",     function() require("flash").treesitter() end,        desc = "Flash Treesitter",        mode = { "n", "x", "o" } },
        { "r",     function() require("flash").remote() end,            desc = "Flash Remote",            mode = "o" },
        { "R",     function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search", mode = { "o", "x" } },
        { "<C-s>", function() require("flash").toggle() end,            desc = "Toggle Flash Search",     mode = "c" },
    },
}
