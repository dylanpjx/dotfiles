local actions = require 'fzf-lua.actions'

require('fzf-lua').setup {
  winopts = {
    -- row = 1,
    -- width = 1,
    -- height = 0.4,

    keymap = {
      fzf = {
        ["alt-a"] = "select-all+accept",
      },
      actions = {
        files = {
          ["ctrl-q"] = actions.file_sel_to_qf, -- qf
          ["ctrl-l"] = actions.file_sel_to_ll, -- loclist
        },
      },
    },
  },
}

local fzf_lua = require("fzf-lua")
local opts = { noremap = true }

vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep<CR>', opts)

vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua oldfiles<CR>', opts)
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>FzfLua git_files<CR>', opts)
vim.keymap.set('n', '<leader>fp', '<cmd>Tzi<CR>', opts)

vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', opts)
vim.keymap.set('n', '<leader>h', '<cmd>FzfLua help_tags<CR>', opts)

vim.cmd("FzfLua register_ui_select")
