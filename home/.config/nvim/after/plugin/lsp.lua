local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'sumneko_lua',
    'vimls',
    'pyright',
    'clangd',
    'svlangserver',
    'tsserver',
})

-- CMP
local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_mappings = lsp.defaults.cmp_mappings({
    -- go to next placeholder in the snippet
    ['<C-n>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),
    -- go to previous placeholder in the snippet
    ['<C-p>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
})

lsp.setup_nvim_cmp({
    select_behavior = 'insert',
    preselect = 'none',
    completion = {
        completeopt = 'menu,menuone,noselect'
    },
    sources = {
        { name = 'path' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = cmp_mappings,
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})


-- LSP
lsp.on_attach(function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local keymap = vim.keymap.set
    local opts = { noremap = true }

    -- Mappings
    keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>lf', '<cmd>LspZeroFormat<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.disable() <CR>', opts)
    buf_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.enable() <CR>', opts)
    buf_set_keymap('n', '<leader>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', '<C-k>', '<cmd>NavigatorUp<CR>', opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = { severity = vim.diagnostic.severity.ERROR },
    underline = { severity = vim.diagnostic.severity.ERROR }
})
