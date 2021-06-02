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

" Colorschemes
Plug 'morhetz/gruvbox'
" Plug 'dracula/vim', { 'as': 'dracula' }

" Dir
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Snippets
Plug 'honza/vim-snippets'


Plug 'jiangmiao/auto-pairs'
Plug 'freitass/todo.txt-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialise plugin system
call plug#end()

" vifm.vim
let g:vifm_embed_split = 1

" fzf.vim
function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute 'GFiles' git_dir
    else
        execute 'Files'
    endif
endfunction
command! ProjectFiles execute s:find_files()

nnoremap <leader>e :Files<CR>
nnoremap <leader>f :Rg<Cr>
nnoremap <leader>o :History<CR>

" Jsx-Pretty
let g:vim_jsx_pretty_colorful_config = 1

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
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
      \ 'coc-lua',
      \ ]

