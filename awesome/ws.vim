let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/awesome
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ws.vim
badd +1 ~/github/dotfiles/awesome/ws.vim
badd +10 wibar.lua
badd +85 rc.lua
badd +1 menu.lua
badd +175 keybinds.lua
badd +17 signals.lua
badd +56 rules.lua
badd +1 themes/default/theme.lua
badd +140 ~/Downloads/archlabs-awesome/.config/awesome/themes/archlabs/theme.lua
badd +5 scripts/bat.py
badd +20 volume.lua
badd +90 /etc/xdg/awesome/rc.lua
badd +7 ~/.config/nvim/init.vim
badd +18 ~/.config/nvim/mappings.vim
badd +120 quake.lua
badd +102 ~/.config/nvim/plugins.vim
badd +11 themes/zenburn/theme.lua
badd +19 themes/custom/theme.lua
badd +15 scripts/autorun.sh
badd +1 ~/.config/nvim/settings.vim
argglobal
%argdel
$argadd scripts/autorun.sh
set stal=2
tabnew
tabnew
tabnew
tabnew
tabnew
tabrewind
edit rc.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 90 - ((45 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 90
normal! 0
lcd ~/.config/awesome
tabnext
edit ~/.config/awesome/keybinds.lua
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '2resize ' . ((&lines * 1 + 26) / 52)
exe 'vert 2resize ' . ((&columns * 1 + 95) / 190)
exe '3resize ' . ((&lines * 1 + 26) / 52)
exe 'vert 3resize ' . ((&columns * 59 + 95) / 190)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 175 - ((19 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 175
normal! 033|
lcd ~/.config/awesome
wincmd w
argglobal
enew
balt ~/.config/awesome/keybinds.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.config/awesome
wincmd w
argglobal
enew
balt ~/.config/awesome/keybinds.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~/.config/awesome
wincmd w
exe '2resize ' . ((&lines * 1 + 26) / 52)
exe 'vert 2resize ' . ((&columns * 1 + 95) / 190)
exe '3resize ' . ((&lines * 1 + 26) / 52)
exe 'vert 3resize ' . ((&columns * 59 + 95) / 190)
tabnext
edit ~/.config/awesome/wibar.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 8 - ((7 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 030|
lcd ~/.config/awesome
tabnext
edit ~/.config/awesome/signals.lua
argglobal
balt ~/.config/awesome/wibar.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 0
lcd ~/.config/awesome
tabnext
edit ~/.config/awesome/rules.lua
argglobal
balt ~/.config/awesome/signals.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 49 - ((17 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 49
normal! 0
lcd ~/.config/awesome
tabnext
edit ~/.config/awesome/themes/custom/theme.lua
argglobal
balt ~/.config/awesome/rules.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 19 - ((18 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 024|
lcd ~/.config/awesome
tabnext 2
set stal=1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
