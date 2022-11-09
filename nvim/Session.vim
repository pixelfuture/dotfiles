let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +43 lua/hotrod/options.lua
badd +1 init.lua
badd +57 ~/dotfiles/nvim_bak/init.lua
badd +16 lua/hotrod/keymaps.lua
badd +10 ~/dotfiles/nvim_bak/lua/config/mappings.lua
badd +82 lua/hotrod/plugins.lua
badd +51 ~/dotfiles/nvim_bak/lua/plugins.lua
badd +1 ~/dotfiles/nvim_bak/lua/config/indentline.lua
badd +1 lua/hotrod/surround.lua
badd +1 NetrwMessage
badd +12 lua/hotrod/colorscheme.lua
badd +2 after/plugin/yank.lua
badd +5 ~/dotfiles/nvim_bak/lua/config/nightowl.lua
badd +1 lua/hotrod/neoscroll.lua
badd +65 lua/hotrod/completion.lua
badd +32 ~/dotfiles/nvim_bak/lua/config/lsp_cmp.lua
badd +15 lua/hotrod/lsp/mason.lua
badd +7 lua/hotrod/lsp/init.lua
badd +1 lua/hotrod/lsp/lsp-installer.lua
badd +83 lua/hotrod/lsp/handlers.lua
badd +53 ~/dotfiles/nvim_bak/lua/config/lsp.lua
badd +3 lua/hotrod/lsp/settings/jsonls.lua
badd +3 lua/hotrod/illuminate.lua
badd +16 lua/hotrod/lsp/settings/sumneko_lua.lua
badd +11 ~/dotfiles/nvim_bak/lua/config/treesitter.lua
badd +1 ~/dotfiles/nvim_bak/lua/config/statusline.lua
badd +61 lua/hotrod/telescope.lua
badd +40 Session.vim
badd +29 lua/hotrod/treesitter.lua
badd +4 lua/hotrod/comment.lua
badd +51 ~/dotfiles/nvim_bak/lua/config/winbar.lua
badd +1 lua/hotrod/autopairs.lua
badd +10 lua/hotrod/nullls.lua
badd +7 lua/hotrod/maximize.lua
badd +6 lua/hotrod/color.lua
badd +225 lua/hotrod/feline.lua
argglobal
%argdel
edit init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 1resize ' . ((&columns * 81 + 123) / 246)
exe '2resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 2resize ' . ((&columns * 81 + 123) / 246)
exe '3resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 3resize ' . ((&columns * 82 + 123) / 246)
exe '4resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 4resize ' . ((&columns * 123 + 123) / 246)
exe '5resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 5resize ' . ((&columns * 122 + 123) / 246)
argglobal
balt lua/hotrod/plugins.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 18 - ((17 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 022|
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim/lua/hotrod/color.lua", ":p")) | buffer ~/dotfiles/nvim/lua/hotrod/color.lua | else | edit ~/dotfiles/nvim/lua/hotrod/color.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim/lua/hotrod/color.lua
endif
balt ~/dotfiles/nvim/lua/hotrod/neoscroll.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 025|
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim/lua/hotrod/feline.lua", ":p")) | buffer ~/dotfiles/nvim/lua/hotrod/feline.lua | else | edit ~/dotfiles/nvim/lua/hotrod/feline.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim/lua/hotrod/feline.lua
endif
balt ~/dotfiles/nvim/init.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
31
normal! zo
32
normal! zo
40
normal! zo
91
normal! zo
92
normal! zo
151
normal! zo
let s:l = 225 - ((11 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 225
normal! 09|
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim_bak/lua/plugins.lua", ":p")) | buffer ~/dotfiles/nvim_bak/lua/plugins.lua | else | edit ~/dotfiles/nvim_bak/lua/plugins.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim_bak/lua/plugins.lua
endif
balt ~/dotfiles/nvim/lua/hotrod/plugins.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 86 - ((3 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 86
normal! 07|
lcd ~/dotfiles/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/dotfiles/nvim_bak/lua/config/statusline.lua", ":p")) | buffer ~/dotfiles/nvim_bak/lua/config/statusline.lua | else | edit ~/dotfiles/nvim_bak/lua/config/statusline.lua | endif
if &buftype ==# 'terminal'
  silent file ~/dotfiles/nvim_bak/lua/config/statusline.lua
endif
balt ~/dotfiles/nvim_bak/lua/config/winbar.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 13 - ((10 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 022|
lcd ~/dotfiles/nvim
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 1resize ' . ((&columns * 81 + 123) / 246)
exe '2resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 2resize ' . ((&columns * 81 + 123) / 246)
exe '3resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 3resize ' . ((&columns * 82 + 123) / 246)
exe '4resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 4resize ' . ((&columns * 123 + 123) / 246)
exe '5resize ' . ((&lines * 25 + 26) / 53)
exe 'vert 5resize ' . ((&columns * 122 + 123) / 246)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
