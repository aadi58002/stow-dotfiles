-- plugins/hop.nvim
return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {},
	keys = {
		{ "gw", "<cmd>HopWord<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
		{ "gl", "<cmd>HopLineStart<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
		{ "gp", "<cmd>HopPattern<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to" },
	},
}
