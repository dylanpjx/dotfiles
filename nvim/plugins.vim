" Auto install vim-plug
let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
if executable('curl')
  if empty(glob(g:VIM_PLUG_PATH))
    silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
          \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    augroup plug_init
      autocmd!
      autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
    augroup END
  endif
endif

" vim-plug dir
let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')
call plug#begin(g:PLUGIN_HOME)
" Plugins go here
"
" Colorschemes
Plug 'sainnhe/gruvbox-material'

" Dir
Plug 'vifm/vifm.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Code
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'
Plug 'machakann/vim-swap'

"QoL 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Initialise plugin system
call plug#end()

" vifm.vim
let g:vifm_embed_split = 1
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = 1

" Telescope
nnoremap <C-e> :Telescope file_browser theme=get_ivy<cr>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find theme=get_ivy<cr>
nnoremap <C-p> :Telescope buffers theme=get_ivy<cr>

" clang-format
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11" }

let g:clang_format#auto_format= 1

" VimTex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique'
let g:vimtex_view_general_options_latexmk = '--unique'

" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_ignore_filters = [
            \ 'Overfull',
            \ 'Underfull',
            \ 'Packages',
            \]

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Autoinstall coc extensions
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-prettier',
      \ 'coc-vimtex',
      \ 'coc-pyright',
      \ 'coc-java',
      \ 'coc-lua'
      \ ]

