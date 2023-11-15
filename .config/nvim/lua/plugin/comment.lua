return {
    "echasnovski/mini.comment",
    lazy = true,
    opts = {
        options = {
            custom_commentstring = function()
                return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo
                    .commentstring
            end,
        },
    },
    -- Setting keys so that lazy vim can add handlers to it so that i can be lazy loaded
    keys = { { "gc", mode = { "n", "v" } }, "gcc" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring"
    }
}
