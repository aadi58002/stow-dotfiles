-- plugins/neogit.lua:
return {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { "<leader>gg", "<cmd>Neogit cwd=%:p:h kind=split<cr>", mode = "n", desc = "Neogit" },
    },
    opts = {},
}
