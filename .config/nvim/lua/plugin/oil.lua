-- plugin/oil.nvim.lua
return {
    'stevearc/oil.nvim',
    lazy = true,
    cmd = "Oil",
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>fd",
            function()
                local oil = require('oil')
                oil.open()
            end,
            mode = "n" ,desc =
            "Open parent dir with oil"
        },
    }
}
