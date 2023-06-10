local o = vim.opt
local api = vim.api

o.timeoutlen = 500
o.confirm = true
o.title = true
o.mouse = 'a'
vim.cmd('set noshowmode')
vim.cmd('set noshowcmd')
o.signcolumn = 'yes'
o.cc = '' --'80'

o.wildmenu = true
o.wildignorecase = true
o.wildmode = 'longest:list,full'
o.completeopt = 'menu,menuone,noselect'

o.showmatch = true
o.ignorecase = true
o.smartcase = true

o.list = true
o.listchars = 'trail:⎯,extends:>,precedes:<,multispace:▏ ,tab:→ '

o.swapfile = false
o.backup = false
o.undofile = true

o.splitbelow = true
o.splitright = true

o.nu = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.clipboard = 'unnamedplus'

o.virtualedit = 'block'
o.foldmethod = 'marker'

vim.cmd('set suffixesadd+=.v,.sv,.lua')

-- Autosave cursor position
o.viewoptions = 'cursor,folds'

o.autochdir = false
-- Auto mkdir
api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- netrw
vim.netrw_winsize = 50
vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_sort_sequence = [[[\/]$,*]] -- show directories first
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 0

vim.g.netrw_localcopydircmd = "cp -r" -- Enable recursive copy of directories in *nix systems
vim.g.netrw_localmkdir = "mkdir -p"   -- Enable recursive creation of directories in *nix systems
vim.g.netrw_localrmdir = "rm -r"      -- Enable recursive removal of directories in *nix systems

api.nvim_exec([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=60 }

" qf always on bottom
autocmd FileType qf wincmd J

" start term in insert mode
autocmd TermOpen * startinsert

" restore view
au BufWinLeave *.* mkview!
au BufWinEnter *.* silent! loadview

au FileType md set cc=117

command! MakeTags !ctags -R .
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
]], false)
