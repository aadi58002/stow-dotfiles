-- plugins/statusline.lua:
return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			icons_enabled = false,
			theme = "tokyonight",
			component_separators = "|",
			section_separators = "",
		},
	},
	dependencies = "folke/tokyonight.nvim",
}
