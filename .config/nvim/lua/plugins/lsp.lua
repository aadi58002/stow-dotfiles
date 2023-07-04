return {
    {
        "neovim/nvim-lspconfig",
        name = "nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function()
            -- Setup language servers.
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.marksman.setup({})
            lspconfig.rust_analyzer.setup({
                -- Server-specific settings. See `:help lspconfig-setup`
                settings = {
                    ["rust-analyzer"] = {},
                },
            })
            lspconfig.svelte.setup({})

            lspconfig.clangd.setup({})
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local buffer = ev.buf
                    local bind = vim.keymap.set
                    bind("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp Goto Declaration", buffer = buffer })
                    bind("n", "gd", vim.lsp.buf.definition, { desc = "Lsp Goto Definations", buffer = buffer })
                    bind("n", "K", vim.lsp.buf.hover, { desc = "Lsp Info at point", buffer = buffer })
                    bind("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Lsp Rename", buffer = buffer })
                    bind(
                    { "n", "v" },
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    { desc = "Lsp Code actions", buffer = buffer }
                    )
                    bind("n", "<leader>cf", function()
                        vim.lsp.buf.format({ async = true })
                    end, { desc = "Code format", buffer = buffer })
                end,
            })
        end,
        dependencies = { "neoconf", "neodev", "mason", "mason-lspconfig",},
    },
    {
        "williamboman/mason.nvim",
        name = "mason",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        name = "mason-lspconfig",
        opts = {},
        dependencies = { "mason",},
    },
}
