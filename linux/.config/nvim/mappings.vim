inoremap jk <Esc>
nnoremap Q <nop>
" Move the cursor based on physical lines, not the actual lines.
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0
nnoremap <silent> $ g$
nnoremap <silent> E ge
" Center the cursor vertically when moving
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" Keep selection when shifting
vnoremap > >gv
vnoremap < <gv
" Move lines
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c
nnoremap <silent>H :tabprev<CR>
nnoremap <silent>L :tabnext<CR>
nnoremap <leader><BS> <C-6>
nnoremap <leader>gd <C-]>

" Resizing
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

nnoremap <silent>gx :!xdg-open <c-r>=shellescape(expand('<cfile>'))<CR><CR>
nnoremap <silent>yn :let @" = expand("%") <bar> echo expand("%") "is yanked to clipboard"<CR>
nnoremap <silent>yp :let @" = expand("%:p") <bar> echo expand("%:p") "is yanked to clipboard"<CR>

set pastetoggle=<F2>
map <F3> :setlocal spell! <CR>

" Search
nnoremap <silent><leader><leader> :noh <CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" rc
nnoremap <silent><leader>ev :e $MYVIMRC <CR>
nnoremap <silent><leader>eb :e $HOME/.bashrc <CR>
nnoremap <silent><leader>ea :e $HOME/.config/awesome/rc.lua <CR>
nnoremap <leader>r :source $MYVIMRC <CR>

" ws
nnoremap <leader>s :w <CR>
nnoremap <leader>ws :mksession! ws.vim <CR> <bar> :wqa <CR>

" Quickfix list
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap (c :cfirst<CR>
nnoremap )c :clast<CR>

" Location list
" command! -nargs=1 Ngrep lvimgrep "<args>" $NOTES_DIR/**/*.txt


" Terminal mappings
" tnoremap <leader>th <C-\><C-n><C-w>h
" tnoremap <leader>tj <C-\><C-n><C-w>j
" tnoremap <leader>tk <C-\><C-n><C-w>k
" tnoremap <leader>tl <C-\><C-n><C-w>l
nnoremap <leader>ot :split <bar> resize 15 <bar> term <CR>
tnoremap <Esc> <C-\><C-N>
tnoremap <Esc><Esc> <C-c>

" Notetaking
nnoremap <leader>c :!comp.sh <C-r>% <CR>
nnoremap <leader>o :!opout.sh <C-r>% <CR>
nnoremap <silent><leader>{ i<!--{{{--> <Esc>
nnoremap <silent><leader>} i<!--}}}--> <Esc>
