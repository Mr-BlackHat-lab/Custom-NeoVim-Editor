return { -- Mason: LSP installer
{
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup()
    end
}, -- Mason LSP bridge
{
    'williamboman/mason-lspconfig.nvim',
    dependencies = {'williamboman/mason.nvim'},
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {'ts_ls', 'eslint', 'html', 'cssls', 'jsonls', 'emmet_ls', 'clangd', 'lua_ls', 'pyright' -- 🐍 Added pyright here
            }
        })
    end
}, -- LSP config
{
    'neovim/nvim-lspconfig',
    dependencies = {'williamboman/mason-lspconfig.nvim'},
    config = function()
        local lspconfig = require('lspconfig')

        -- Diagnostic signs
        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = ""
                }
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always"
            }
        })

        vim.diagnostic.config({
            virtual_text = {
                prefix = '●'
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always"
            }
        })

        -- Common keymaps for LSP
        local on_attach = function(client, bufnr)
            local opts = {
                noremap = true,
                silent = true,
                buffer = bufnr
            }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format {
                    async = true
                }
            end, opts)
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {
                noremap = true,
                silent = true,
                buffer = bufnr,
                desc = "Show diagnostics"
            })
        end

        -- LSP capabilities for nvim-cmp
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
        if cmp_ok then
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end

        -- LSP servers (include pyright)
        local servers =
            {'ts_ls', 'eslint', 'html', 'cssls', 'jsonls', 'emmet_ls', 'clangd', 'lua_ls', 'pyright' -- 🐍 Added pyright here
            }

        for _, server in ipairs(servers) do
            if server == 'lua_ls' then
                lspconfig.lua_ls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            runtime = {
                                version = 'LuaJIT'
                            },
                            diagnostics = {
                                globals = {'vim'}
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true)
                            },
                            telemetry = {
                                enable = false
                            }
                        }
                    }
                })
            else
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end
        end
    end
}}
