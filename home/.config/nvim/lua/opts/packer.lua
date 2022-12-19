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

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- Code
    use 'skywind3000/asyncrun.vim'
    use 'stefandtw/quickfix-reflector.vim'
    use 'dhruvasagar/vim-table-mode'
    use 'vim-pandoc/vim-pandoc-syntax'
    use 'junegunn/vim-easy-align'
    use 'wellle/targets.vim'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use {
        'ibhagwan/fzf-lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use {
        'kylechui/nvim-surround',
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup{}
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup{}
        end
    }

    -- File
    use {
        'elihunter173/dirbuf.nvim',
        config = function()
            require('dirbuf').setup{}
        end
    }
    use {
        'ahmedkhalf/project.nvim',
        config = function ()
            require('project_nvim').setup{}
        end
    }
    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end
    }

end)
