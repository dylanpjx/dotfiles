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
Plug 'sainnhe/gruvbox-material'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Code
Plug 'dhruvasagar/vim-table-mode'
Plug 'terrortylor/nvim-comment', {'branch': 'main'}
Plug 'akinsho/toggleterm.nvim'
Plug 'skywind3000/asyncrun.vim'
Plug 'vhda/verilog_systemverilog.vim'

" File 
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}

" QoL
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Initialise plugin system
call plug#end()

" dirvish
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" table
let g:table_mode_corner='|'
let g:table_mode_motion_left_map='<A-h>'
let g:table_mode_motion_right_map='<A-l>'
let g:table_mode_motion_up_map='<A-k>'
let g:table_mode_motion_down_map='<A-j>'

" asyncrun
let g:asyncrun_open = 8

lua << EOF
-- comment
require('nvim_comment').setup()

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "latex", "vim" },
  highlight = {
    enable = true,
    },
  }

-- toggleterm
require('toggleterm').setup{
  hide_numbers = false,
  direction = 'horizontal',
  size = 20
}

-- fzf
require('fzf-lua').setup{
winopts = {
  row = 1,
  width = 1,
  height = 0.4
  },
}
EOF
