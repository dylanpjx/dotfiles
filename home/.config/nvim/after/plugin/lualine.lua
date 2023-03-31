local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  gray     = '#373c44',
}

require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = {
      normal = {
        a = { fg = colors.fg, bg = colors.gray },
        b = { fg = colors.fg, bg = colors.gray },
        c = { fg = colors.fg, bg = colors.bg }
      },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },

  sections = {
    lualine_a = {},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {
      function()
        return 'ln: %l'
      end,
      function()
        return 'col: %v'
      end
    },
    lualine_y = {'progress'},
    lualine_z = {}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
