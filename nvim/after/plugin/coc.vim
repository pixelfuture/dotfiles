" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
" nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <silent> gy <Plug>(coc-type-definition)
" nnoremap <silent> gi <Plug>(coc-implementation)
" nnoremap <silent> gr <Plug>(coc-references)

augroup coc
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd Filetype javascript nnoremap [g <Plug>(coc-diagnostic-prev)
  autocmd Filetype javascript nnoremap ]g <Plug>(coc-diagnostic-next)
augroup END
