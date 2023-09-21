-- plugins/hop.nvim
return {
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {},
        keys = {
            { "gw", "<cmd>HopWord<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "gc", "<cmd>HopChar1<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "gl", "<cmd>HopLineStart<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "z", "<cmd>HopPattern<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        },
    }
}
