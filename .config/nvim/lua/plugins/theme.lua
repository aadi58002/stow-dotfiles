return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		event = "VeryLazy",
		priority = 1001,
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
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
		priority = 1000,
		opts = {
			integrations = {
				alpha = true,
				cmp = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
			},
		},
	},
}
