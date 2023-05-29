require 'lualine'.setup {
    component_separators = { left = '', right = '' },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {},
        lualine_x = { 'diagnostics', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'fugitive' }
    },

    extensions = { 'quickfix', 'fugitive', 'fzf' },
}
