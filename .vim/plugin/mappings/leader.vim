" Leader mappings

"  <Leader><Leader> -- Open last buffer
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>; :
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>ev :tabe ~/.vim/vimrc<CR>
nnoremap <Leader>eu :tabe ~/standup.md<CR>
nnoremap <Leader>ez :tabe ~/.zshrc<CR>
nnoremap <Leader>et :tabe <BAR> startinsert <BAR> terminal<CR>
nnoremap <Leader>est :10split <BAR> startinsert <BAR> terminal<CR>
nnoremap <Leader>evt :100vsplit <BAR> startinsert <BAR> terminal<CR>

" Windows management
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wt <C-w><S-t>
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>w< 20<C-w><
nnoremap <Leader>w> 20<C-w>>
nnoremap <Leader>w- <C-w>-
nnoremap <Leader>w\ <C-w>|
