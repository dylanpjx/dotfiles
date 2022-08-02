lua << eof
local lualine = require('lualine')

local colors = {
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  red      = '#ec5f67',  
  violet   = '#a9a1e1',
}

local config = {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'filename', 
        path = 1,
      },
    },
    lualine_c = { 
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.cyan },
        },
      }
    },
  lualine_x = {
      {
      'branch',
      color = { fg = colors.violet, gui = 'bold' },
      }
    },
  lualine_y = {'filetype'},
  lualine_z = {'%3l/%-3L'}
},
inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {'filename'},
  lualine_x = {'%3l/%-3L'},
  lualine_y = {},
  lualine_z = {}
},
tabline = {
  lualine_a = {'tabs'},
  lualine_b = {'filename'},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {
    {
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      color = { bg = '#98c379', gui = 'bold' },
      icon = ' LSP:'
    },
  }
},
extensions = {}
}

lualine.setup(config)
eof
