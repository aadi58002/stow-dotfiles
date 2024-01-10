-- plugins/mini-clue.lua:
return {

    "echasnovski/mini.clue",
    version = false,
    lazy = false,
    opts = {
        triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = "'" },
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },
        },
        clues = {
            { mode = 'n', keys = '<Leader>f', desc = 'Find' },
            { mode = 'n', keys = '<Leader>l', desc = 'LSP' },
            { mode = 'n', keys = '<Leader>w', desc = 'Window' },
            { mode = 'n', keys = '<Leader>s', desc = 'Session' },
            { mode = 'n', keys = '<Leader>b', desc = 'Buffer' },
            { mode = 'n', keys = '<Leader>g', desc = 'Git' },
            { mode = 'n', keys = '<Leader>u', desc = 'UI' },
            { mode = 'n', keys = '<Leader>q', desc = 'NVim' },
            function() require("mini.clue").gen_clues.g() end,
            function() require("mini.clue").gen_clues.builtin_completion() end,
            function() require("mini.clue").gen_clues.marks() end,
            function() require("mini.clue").gen_clues.registers() end,
            function() require("mini.clue").gen_clues.windows() end,
            function() require("mini.clue").gen_clues.z() end,
        },
    },
}
