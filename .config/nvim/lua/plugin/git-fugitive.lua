-- plugins/git-fugitive.lua:
return {
    'tpope/vim-fugitive',
    keys = {
        { "<leader>gg", vim.cmd.Git, mode = "n", desc = "Git Fugitive" },
    }
}
