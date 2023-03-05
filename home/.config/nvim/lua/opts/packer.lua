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
    use 'wellle/targets.vim'
    use {
        'mbbill/undotree',
        vim.keymap.set('n', '<leader>u', "<cmd>UndotreeToggle<CR>", opts)
    }
    use 'tpope/vim-fugitive'
    use {
        'ibhagwan/fzf-lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use 'echasnovski/mini.nvim'
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- File
    use 'nanotee/zoxide.vim'
    vim.g.zoxide_use_select = true
    use {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup{
                keymaps = {
                    ["<C-h>"] = false
                },
                view_options = {
                    show_hidden = true,
                },
                vim.keymap.set('n', '<leader>e', '<cmd>vsp<bar>wincmd L<bar>Oil<CR>', opts),
                vim.keymap.set("n", "-", require("oil").open, opts)
            }
        end
    }
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
