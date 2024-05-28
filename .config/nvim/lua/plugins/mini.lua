return {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "VeryLazy" },
    config = function()
        require("mini.align").setup()
        require("mini.bracketed").setup()
        require("mini.comment").setup()

        require("mini.splitjoin").setup()

        require("mini.jump").setup()
        local MiniJump2d = require('mini.jump2d')
        MiniJump2d.setup({
            spotter = MiniJump2d.gen_pattern_spotter('%w+', 'start'),
            view = {
                dim = true,
                n_steps_ahead = 3,
            },
        })
        vim.api.nvim_set_hl(0, 'MiniJump2dSpot', { fg = "#ff007c", ctermfg = 198, bold = true })
        vim.api.nvim_set_hl(0, 'MiniJump2dSpotAhead', { fg = "#00dfff", ctermfg = 45, bold = true })

        require("mini.indentscope").setup({
            symbol = "│",
            options = { try_as_border = true },
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })

        require("mini.surround").setup()
    end,
    keys = { { "gc", mode = { "n", "v" }, desc = "Toggle Comment" }, { "gcc", desc = "Toggle Comment current line" } },
}
