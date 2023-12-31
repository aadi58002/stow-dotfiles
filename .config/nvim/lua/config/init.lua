-- vim.opt.guicursor = ""
-- for startutime optimization
vim.loader.enable()

vim.opt.nu = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"

vim.opt.virtualedit = "block"

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.opt.scrolloff = 999

vim.opt.updatetime = 50

vim.opt.clipboard = 'unnamedplus'

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 20
