local opts = { noremap = true }

-- Editor
vim.keymap.set('i', 'jk', '<Esc>', opts)

vim.api.nvim_exec([[
  nnoremap <expr> j v:count ? 'j' : 'gj'
  nnoremap <expr> k v:count ? 'k' : 'gk'
]], false)

vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', opts)

-- vim.keymap.set('n', 'yy', '0y$', opts)
vim.keymap.set('n', 'yn', '<cmd>let @+ = expand("%") <bar> echo expand("%") "is yanked to clipboard"<CR>', opts)
vim.keymap.set('n', 'yp', '<cmd>let @+ = expand("%:p") <bar> echo expand("%:p") "is yanked to clipboard"<CR>', opts)

vim.keymap.set('n', '^', 'g^', opts)
vim.keymap.set('n', '0', 'g0', opts)

vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
vim.keymap.set('n', '<C-o>', '<C-o>zz', opts)
vim.keymap.set('n', '<C-i>', '<C-i>zz', opts)

vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==', opts)

vim.keymap.set('n', 'H', 'gT', opts)
vim.keymap.set('n', 'L', 'gt', opts)

vim.keymap.set('n', '<leader>cd', '<cmd>tcd %:p:h<bar>pwd<CR>', opts)
vim.keymap.set('n', '-', '<cmd>Ex<CR>', opts)

vim.keymap.set('n', '<leader>ws', '<cmd>mksession! ws.vim <bar> <bar> <cmd>wqa <CR>', opts)
vim.keymap.set('n', '<silent>gx', '<cmd>!xdg-open <c-r>=shellescape(expand("<cfile>"))<CR><CR>', opts)

-- Navigation
vim.keymap.set('n', '<Up>', '<C-w>+', opts)
vim.keymap.set('n', '<Down>', '<C-w>-', opts)
vim.keymap.set('n', '<Left>', '<C-w><', opts)
vim.keymap.set('n', '<Right>', '<C-w>>', opts)
vim.keymap.set('n', '<C-w>O', '<C-w>_ | <C-w>|', opts)
vim.keymap.set('n', '<C-c>', '<C-w>c', opts)

function PrevTodo()
    local date

    if (os.date("%A") == "Monday") then
        date = os.date('%d-%m-%y', os.time() - 72 * 60 * 60)
    else
        date = os.date('%d-%m-%y', os.time() - 24 * 60 * 60)
    end

    local fname = date .. '.md'
    vim.cmd('e' .. '$HOME/Documents/Notes/Todo/' .. fname)
end

vim.keymap.set('n', '[n', '<cmd>lua PrevTodo()<CR>', opts)

-- Coding
vim.keymap.set('n', '\\', '<cmd>s/\\s\\+$//e<CR>', opts) -- remove trailing whitespace
vim.keymap.set('v', '//', 'y/\\V<C-R>=escape(@","/\")<CR><CR>', opts)

vim.keymap.set('n', '<leader>c', '<cmd>AsyncRun comp.sh % <CR>', opts)
vim.keymap.set('n', '<leader>o', '<cmd>!opout.sh % <CR>', opts)

vim.keymap.set('n', 'yn', '<cmd>let @+ = expand("%") <bar> echo expand("%") "is yanked to clipboard"<CR>', opts)
vim.keymap.set('n', 'yp', '<cmd>let @+ = expand("%:p") <bar> echo expand("%:p") "is yanked to clipboard"<CR>', opts)
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', opts)

-- Diff
vim.keymap.set('n', 'gh', '<cmd>diffget //2<CR>')
vim.keymap.set('n', 'gl', '<cmd>diffget //3<CR>')
