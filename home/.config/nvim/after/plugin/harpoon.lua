local opts = { noremap = true }

require('harpoon').setup()

vim.keymap.set('n', '<leader>ja', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
vim.keymap.set('n', '<leader>jk', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.keymap.set('n', '<leader>j1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
vim.keymap.set('n', '<leader>j2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
vim.keymap.set('n', '<leader>j3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
vim.keymap.set('n', '<leader>jn', '<cmd>lua require("harpoon.ui").nav_next()<CR>', opts)
vim.keymap.set('n', '<leader>jp', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
