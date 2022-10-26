set t_Co=256

set termguicolors

colorscheme oxocarbon
set cursorline
hi cursorline gui=bold guibg=NONE
hi cursorlinenr guibg=NONE

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[0 q"
let &t_te.="\e[0 q"
let &t_SI.="\e[6 q" "Insert mode
let &t_EI.="\e[0 q" "Normal mode (Else)

" Statusline
hi StatusLine guifg=#161616
hi StatusLineNC guifg=#161616
" hi User1 guifg=#ebdbb2 guibg=#3c3836
" hi StatusLine guifg=black guibg=#fe8019
" hi StatusLineNC guifg=black guibg=#d65d0e

set laststatus=3
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
