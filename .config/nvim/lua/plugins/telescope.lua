return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	cmd = "Telescope",
	version = false, -- telescope did only one release, so use HEAD for now
	keys = {
		{
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Open recent files",
		},
		{
			"<leader>/",
			"<cmd>Telescope live_grep<cr>",
			desc = "Grep (root dir)",
		},
		{
			"<leader><space>",
			"<cmd>Telescope find_files cwd=%:p:h hidden=true<cr>",
			desc = "Find Files (root dir)",
		},
		{
			"<leader>fg",
			"<cmd>Telescope git_files cwd=%:p:h<cr>",
			desc = "Find Files (git dir)",
		},
		{
			"<leader>bb",
			"<cmd>Telescope buffers show_all_buffers=true<cr>",
			desc = "Switch Buffer",
		},
		{
			"<leader>bk",
			"<cmd>bp|bd #<cr>",
			desc = "Kill this buffer",
		},
		{
			"<leader>is",
			"<cmd>Telescope luasnip<cr>",
			desc = "Insert Snippet",
		},
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
		},
		pickers = {},
		extensions = {
			file_browser = {
				hijack_netrw = true,
				show_symlinks = true,
				grouped = true,
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("luasnip")
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(_)
				local bind = vim.keymap.set
				bind("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Telescope Implementations" })
				bind("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Telescope References" })
				bind("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Telescope Definitions" })
			end,
		})
	end,
	dependencies = {
		"plenary",
		"benfowler/telescope-luasnip.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}
