-- plugins/toggleterm.lua:
return {
    {
        'akinsho/toggleterm.nvim',
        lazy = true,
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
                "<cmd>ToggleTerm dir=%:p:h<cr>",
                desc = "Toggle Terminal",
                mode = { "n", "t" }, 
            }, 
        },
    }
}
