return {
    'numToStr/Comment.nvim',
    lazy = true,
    opts = {},
    -- Setting keys so that lazy vim can add handlers to it so that it can be lazy loaded
    keys = { { "gc", mode = { "n", "v" } }, "gcc" },
}
