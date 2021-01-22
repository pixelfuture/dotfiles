" general
nnoremap Q gq
nnoremap H ^
nnoremap L $
nnoremap Y y$

" leader
nnoremap <Leader>; :
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>s :update<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>
nnoremap <Leader>R :luafile %<CR>

" edit
nnoremap <Leader>ev :e ~/.config/nvim<CR>
nnoremap <Leader>ep :e ~/standup.md<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>

" window management
nnoremap <M-h> <cmd>WindowMove('h')<CR>
nnoremap <M-j> <cmd>WindowMove('j')<CR>
nnoremap <M-k> <cmd>WindowMove('k')<CR>
nnoremap <M-l> <cmd>WindowMove('l')<CR>
nnoremap <Leader>ww <C-w>w
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wt <C-w>T
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>w, 20<C-w><
nnoremap <Leader>w. 20<C-w>>
nnoremap <Leader>w\\ <C-w>|
