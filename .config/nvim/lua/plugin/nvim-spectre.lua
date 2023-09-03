-- plugins/nvim-spectre.lua:
return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    { "<leader>sr", function() require("spectre").open_visual({  is_insert_mode = true }) end, desc = "Replace in files (Spectre)" },
  },
}
