return {
    "saecki/crates.nvim",
    name = "crates",
    event = { "BufRead Cargo.toml" },
    opts = {
        popup = {
            autofocus = true,
        },
        lsp = {
            on_attach = function(bufnr)
                local crates = require("crates")
                local opts = { silent = true, buffer = bufnr }
                local bind = vim.keymap.set

                -- stylua: ignore
                bind('n', '<leader>ct', crates.toggle, opts)
                bind("n", "<leader>cr", crates.reload, opts)

                bind("n", "<leader>cv", crates.show_versions_popup, opts)
                bind("n", "<leader>cf", crates.show_features_popup, opts)
                bind("n", "<leader>cd", crates.show_dependencies_popup, opts)

                bind("n", "<leader>cu", crates.update_crate, opts)
                bind("v", "<leader>cu", crates.update_crates, opts)
                bind("n", "<leader>ca", crates.update_all_crates, opts)
                bind("n", "<leader>cU", crates.upgrade_crate, opts)
                bind("v", "<leader>cU", crates.upgrade_crates, opts)
                bind("n", "<leader>cA", crates.upgrade_all_crates, opts)

                bind("n", "<leader>ce", crates.expand_plain_crate_to_inline_table, opts)
                bind("n", "<leader>cE", crates.extract_crate_into_table, opts)

                bind("n", "<leader>cH", crates.open_homepage, opts)
                bind("n", "<leader>cR", crates.open_repository, opts)
                bind("n", "<leader>cD", crates.open_documentation, opts)
                bind("n", "<leader>cC", crates.open_crates_io, opts)
            end,
        }
    },
    init = function()
        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
            pattern = "Cargo.toml",
            callback = function()
                cmp.setup.buffer({ sources = { { name = "crates" } } })
            end,
        })
    end,
    dependencies = { "plenary", "nvim-cmp" },
}
