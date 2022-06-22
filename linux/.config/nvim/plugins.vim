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

" File 
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}

" QoL 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Initialise plugin system
call plug#end()

" fzf
let $FZF_DEFAULT_COMMAND = 'fd --type f --exclude .git --ignore-file ~/.gitignore'
let g:fzf_layout = {
      \ 'window': {
        \ 'width': 1,
        \ 'height': 0.3,
        \ 'yoffset': 0.99,
        \ 'border': 'top'
        \ }}

nnoremap <leader>/ :Rg <CR>
nnoremap <leader>ls :call fzf#vim#buffers({'options': '--no-preview'}) <CR>
nnoremap <leader>ff :call fzf#vim#files('.', {'options': '--no-preview'}) <CR>
nnoremap <leader>fg :call fzf#vim#gitfiles('?', {'options': '--no-preview'}) <CR> 
nnoremap <leader>fh :call fzf#vim#history({'options': '--no-preview'}) <CR> 

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


lua << EOF
-- comment
require('nvim_comment').setup()

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "latex", "vim", "verilog" },
  highlight = {
    enable =true,
    },
  }

-- toggleterm
require("toggleterm").setup()

EOF
