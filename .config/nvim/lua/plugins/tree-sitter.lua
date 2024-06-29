local add = MiniDeps.add

add({
  source = 'nvim-treesitter/nvim-treesitter',
  hooks = {post_checkout = function() vim.cmd('TSUpdate') end},
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'css',
    'html',
    'javascript',
    'json',
    'just',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
})


