return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- `main` branch: no more `nvim-treesitter.configs`, parsers are installed
        -- through `install()` and features are enabled per buffer.
        require("nvim-treesitter").install({
            "lua", "markdown", "markdown_inline", "bash", "python", "c",
            "typst", "latex", "yaml", "html",
        })

        local no_highlight = { css = true }
        local no_indent = { python = true, css = true, markdown = true, typst = true }

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local ft = vim.bo[ev.buf].filetype
                if no_highlight[ft] then
                    return
                end
                -- Fails silently when there is no parser for this filetype
                if not pcall(vim.treesitter.start, ev.buf) then
                    return
                end
                if not no_indent[ft] then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
