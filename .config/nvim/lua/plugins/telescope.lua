return {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    event = "VeryLazy",
    config = function(_, _)
        local telescope = require("telescope")
        telescope.setup({
            defaults = { prompt_prefix = " ", selection_caret = " ", },
            pickers = {
                file_files = { find_command = { "fd", "--hidden", "--type", "file", "--type", "symlink", "--strip-cwd-prefix" }, },
            },
        })

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
        vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
        vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[ ] Find existing buffers' })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(_)
                local bind = vim.keymap.set
                bind("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Telescope Implementations" })
                bind("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Telescope References" })
                bind("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Telescope Definitions" })
            end,
        })
    end,
    dependencies = {
        "plenary",
        "nvim-tree/nvim-web-devicons",
    },
}
