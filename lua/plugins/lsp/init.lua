return {
     "neovim/nvim-lspconfig", -- Enable LSP
     dependencies = {
        "williamboman/mason.nvim", -- Simple to use language server installer
        "williamboman/mason-lspconfig.nvim", -- Simple to use language server installer
     },
     config = function()
        local status_ok, _ = pcall(require, "lspconfig")
        if not status_ok then
            return
        end
        require "plugins.lsp.mason"
        require("plugins.lsp.handlers").setup()
        require "plugins.lsp.null-ls"
     end
}
