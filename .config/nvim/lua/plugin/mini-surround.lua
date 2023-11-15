-- plugins/mini-surround.lua:
return {
  "echasnovski/mini.surround",
  version = false,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
