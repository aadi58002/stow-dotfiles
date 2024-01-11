return {
	"numToStr/Comment.nvim",
	name = "comment",
	opts = {},
	-- Setting keys so that lazy vim can add handlers to it so that it can be lazy loaded
	keys = { { "gc", mode = { "n", "v" }, desc = "Toggle Comment" }, { "gcc", desc = "Toggle Comment current line" } },
}
