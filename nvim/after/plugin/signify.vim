let signify_sign_change = "│"

" mappings
nnoremap <Leader>gd :SignifyDiff<cr>
nnoremap <Leader>gh :SignifyHunkDiff<cr>
nnoremap <Leader>gu :SignifyHunkUndo<cr>

" hunk jumping
nnoremap <Leader>gj <plug>(signify-next-hunk)
nnoremap <Leader>gk <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)

