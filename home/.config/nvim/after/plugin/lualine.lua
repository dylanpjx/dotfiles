local colors = {
  bg   = '#202328',
  fg   = '#bbc2cf',
  gray = '#373c44',
}

require('lualine').setup {
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
    lualine_b = {'branch','diagnostics' },
    lualine_c = {
      {
        function()
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return '• %t %m'
            end
          end

          return '%t %m'
        end,
      },
    },
    lualine_x = {
      function()
        return 'ln: %l'
      end,
      function()
        return 'col: %v'
      end
    },
    lualine_y = { 'progress' },
    lualine_z = {}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
