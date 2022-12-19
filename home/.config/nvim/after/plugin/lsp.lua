local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'sumneko_lua',
    'vimls',
    'pyright',
    'clangd',
    'svlangserver',
})

local cmp = require 'cmp'
cmp.setup ({
    window = {
        completion = {
            border = 'rounded',
        },
        documentation = {
            border = nil,
        },
    },
})

lsp.on_attach(function(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local keymap = vim.keymap.set
    local opts = { noremap=true }

    -- Mappings
    keymap('n', '<leader>d' ,'<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap('n', '[d' ,'<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d' ,'<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format { async = true } <CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.disable() <CR>', opts)
    buf_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.enable() <CR>', opts)

end)

lsp.setup()
