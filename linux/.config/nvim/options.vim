set rnu nu
set splitbelow splitright
au BufNewFile,BufRead * set formatoptions-=cro

set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set foldmethod=marker

set wildmode=longest:list,full
set wildignorecase
set ttimeoutlen=0
set virtualedit=block

set showmatch
set ignorecase smartcase

set mouse=a
set undofile
set noswapfile nobackup

set title
set titlestring=Vim:\ %-25.55f titlelen=70
set noshowmode

set clipboard+=unnamedplus

" Autosave cursor position
set viewoptions=cursor,folds
au BufWinLeave *.* mkview!
au BufWinEnter *.* silent! loadview

set signcolumn=yes
set completeopt=menuone,longest
set listchars=trail:⎯,extends:>,precedes:<,multispace:▏\ ,tab:\ \ 
set list

" md
set cc=80
au FileType md set cc=117

" terminal
autocmd TermOpen * startinsert

" quickfix
autocmd FileType qf wincmd J

" ripgrep, https://phelipetls.github.io/posts/extending-vim-with-ripgrep/
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

command! MakeTags !ctags -R .
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
