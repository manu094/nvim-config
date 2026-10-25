-- Makes ltex's "Add to dictionary", "Hide false positive" and "Disable rule"
-- code actions work, storing them in spell/ltex/ (versioned with the config)
return {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "typst", "gitcommit", "text" },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client.name == "ltex_plus" then
                    require("ltex_extra").setup({
                        load_langs = { "fr" },
                        path = vim.fn.stdpath("config") .. "/spell/ltex",
                    })
                end
            end,
        })
    end,
}
