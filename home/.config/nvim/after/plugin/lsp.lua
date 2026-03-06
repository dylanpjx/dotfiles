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

vim.lsp.config('slang-server', {
    cmd = { "slang-server" },
    root_markers = { ".git", ".slang" },
    filetypes = {
        "systemverilog",
        "verilog",
    },
})
vim.lsp.config('lua_ls', {
    diagnostics = {
        globals = 'vim'
    },
})
vim.lsp.config('pyright', {
    settings = {
        pyright = {
            venvPath = '$HOME/venv/',
        }
    }
})

vim.lsp.enable('slang-server')
vim.lsp.enable('vimls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

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
        vim.keymap.set("n", "gl", function()
            vim.diagnostic.open_float(nil, { scope = "line" })
        end, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
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
})
