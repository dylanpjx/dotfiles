filetype plugin on
syntax on
set background=dark
set t_Co=256

set termguicolors

" let g:gruvbox_material_transparent_background = 1
" let g:gruvbox_material_better_performance = 1
colorscheme doom-one

" Bracket colours
" hi MatchParen cterm=underline ctermbg=none ctermfg=yellow

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[0 q"
let &t_SI.="\e[6 q"
let &t_EI.="\e[0 q"
let &t_te.="\e[0 q"

" Statusline
" hi User1 guifg=#ebdbb2 guibg=#3c3836
" hi StatusLine guifg=black guibg=#fe8019
" hi StatusLineNC guifg=black guibg=#d65d0e
"
set laststatus=2
" set statusline=
" set statusline+=%*
" " set statusline+=\ %y " Filetype
" set statusline+=\ %{expand('%:p:h:t')}/%t " Filename
" set statusline+=\ %m " Show if file has been modified
" set statusline+=\ %{&paste?'[P]':''}
" set statusline+=%1*
" set statusline+=\ %{fugitive#head()}
" " set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}
"
" set statusline+=%= " Right side settings
" set statusline+=%*
" set statusline+=\%3l/%-3L
" set statusline+=\ %3p%% " % in file
