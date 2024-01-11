-- plugins/theme.lua:
return {
	"folke/tokyonight.nvim",
	event = "VeryLazy",
	opts = {
		style = "moon",
		on_colors = function(colors)
			colors.fg_gutter = "#707cb2"
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
