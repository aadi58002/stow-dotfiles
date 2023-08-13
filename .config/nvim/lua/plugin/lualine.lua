-- plugins/lualine.lua:
return {
           -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = false,
            theme = 'tokyonight',
            component_separators = '|',
            section_separators = '',
        },
    },
}
