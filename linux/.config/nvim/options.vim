set rnu nu
set splitbelow splitright
au BufNewFile,BufRead * set formatoptions-=cro

set smarttab expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set foldmethod=marker

set wildmenu
set wildmode=longest:list,full
set wildignorecase
set ttimeoutlen=0
set virtualedit=block

set showmatch
set hlsearch incsearch
set ignorecase smartcase

set mouse=a
set backspace=indent,eol,start
set undofile
set noswapfile nobackup
set autoread

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

" md
set cc=80
au FileType md set cc=117

" Use init.lua for file checking
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

" Hacky way to prevent bug in https://github.com/neovim/neovim/issues/11330
au VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" File navigation
command! MakeTags !ctags -R .

" :read
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

set listchars=eol:↵,trail:⎯,extends:>,precedes:<
