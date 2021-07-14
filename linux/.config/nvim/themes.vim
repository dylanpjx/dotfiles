" Dark theme in Vim
filetype plugin on
syntax on
set background=dark
set t_Co=256

set termguicolors

let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
hi Normal ctermbg=NONE guibg=NONE

" Bracket colours
" hi MatchParen cterm=underline ctermbg=none ctermfg=yellow

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[0 q"
let &t_SI.="\e[6 q"
let &t_EI.="\e[0 q"
let &t_te.="\e[0 q"
set cursorline

" Statusline
let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ "\<C-v>" : 'V·Block ',
       \ 's'  : 'SELECT',
       \ 'S'  : 'S·Line ',
       \ "\<C-s>" : 'S·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'REPLACE ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \ 't'  : 'VIFM',
       \}

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %{FugitiveStatusline()}
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}

set statusline+=%= " Right side settings
" set statusline+=\ %c:%l/%L
set statusline+=\ %M " Show if file has been changed
set statusline+=\ %y " Filetype
set statusline+=\ %{expand('%:p:h:t')}/%t " Filename
set statusline+=\ %p%% " % in file
