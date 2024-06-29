return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "plenary",
      "nvim-web-devicons", -- not strictly required, but recommended
      "nui",
    },
    opts = {
        close_if_last_window = true,
    },
    keys = {
        { "<leader><space>", "<cmd>Neotree toggle<cr>", desc = "Open Neotree" },
    },
}
