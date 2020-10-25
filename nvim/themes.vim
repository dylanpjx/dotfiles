" Dark theme in Vim
syntax on
set background=dark
set t_Co=256

" let g:gruvbox_hls_cursor='fg2'
" let g:gruvbox_italic='1'
colorscheme gruvbox

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
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'REPLACE ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \ 't'  : 'VIFM',
       \}

set laststatus=2
set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %M
set statusline+=\ %y
set statusline+=\ %t
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}

set statusline+=%= " Right side settings
set statusline+=\ %c:%l/%L
set statusline+=\ %p%%
