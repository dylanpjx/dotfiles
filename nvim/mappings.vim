" Mapping jk to normal mode
inoremap jk <esc>

" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Switch tabs
nnoremap H gT
nnoremap L gt

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Resizing
nnoremap <C-Up> :resize +2 <CR>
nnoremap <C-Down> :resize -2 <CR>
nnoremap <C-Left> :vertical resize -2 <CR>
nnoremap <C-Right> :vertical resize +2 <CR>

" Override default behaviour for Y
nnoremap Y y$

" No highlight
nnoremap <leader><leader> :noh <CR>

" Paste mode toggle
set pastetoggle=<F2>

" Spellcheck toggle
map <F3> :setlocal spell! <CR>

" Edit .vimrc
nnoremap \ev :tabnew $MYVIMRC <bar> tcd %:h <CR>

" Source .vimrc
nnoremap \r :source $MYVIMRC <CR>

" Save all files
nnoremap <leader>s :wa <CR>

" Save workspace, save all files, exit
nnoremap <leader>ws :mksession! ws.vim <CR> <bar> :wqa <CR>
