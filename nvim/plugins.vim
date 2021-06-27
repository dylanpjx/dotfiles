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
" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons' 

" Dir
Plug 'vifm/vifm.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-tree.lua'

" Code
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/vim-clang-format'

" Git
Plug 'sindrets/diffview.nvim', {'branch': 'main'}
Plug 'TimUntersberger/neogit'

" QoL 
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'terrortylor/nvim-comment', {'branch': 'main'}
Plug 'folke/which-key.nvim', {'branch': 'main'}
" Initialise plugin system
call plug#end()

" vifm.vim
let g:vifm_embed_split = 0
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = 1
let g:vifm_exec = expand('$HOME/.config/vifm/scripts/vifmrun')

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>

" Telescope
nnoremap <C-e> :Telescope file_browser theme=get_ivy<cr>
nnoremap <C-f> :Telescope current_buffer_fuzzy_find theme=get_ivy<cr>
nnoremap <C-p> :Telescope buffers theme=get_ivy<cr>

" Whichkey
lua require("which-key").setup()
hi WhichKeyFloat ctermbg=BLACK ctermfg=BLACK 

" Autopairs
lua require('nvim-autopairs').setup()

" Comment
lua require('nvim_comment').setup()

" Neogit
lua require('neogit').setup()

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

" clang-format
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11" }

let g:clang_format#auto_format= 1

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Autoinstall coc extensions
let g:coc_global_extensions = [
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-vimtex',
      \ 'coc-pyright',
      \ 'coc-java',
      \ 'coc-lua'
      \ ]

