require('lualine').setup{
    options = {
        theme = 'nord'
    },
    tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {},
  },
}

require'tabline'.setup({ enable = false })
