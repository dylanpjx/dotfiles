set nocompatible
colorscheme elflord

set t_u7=
set nu rnu
set showmode showcmd
set confirm
set mouse=a
set clipboard+=unnamed
set timeoutlen=500

set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab smartindent

set noswapfile nobackup undofile

set splitbelow splitright
set cursorline

set showmatch ignorecase smartcase

set list
set listchars=tab:>=,trail:⎯,extends:>,precedes:<

set suffixesadd+=.v,.sv,.lua

let g:netrw_winsize = 50
let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_sort_sequence = "[[[\/]$,*]]"
let g:netrw_sizestyle = "H"
let g:netrw_liststyle = 0
let g:netrw_localcopydircmd = "cp -r" 
let g:netrw_localmkdir = "mkdir -p"  
let g:netrw_localrmdir = "rm -r"    

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

inoremap jk <Esc>

nnoremap <Esc><Esc> :noh<CR>
nnoremap ^ g^
nnoremap 0 g0
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

vnoremap < <gv
vnoremap > >gv

nnoremap <leader>cd :lcd %:p:h<bar>pwd<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

nnoremap H gT
nnoremap L gt
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Y y$

nnoremap \\ <cmd>s/\\s\\+$//e<CR>

set laststatus=3
set statusline=
set statusline+=%*
" set statusline+=\ %y " Filetype
set statusline+=\ %{expand('%:p:h:t')}/%t " Filename
set statusline+=\ %m " Show if file has been modified
set statusline+=\ %{&paste?'[P]':''}
set statusline+=%1*

set statusline+=%= " Right side settings
set statusline+=%*
set statusline+=\%3l/%-3L
set statusline+=\ %3p%% " % in file
