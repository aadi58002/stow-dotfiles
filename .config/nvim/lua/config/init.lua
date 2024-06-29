-- vim.opt.guicursor = ""
-- for startutime optimization
vim.loader.enable()

-- Disable Mode showing in Message buffer
vim.opt.showmode = false

vim.opt.nu = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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

vim.opt.clipboard = "unnamedplus"

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 20

-- Disable check health unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- Increase the available ram neovim
vim.g.maxmempattern = 2000000

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = vim.api.nvim_create_augroup("BigFile", { clear = true }),
	pattern = "*.md",
	callback = function(ev)
		if vim.api.nvim_buf_line_count(ev.buf) >= 300 then
			vim.opt_local.syn = "OFF"
		end
	end,
})

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
