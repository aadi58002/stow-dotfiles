-- plugins/telescope.lua:
return {
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            {
                "<leader>fr",
                "<cmd>Telescope oldfiles<cr>",
                desc =
                "Open recent files"
            },
            {
                "<leader>,",
                "<cmd>Telescope buffers show_all_buffers=true<cr>",
                desc =
                "Switch Buffer"
            },
            {
                "<leader>/",
                "<cmd>Telescope live_grep<cr>",
                desc =
                "Grep (root dir)"
            },
            {
                "<leader>:",
                "<cmd>Telescope command_history<cr>",
                desc =
                "Command History"
            },
            {
                "<leader><space>",
                "<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true<cr>",
                desc =
                "Find Files (root dir)"
            },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                extensions = {
                    file_browser = {}
                }
            },
        },
        config = function()
            require('telescope').load_extension "file_browser"
        end,
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' }
    }
}
