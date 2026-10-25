-- Document outline (headings in markdown/typst, symbols in code)
return {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialNavToggle" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        layout = {
            default_direction = "left",
            min_width = 28,
        },
        show_guides = true,
        -- Headings are "Interface"/"Module" etc. depending on backend; show everything
        filter_kind = false,
    },
}
