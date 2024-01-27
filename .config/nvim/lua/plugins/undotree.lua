return {
	"jiaoshijie/undotree",
	name = "undotree",
	dependencies = "plenary",
	config = true,
	opts = {
		float_diff = true, -- using float window previews diff, set this `true` will disable layout option
		layout = "left_bottom", -- "left_bottom", "left_left_bottom"
		window = {
			winblend = 30,
		},
	},
	keys = { -- load the plugin only when using it's keybinding:
		{ "<leader>uu", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
