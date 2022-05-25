set rnu nu
set splitbelow splitright
au BufNewFile,BufRead * set formatoptions-=cro

set smarttab expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set foldmethod=syntax

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
set autochdir

set clipboard+=unnamedplus

" Autosave cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set signcolumn=yes
set completeopt=menuone,longest
set cc=80
au FileType md set cc=117

" Hacky way to prevent bug in https://github.com/neovim/neovim/issues/11330
au VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" File navigation
command! MakeTags !ctags -R .

" :read
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
