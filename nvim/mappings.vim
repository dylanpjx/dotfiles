" Mapping jk to normal mode
inoremap jk <esc>

" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

" Switch tabs
nnoremap H gT
nnoremap L gt

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Resizing
nnoremap <A-Up> :resize +2 <CR>
nnoremap <A-Down> :resize -2 <CR>
nnoremap <A-Left> :vertical resize -2 <CR>
nnoremap <A-Right> :vertical resize +2 <CR>

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
nnoremap <leader>s :w <CR>

" Save workspace, save all files, exit
nnoremap <leader>ws :mksession! ws.vim <CR> <bar> :wqa <CR>
