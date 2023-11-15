-- plugins/fidget.nvim
return {
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        lazy = true,
        event = "LspAttach",
        opts = {
            window = {
                blend = 0,
                relative = "editor",
            },
        },
    }
}
