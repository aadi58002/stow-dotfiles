-- plugins/mini.lua:
return {
    { 
        'echasnovski/mini.sessions',
        version = '*',
        lazy = false,
        opts={
            directory =  vim.fn.stdpath('data'),
            -- Whether to read latest session if Neovim opened without file arguments
            autoread = true,
        },
        keys = {
            {
                "<leader>sd",
                "<cmd>lua MiniSessions.delete()<cr>",
                desc =
                "delete this session"
            },
            {
                "<leader>ss",
                "<cmd>lua MiniSessions.write('last_session',{})<cr>",
                desc =
                "Save Sessions"
            },
            {
                "<leader>sl",
                "<cmd>lua MiniSessions.select()<cr>",
                desc =
                "Switch Sessions"
            },
        },
    },
}
