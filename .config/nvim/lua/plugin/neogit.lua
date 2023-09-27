-- plugins/neogit.lua:
return {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = {
        { "<leader>gg", "<cmd>Neogit cwd=%:p:h kind=split<cr>", mode = "n", desc = "Neogit" },
    },
    opts = {},
}
