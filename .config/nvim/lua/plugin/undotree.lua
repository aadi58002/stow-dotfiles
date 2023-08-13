return {
   'mbbill/undotree',
   lazy = false,
   cmd = "UndotreeToggle",
   keys = {
      { "<leader>uu", vim.cmd.UndotreeToggle, mode = "n", desc = "Undo Tree Toggle"},
   },
}
