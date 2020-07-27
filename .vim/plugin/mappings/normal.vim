" Mappings
nnoremap Q gq
nnoremap H ^
nnoremap L $
nnoremap Y y$

" Better j/k navigation
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j') 
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


