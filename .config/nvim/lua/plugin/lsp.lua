-- plugins/playground.lua:
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        -- {                                      -- Optional
        --     'williamboman/mason.nvim',
        --     build = function()
        --         pcall(vim.cmd, 'MasonUpdate')
        --     end,
        -- },
        -- {'williamboman/mason-lspconfig.nvim'}, -- Optional


        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        local cmp = require('cmp')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            local opts = { buffer = bufnr }
            local bind = vim.keymap.set
            bind('n', '<leader>c', function() end, { desc = "Code" })
            bind('n', '<leader>ct', "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle for diagnostic" })
            bind('n', '<leader>cq', "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Toggle for quickfix" })
            lsp.buffer_autoformat()
        end)

        lsp.configure('rust_analyzer', {
            single_file_support = true,
        })

        -- When you don't have mason.nvim installed
        -- You'll need to list the servers installed in your system
        lsp.setup_servers({ 'tsserver', 'rust_analyzer', 'pyright', "lua_ls" })

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' }
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }
        })
    end
}
