return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {},
        keys = {
            {
                "<leader>sr",
                '<cmd>lua require("persistence").load()<cr>',
                desc =
                "Restore last session for this directory"
            },
            {
                "<leader>sl",
                '<cmd>lua require("persistence").load({ last = true })<cr>',
                desc =
                "Restore last session"
            },
            {
                "<leader>sd",
                '<cmd>lua require("persistence").stop()<cr>',
                desc =
                "Delete current session"
            },
        },
    }
}
