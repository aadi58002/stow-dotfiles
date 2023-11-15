-- plugin/snippets.lua
return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    lazy = true,
    opts = {
        history = true,
        update_events  = {"TextChanged","TextChangedI"},
        delete_check_events = "TextChanged",
    },
    config = function()
        require('snippets')
    end,
    keys = {
        {
            "<tab>",
            function()
                return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
            end,
            expr = true, silent = true, mode = "i",
        },
        { "<C-l>",
        function()
            if require("luasnip").choice_active() then
                require("luasnip").change_choice(1)
            end
        end, mode = {"s", "i"}},
        { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
        { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
}
