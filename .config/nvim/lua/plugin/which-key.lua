-- plugins/which-key.lua:
return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>f"] = { name = "+file/find" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
