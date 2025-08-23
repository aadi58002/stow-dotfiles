-- Mini.nvim should already be installed with mini.deps

require("mini.ai").setup()
require("mini.align").setup()
require("mini.basics").setup({
  options = {
    extra_ui = true,
    win_borders = 'double',
  },

  autocommands = {
    basic = true,
    relnum_in_visual_mode = false,
  },
})
require("mini.bracketed").setup()
require("mini.comment").setup()
require("mini.completion").setup()
require("mini.extra").setup()

require("mini.files").setup()
require("mini.git").setup()

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require("mini.indentscope").setup({
    symbol = "│",
    options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "notify", "toggleterm", "lazyterm",},
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

require("mini.jump").setup()

local MiniJump2d = require('mini.jump2d')
MiniJump2d.setup({
    spotter = MiniJump2d.gen_spotter.pattern('%w+', 'start'),
    view = {
        dim = true,
        n_steps_ahead = 3,
    },
})

vim.api.nvim_set_hl(0, 'MiniJump2dSpot', { fg = "#ff007c", ctermfg = 198, bold = true })
vim.api.nvim_set_hl(0, 'MiniJump2dSpotAhead', { fg = "#00dfff", ctermfg = 45, bold = true })

require("mini.misc").setup()
MiniMisc.setup_auto_root({ '.git', 'Cargo.toml', 'package.json' })

require("mini.notify").setup()

require("mini.pick").setup()
vim.keymap.set("n", "<leader><space>", MiniExtra.pickers.explorer)

require("mini.splitjoin").setup()
require("mini.surround").setup()
