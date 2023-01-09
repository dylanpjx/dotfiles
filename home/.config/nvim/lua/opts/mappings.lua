vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Editor
vim.keymap.set('i', 'jk', '<Esc>', opts)
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', opts)

vim.keymap.set('n', '<leader>s', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>r', '<cmd>so<CR>', { noremap = true })

vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', '^', 'g^', opts)
vim.keymap.set('n', '0', 'g0', opts)

vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '<C-o>', '<C-o>zz', opts)
vim.keymap.set('n', '<C-i>', '<C-i>zz', opts)

vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

vim.keymap.set('n', 'H', 'gT', opts)
vim.keymap.set('n', 'L', 'gt', opts)

vim.keymap.set('n', '<leader>cd', '<cmd>tcd %:p:h<bar>pwd<CR>', opts)


vim.keymap.set('n', '<leader>ws', '<cmd>mksession! ws.vim <bar> <bar> <cmd>wqa <CR>', opts)
vim.keymap.set('n', '<silent>gx', '<cmd>!xdg-open <c-r>=shellescape(expand("<cfile>"))<CR><CR>', opts)

-- Navigation
vim.keymap.set('n', '<C-Up>', '<C-w>+', opts)
vim.keymap.set('n', '<C-Down>', '<C-w>-', opts)
vim.keymap.set('n', '<C-Left>', '<C-w><', opts)
vim.keymap.set('n', '<C-Right>', '<C-w>>', opts)
vim.keymap.set('n', '<C-w>O',  '<C-w>_ | <C-w>|', opts)
vim.keymap.set('n', '<C-c>', '<C-w>c', opts)

-- Coding
vim.keymap.set('n', '\\', '<cmd>s/\\s\\+$//e<CR>', opts) -- remove trailing whitespace
vim.keymap.set('v', '//', 'y/\\V<C-R>=escape(@","/\")<CR><cr>', opts)

vim.keymap.set('n', '<leader>c', '<cmd>AsyncRun comp.sh <C-r>% <CR>', { noremap=true })
vim.keymap.set('n', '<leader>o', '<cmd>!opout.sh <C-r>% <CR>', { noremap=true })

vim.keymap.set('n', 'yn', '<cmd>let @+ = expand("%") <bar> echo expand("%") "is yanked to clipboard"<CR>', opts)
vim.keymap.set('n', 'yp', '<cmd>let @+ = expand("%:p") <bar> echo expand("%:p") "is yanked to clipboard"<CR>', opts)

-- Verilog
