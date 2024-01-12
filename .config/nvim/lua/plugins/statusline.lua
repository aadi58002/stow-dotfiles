-- plugins/statusline.lua:
return {
	"nvim-lualine/lualine.nvim",
	name = "lualine",
	event = "VeryLazy",
	opts = {
		options = {
			globalstatus = true,
			theme = "catppuccin",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = {
				"progress",
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
			},
			lualine_z = { "location" },
		},
	},
	dependencies = { "catppuccin", "nvim-tree/nvim-web-devicons" },
}
