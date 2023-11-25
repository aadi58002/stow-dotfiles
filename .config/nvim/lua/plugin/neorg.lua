return {
    {
        "nvim-neorg/neorg",
        lazy = true,
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
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
                ["core.esupports.metagen"]={
                    config = {
                        type = "auto"
                    }
                },
                ["core.integrations.telescope"] = {},
            },
        },
    },
}
