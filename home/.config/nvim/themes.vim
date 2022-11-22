set t_Co=256

set termguicolors

colorscheme dracula
hi cursorlinenr guifg=white

set cursorline
hi cursorline gui=bold guibg=NONE
hi cursorlinenr guibg=NONE

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[0 q"
let &t_te.="\e[0 q"
let &t_SI.="\e[6 q" "Insert mode
let &t_EI.="\e[0 q" "Normal mode (Else)

" Statusline
set laststatus=3
