local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins_list = {
    'autopair',
    'comment',
    'completion',
    'fidget',
    'gitsigns',
    'hop',
    'indent-blanklinenvim',
    'lsp',
    'mini-align',
    'mini-indentscope',
    'mini-surround',
    'neogit',
    'neorg',
    'oil',
    'snippets',
    'statusline',
    'telescope',
    'theme',
    'tree-sitter',
    'undotree',
}

local plugins = {}
for i = 1, #plugins_list do
    table.insert(plugins, { require('plugin.' .. plugins_list[i]) })
end
require("lazy").setup(plugins)
