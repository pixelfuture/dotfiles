" Mappings
nnoremap Q gq
nnoremap H ^
nnoremap L $
nnoremap Y y$

" Better j/k navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j') 
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" should I use these? Used to not overwrite unnamed register
" noremap <Leader>y "yy
" noremap <Leader>p "yp
" noremap <Leader>P "yP
" noremap <Leader>x "_x
" noremap <Leader>d "_d
