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
noremap <C-c> <C-w>c
nnoremap H gT
nnoremap L gt
nnoremap <leader>cd :tcd %:p:h <bar> pwd <CR>

" Resizing
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-w>O  <C-w>_ \| <C-w>\|
nnoremap <silent>gx :!xdg-open <c-r>=shellescape(expand('<cfile>'))<CR><CR>
nnoremap <silent>yn :let @+ = expand("%") <bar> echo expand("%") "is yanked to clipboard"<CR>
nnoremap <silent>yp :let @+ = expand("%:p") <bar> echo expand("%:p") "is yanked to clipboard"<CR>

set pastetoggle=<F2>
map <F3> :setlocal spell! <CR>
" Remove trailing whitespace
vnoremap \\ :s/\s\+$//e <CR>

" Search
nnoremap <silent><leader><leader> :noh <CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" ws
nnoremap <leader>s :w <CR>
nnoremap <leader>r :w <bar> source $MYVIMRC <bar> e <CR>
nnoremap <leader>ws :mksession! ws.vim <CR> <bar> :wqa <CR>

" Quickfix list
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Location list
" command! -nargs=1 Ngrep lvimgrep "<args>" $NOTES_DIR/**/*.txt

" Notetaking
nnoremap <leader>c :AsyncRun comp.sh <C-r>% <CR>
nnoremap <leader>o :!opout.sh <C-r>% <CR>
nnoremap <silent><leader>{ i<!--{{{--> <Esc>
nnoremap <silent><leader>} i<!--}}}--> <Esc>

" Verilog
command! YankMod norm gg/^module<CR>v/;<CR>y
command! CreateInst norm p<CR> vi(:s/.*\s\(\w\+\)/  .\1<CR>gv:s/\w\+/\0(\0)<CR>:noh<CR>
