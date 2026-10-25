return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "nvim-dap-ui", types = true },
            },
        },
    },
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local on_attach = function(client, bufnr) end

            local server_config = {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            -- Per-server overrides
            local server_overrides = {
                -- Run clippy instead of cargo check so nvim-lint doesn't duplicate warnings
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            check = { command = "clippy" },
                        },
                    },
                },
                -- Typst: completion for labels/refs/bib keys, PDF exported on save
                tinymist = {
                    settings = {
                        exportPdf = "onSave",
                        formatterMode = "typstyle",
                    },
                },
                -- LanguageTool grammar checker for prose (French).
                -- Dictionary, disabled rules (incl. FR_SPELLING_RULE, since Neovim's
                -- spell handles spelling) and false positives live in spell/ltex/,
                -- managed by ltex_extra.nvim
                ltex_plus = {
                    filetypes = { "markdown", "typst", "gitcommit", "text" },
                    settings = {
                        ltex = {
                            language = "fr",
                        },
                    },
                },
            }

            -- mason-lspconfig v2 starts servers with vim.lsp.enable(), which does not
            -- go through lspconfig[...].setup(), so register defaults and overrides here
            vim.lsp.config("*", server_config)
            for server_name, override in pairs(server_overrides) do
                vim.lsp.config(server_name, override)
            end

            local function setup_server(server_name)
                local config = vim.tbl_deep_extend("force", server_config, server_overrides[server_name] or {})
                lspconfig[server_name].setup(config)
            end

            -- Configure Mason-managed servers
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name) setup_server(server_name) end,
                },
            })

            -- Also configure any servers available on the system but not via Mason
            -- (e.g. rust-analyzer installed via pacman)
            local mason_servers = require("mason-lspconfig").get_installed_servers()
            local mason_set = {}
            for _, name in ipairs(mason_servers) do mason_set[name] = true end

            for _, server_name in ipairs(lspconfig.util.available_servers()) do
                if not mason_set[server_name] then
                    setup_server(server_name)
                end
            end
        end,
    },
}
