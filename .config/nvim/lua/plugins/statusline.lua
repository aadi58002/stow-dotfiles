return {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    event = "VeryLazy",
    opts = {
        options = {
            globalstatus = true,
            theme = "catppuccin",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "filetype" },
            lualine_y = {
                {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = "NoicePopupBorder",
                    separator = { left = '', right = '' },
                },
                {
                    "diff",
                    separator = { left = '', right = '' },
                    symbols = {
                        added = " ",
                        modified = " ",
                        removed = " ",
                    },
                },
            },
            lualine_z = { "location", "progress" },
        },
    },
    dependencies = { "catppuccin", "nvim-web-devicons", "noice" },
}
