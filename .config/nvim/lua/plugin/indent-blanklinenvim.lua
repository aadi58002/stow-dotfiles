-- plugins/indent-blankline.nvim
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
}
