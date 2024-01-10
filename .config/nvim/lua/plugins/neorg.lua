return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "plenary", "telescope" },
	cmd = "Neorg",
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.concealer"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/Documents/neorg",
					},
					default_workspace = "notes",
				},
			},
			["core.summary"] = {},
			["core.journal"] = {
				config = {
					strategy = "flat",
				},
			},
			["core.completion"] = {
				config = {
					engine = "nvim-cmp",
				},
			},
			["core.esupports.metagen"] = {
				config = {
					type = "auto",
				},
			},
			["core.integrations.telescope"] = {},
		},
	},
}
