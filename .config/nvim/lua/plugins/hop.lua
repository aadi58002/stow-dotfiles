return {
	"smoka7/hop.nvim",
	name = "hop",
	version = "*",
	opts = {},
	keys = {
		{ "gw", "<cmd>HopWord<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to word" },
		{ "gl", "<cmd>HopLineStart<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to line start" },
		{ "gp", "<cmd>HopPattern<cr>", mode = { "n", "x", "o" }, desc = "Leap forward to pattern" },
	},
}
