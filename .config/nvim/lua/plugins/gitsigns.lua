local add = MiniDeps.add

add({
  source = "lewis6991/gitsigns.nvim",
  name = "gitsigns",
})

require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
})
