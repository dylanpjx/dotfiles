local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
require("lazy").setup({
    -- Theme
    {
        'Mofiqul/dracula.nvim',
        config = function()
            require('dracula').setup { transparent_bg = true }
        end
    },
    -- LSP Support
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-cmdline',

    -- Notes
    'dhruvasagar/vim-table-mode',

    -- Code
    'skywind3000/asyncrun.vim',
    'stefandtw/quickfix-reflector.vim',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'ibhagwan/fzf-lua',
    'nvim-mini/mini.nvim',

    -- File
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        config = function()
            require('oil').setup {
                vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            }
        end,
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
    {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup {
                vim.keymap.set('n', '<C-h>', '<CMD>NavigatorLeft<CR>', opts),
                vim.keymap.set('n', '<C-l>', '<CMD>NavigatorRight<CR>', opts),
                vim.keymap.set('n', '<C-k>', '<CMD>NavigatorUp<CR>', opts),
                vim.keymap.set('n', '<C-j>', '<CMD>NavigatorDown<CR>', opts),
            }
        end
    },
})


vim.g.asyncrun_open = 8
vim.g.zoxide_use_select = true
vim.g.undotree_SetFocusWhenToggle = true
