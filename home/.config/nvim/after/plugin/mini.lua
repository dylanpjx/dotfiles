require('mini.ai').setup()
require('mini.align').setup()
require('mini.comment').setup()
require('mini.surround').setup({
    custom_surroundings = {
      ['('] = { output = { left = '( ', right = ' )' } },
      ['['] = { output = { left = '[ ', right = ' ]' } },
      ['{'] = { output = { left = '{ ', right = ' }' } },
      ['<'] = { output = { left = '< ', right = ' >' } },
    },
    mappings = {
      add = 'ys',
      delete = 'ds',
      find = '',
      find_left = '',
      highlight = '',
      replace = 'cs',
      update_n_lines = '',
    },
    search_method = 'cover_or_next',
})

-- Remap adding surrounding to Visual mode selection
vim.api.nvim_del_keymap('x', 'ys')
vim.api.nvim_set_keymap('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], { noremap = true })
-- Make special mapping for "add surrounding for line"
vim.api.nvim_set_keymap('n', 'yss', 'ys_', { noremap = false })
