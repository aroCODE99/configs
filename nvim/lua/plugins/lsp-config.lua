return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                log_level = vim.log.levels.DEBUG,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "jdtls",
                "ts_ls",
                "html",
                "lua_ls",
                "rust_analyzer",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities();
            local lspconfig = require("lspconfig")

            local function on_attach(client, bufnr)
                print("LSP server attached")
                if client.server_capabilities.semanticTokensProvider then
                    client.server_capabilities.semanticTokensProvider = nil
                end
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            end

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })


            lspconfig.jdtls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                flags = {
                    debounce_text_changes = 150,
                },
                root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
                settings = {
                    java = {
                        organizeImports = true,
                    },
                    codeGeneration = {
                        generateGettersSetters = true,
                        generateEqualsAndHashCode = true,
                    },
                },
            })
        end,
    },
}
