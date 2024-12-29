local add = MiniDeps.add

add({
  source = "williamboman/mason.nvim",
  name = "mason",
})
require("mason").setup()

add({
  source = "williamboman/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  dependencies = { "mason" },
})
require("mason-lspconfig").setup()

add({
  source = "neovim/nvim-lspconfig",
  name = "nvim-lspconfig",
  dependencies = { "mason", "mason-lspconfig" },
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})

-- Markdown
lspconfig.marksman.setup({})

lspconfig.pyright.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.eslint.setup({})
lspconfig.svelte.setup({})
lspconfig.tailwindcss.setup({})

lspconfig.tsserver.setup({
  init_options = {
    maxTsServerMemory = "8192",
  }
})
lspconfig.volar.setup({})

lspconfig.clangd.setup({})
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local buffer = ev.buf
      local bind = vim.keymap.set
      bind("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp Goto Declaration", buffer = buffer })
      bind("n", "gd", vim.lsp.buf.definition, { desc = "Lsp Goto Definations", buffer = buffer })
      bind("n", "K", vim.lsp.buf.hover, { desc = "Lsp Info at point", buffer = buffer })
      bind("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Lsp Rename", buffer = buffer })
      bind(
        { "n", "v" },
        "<leader>ca",
        vim.lsp.buf.code_action,
        { desc = "Lsp Code actions", buffer = buffer }
      )
  end,
})
