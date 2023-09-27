-- plugins/toggleterm.lua:
return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            direction = 'float',
            float_opts = {
              border = 'curved',
            },
        },
        keys = {
            {
                ",",
                "<cmd>ToggleTerm<cr>",
                desc = "Toggle Terminal",
                mode = { "n", "t" }, 
            }, 
        },
    }
}
