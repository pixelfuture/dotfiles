augroup term_buf
	autocmd!
	au TermOpen * silent! setlocal norelativenumber nonumber
	au TermOpen * silent! startinsert
augroup END

tnoremap <Esc> <C-\><C-n>
