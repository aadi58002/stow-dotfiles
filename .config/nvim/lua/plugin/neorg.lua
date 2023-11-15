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
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                  notes = "~/Documents/neorg",
              },
              default_workspace = "notes",
            },
          },
          ["core.summary"] = {},
          ["core.completion"] = {
             config = {
               engine = "nvim-cmp",
             },
          },
          ["core.integrations.telescope"] = {},
        },
      }
  },
}
