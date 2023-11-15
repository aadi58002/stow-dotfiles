-- plugins/mini-align.lua:
return {
  "echasnovski/mini.align",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
