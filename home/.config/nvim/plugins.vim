" Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')
call plug#begin(g:PLUGIN_HOME)
" Plugins go here
"
" Themes
Plug 'shaunsingh/oxocarbon.nvim', {'branch': 'fennel'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Code
Plug 'terrortylor/nvim-comment', {'branch': 'main'}
Plug 'skywind3000/asyncrun.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'numToStr/Navigator.nvim'

" Notes
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc-syntax'

" File
Plug 'elihunter173/dirbuf.nvim'
Plug 'ahmedkhalf/project.nvim'

" QoL
Plug 'junegunn/vim-easy-align'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'wellle/targets.vim'
Plug 'windwp/nvim-autopairs'
Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'dstein64/vim-startuptime'
" Initialise plugin system
call plug#end()

" table
let g:table_mode_corner='|'
let g:table_mode_motion_left_map='<A-h>'
let g:table_mode_motion_right_map='<A-l>'
let g:table_mode_motion_up_map='<A-k>'
let g:table_mode_motion_down_map='<A-j>'

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" asyncrun
let g:asyncrun_open=8

" pandoc
let g:pandoc#syntax#conceal#use=0

lua << EOF
-- comment
require('nvim_comment').setup()

-- tmux
require('Navigator').setup()
vim.keymap.set('n', '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set('n', '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set('n', '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set('n', '<C-j>', '<CMD>NavigatorDown<CR>')

-- fzf
local actions = require'fzf-lua.actions'
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

require('dirbuf').setup{}
require('nvim-surround').setup{}
require('nvim-autopairs').setup{}
require('project_nvim').setup{}

local fzf_lua = require("fzf-lua")
vim.keymap.set('n', '<leader>fp',
  function()
    local history = require("project_nvim.utils.history")
    local results = history.get_recent_projects()
    fzf_lua.fzf_exec(results, {
      actions = {
        ['default'] = {
          function(selected)
            fzf_lua.files({ cwd = selected[1] })
          end,
        }
      }
    })
  end,
  { noremap = true, silent = true })
EOF
