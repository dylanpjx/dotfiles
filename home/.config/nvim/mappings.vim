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
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
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

" fzf
nnoremap <leader>/ :lua require('fzf-lua').live_grep_native()<CR>
nnoremap <leader>fb :lua require('fzf-lua').buffers()<CR>
nnoremap <leader>ff :lua require('fzf-lua').files()<CR>
nnoremap <leader>fg :lua require('fzf-lua').git_files()<CR>
nnoremap <leader>fh :lua require('fzf-lua').oldfiles()<CR>

" rc
nnoremap <silent><leader>fn :lua require('fzf-lua').files({cwd = '~/Documents/Notes/'})<CR>
nnoremap <silent><leader>fc :lua require('fzf-lua').files({cwd = '~/.dotfiles'})<CR>
nnoremap <leader>r :w <bar> source $MYVIMRC <bar> e <CR>

" ws
nnoremap <leader>s :w <CR>
nnoremap <leader>ws :mksession! ws.vim <CR> <bar> :wqa <CR>

" Quickfix list
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>

" Location list
" command! -nargs=1 Ngrep lvimgrep "<args>" $NOTES_DIR/**/*.txt

" Terminal mappings
" tnoremap <leader>th <C-\><C-n><C-w>h
" tnoremap <leader>tj <C-\><C-n><C-w>j
" tnoremap <leader>tk <C-\><C-n><C-w>k
" tnoremap <leader>tl <C-\><C-n><C-w>l
nnoremap <leader><CR> :ToggleTerm<CR>
tnoremap <Esc> <C-\><C-N>

" Notetaking
nnoremap <leader>c :AsyncRun comp.sh <C-r>% <CR>
nnoremap <leader>o :!opout.sh <C-r>% <CR>
nnoremap <silent><leader>{ i<!--{{{--> <Esc>
nnoremap <silent><leader>} i<!--}}}--> <Esc>

" Verilog
command! YankMod norm gg/^module<CR>v/;<CR>y
command! CreateInst norm p<CR> vi(:s/.*\s\(\w\+\)/  .\1<CR>gv:s/\w\+/\0(\0)<CR>:noh<CR>