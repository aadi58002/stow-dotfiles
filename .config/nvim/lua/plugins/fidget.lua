-- plugins/fidget.nvim
return {
	"j-hui/fidget.nvim",
	tag = "legacy",
	event = "LspAttach",
	opts = {
		window = {
			blend = 0,
			relative = "editor",
		},
	},
}
