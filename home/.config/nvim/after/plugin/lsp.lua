require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {
        'vimls', 'lua_ls', 'pyright', 'clangd'
    }
}

require("nvim-treesitter.configs").setup {
    ensure_installed = { 'lua', 'verilog', 'vim', 'vimdoc' },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
}

local lspconfig = require('lspconfig')
lspconfig.vimls.setup {}
lspconfig.lua_ls.setup {
    diagnostics = {
        globals = 'vim'
    },
}
lspconfig.pyright.setup {
    settings = {
        pyright = {
            venvPath = '$HOME/venv/',
        }
    }
}
lspconfig.clangd.setup {}

local cmp = require('cmp')

cmp.setup({
    preselect = 'true',

    mapping = cmp.mapping.preset.insert({
        ["<Tab>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
        { name = 'path' },
    },
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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>ld', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>lf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = { severity = vim.diagnostic.severity.ERROR },
    underline    = { severity = vim.diagnostic.severity.ERROR },
    float        = { border = "rounded" }
})

-- Auto display diagnostics on hover
vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})
