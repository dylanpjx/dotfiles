vim.cmd.colorscheme('dracula')
vim.opt.termguicolors = true
vim.opt.laststatus = 3

vim.api.nvim_exec([[
    set t_Co=256

    set nocursorline
    hi cursorline gui=bold guibg=NONE
    hi cursorlinenr guibg=NONE

    hi StatusLine guibg=#202328
    hi StatusLineNC guibg=#202328

    " cursor (disabled)
    "let &t_ti.="\e[0 q"
    "let &t_te.="\e[0 q"
    "let &t_SI.="\e[6 q" "Insert mode
    "let &t_EI.="\e[0 q" "Normal mode (Else)
]], false)
