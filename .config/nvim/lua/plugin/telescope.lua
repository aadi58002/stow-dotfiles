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
            {
                "<leader>ff",
                function()
                    require('telescope.builtin').find_files({
                        cwd = "~/Personal",
                        find_command = {
                            "fd",
                            ".",
                            "-L",
                            "--type",
                            "file",
                            "-H",
                            "--strip-cwd-prefix",
                        }
                    })
                end,
                desc =
                "Find Files (root dir)"
            },
            {
                "<leader>fg",
                "<cmd>Telescope git_files path=%:p:h<cr>",
                desc =
                "Find Files (root dir)"
            },
            {
                "<leader>bb",
                "<cmd>Telescope buffers show_all_buffers=true<cr>",
                desc =
                "Switch Buffer"
            },
            {
                "<leader>bk",
                "<cmd>bp|bd #<cr>",
                desc =
                "Kill this buffer"
            },

            {
                "<leader>is",
                "<cmd>Telescope luasnip<cr>",
                desc =
                "Insert Snippet"
            },
        },
        opts = {
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                        follow_symlinks = true,
                        prompt_path = true,
                        grouped = true,
                        auto_depth = true,
                    }
                },
                pickers = {
                    find_files = {
                        find_command = {
                        }
                    }
                },
            },
        },
        config = function()
            require('telescope').load_extension "file_browser"
            require('telescope').load_extension "ui-select"
            require('telescope').load_extension "luasnip"
        end,
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim', 'benfowler/telescope-luasnip.nvim' }
    }
}
