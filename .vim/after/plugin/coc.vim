" " use <tab> for trigger completion and navigate to the next complete item
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Show documentation on hover
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming
" nmap <leader>rn <Plug>(coc-rename)

" " Find references
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Jumping between snippets placeholder
" let g:coc_snippet_next = '<c-j>'
" let g:coc_snippet_prev = '<c-k>'

" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

