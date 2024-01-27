return {
	"L3MON4D3/LuaSnip",
	name = "luasnip",
	build = "make install_jsregexp",
	opts = {
		history = true,
		update_events = { "TextChanged", "TextChangedI" },
		delete_check_events = "TextChanged",
	},
	config = function()
		require("snippets")
	end,
	keys = {
		{
			"<leader>is",
			"<cmd>Telescope luasnip<cr>",
			desc = "Insert Snippet",
		},
		{
			"<tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<C-l>",
			function()
				if require("luasnip").choice_active() then
					require("luasnip").change_choice(1)
				end
			end,
			mode = { "s", "i" },
		},
		{
			"<tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<s-tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
		},
	},
    dependencies = { "telescope" }
}
