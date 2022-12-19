local o = vim.opt

o.title = true
vim.cmd('set noshowmode')
o.signcolumn = 'yes'
o.cc = '80'

o.wildmenu = true
o.wildignorecase = true
o.wildmode = 'longest:list,full'
o.completeopt='menu,menuone,noselect'

o.showmatch = true
o.ignorecase = true
o.smartcase = true

o.list = true
o.listchars = 'trail:⎯,extends:>,precedes:<,multispace:▏ ,tab:→ '

o.mouse = 'a'

o.swapfile = false
o.backup = false
o.undofile = true

o.splitbelow = true
o.splitright = true

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.clipboard = 'unnamedplus'

o.virtualedit = 'block'
o.foldmethod = 'marker'

vim.cmd('set suffixesadd+=.v,.sv,.lua')

-- Autosave cursor position
o.viewoptions = 'cursor,folds'
vim.api.nvim_exec([[
    autocmd FileType qf wincmd J " qf always on bottom
    autocmd TermOpen * startinsert

    au BufWinLeave *.* mkview!
    au BufWinEnter *.* silent! loadview

    au FileType md set cc=117
    augroup pandoc_syntax
        au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    augroup END

    command! MakeTags !ctags -R .
    command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

    if executable("rg")
      set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
      set grepformat=%f:%l:%c:%m
    endif

]], false)
