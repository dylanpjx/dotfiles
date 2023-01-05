local actions = require 'fzf-lua.actions'

require('fzf-lua').setup {
    winopts = {
        row = 1,
        width = 1,
        height = 0.4,

        keymap = {
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
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>/',
    function()
        if require 'fzf-lua.path'.is_git_repo(vim.loop.cwd(), true) then
            param = { cmd = "git grep --line-number --column --color=always" }
        else
            param = {}
        end
        require("fzf-lua").live_grep_native(param)
    end, opts)

vim.keymap.set('n', '<leader>fb', '<cmd>FzfLua buffers<CR>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>FzfLua oldfiles<CR>', opts)
vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua files<CR>', opts)
vim.keymap.set('n', '<leader>fp', '<cmd>Tzi<CR>', opts)

vim.keymap.set('n', '<leader>fs', '<cmd>FzfLua lsp_document_symbols<CR>', opts)
vim.keymap.set('n', '<leader>h', '<cmd>FzfLua help_tags<CR>', opts)

vim.cmd("FzfLua register_ui_select")
