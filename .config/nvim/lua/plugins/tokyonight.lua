local add = MiniDeps.add

add({
    source = "folke/tokyonight.nvim",
    name = "tokyonight",
})

require("tokyonight").setup({
  style = "moon",
  on_colors = function(colors)
    colors.fg_gutter = "#707cb2"
  end,
})

vim.cmd("colorscheme tokyonight")
