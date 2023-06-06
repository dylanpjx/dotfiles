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
  'Mofiqul/dracula.nvim',
  'nvim-lualine/lualine.nvim',
  {
    'crispgm/nvim-tabline',
    config = function()
      require('tabline').setup({ opts })
    end
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  },
  'hrsh7th/cmp-cmdline',

  -- Notes
  'dhruvasagar/vim-table-mode',

  -- Code
  'skywind3000/asyncrun.vim',

  'stefandtw/quickfix-reflector.vim',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'ibhagwan/fzf-lua',
  'echasnovski/mini.nvim',

  -- File
  'vifm/vifm.vim',
  'nanotee/zoxide.vim',
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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vifm_replace_netrw = 1
vim.g.zoxide_use_select = true
