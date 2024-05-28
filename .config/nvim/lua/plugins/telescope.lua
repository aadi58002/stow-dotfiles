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
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

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
