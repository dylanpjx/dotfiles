local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local opts = { noremap=true, silent = true }

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'Mofiqul/dracula.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {
    'crispgm/nvim-tabline', config = function ()
      require('tabline').setup({opts})
    end
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-nvim-lsp-signature-help'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use 'hrsh7th/cmp-cmdline'

  -- Notes
  use 'dhruvasagar/vim-table-mode'

  -- Code
  use 'skywind3000/asyncrun.vim'
  vim.g.asyncrun_open = 8

  use 'stefandtw/quickfix-reflector.vim'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'ibhagwan/fzf-lua'
  use 'echasnovski/mini.nvim'

  -- File
  use 'vifm/vifm.vim'
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.vifm_replace_netrw = 1

  use 'nanotee/zoxide.vim'
  vim.g.zoxide_use_select = true
  use {
    'numToStr/Navigator.nvim',
    config = function()
      require('Navigator').setup{
        vim.keymap.set('n', '<C-h>', '<CMD>NavigatorLeft<CR>', opts),
        vim.keymap.set('n', '<C-l>', '<CMD>NavigatorRight<CR>', opts),
        vim.keymap.set('n', '<C-k>', '<CMD>NavigatorUp<CR>', opts),
        vim.keymap.set('n', '<C-j>', '<CMD>NavigatorDown<CR>', opts),
      }
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
