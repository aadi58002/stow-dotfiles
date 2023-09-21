-- plugins/neorg.lua:
return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-neorg/neorg-telescope" }},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
              }
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
    end,
  },
}
