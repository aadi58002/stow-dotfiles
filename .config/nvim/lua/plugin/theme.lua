-- plugins/theme.lua:
return {
    'folke/tokyonight.nvim',
    event = "VeryLazy",
    opts = {
        style = "moon",
        transparent = true,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end
}
