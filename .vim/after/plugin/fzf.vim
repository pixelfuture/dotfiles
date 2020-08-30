" fzf mapping
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>gst :GFiles?<CR>
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>f :Rg<Space><C-r><C-w><CR>
nnoremap <Leader>' :Marks<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>H :Helptags!<CR>
nnoremap <Leader>C :Commands<CR>
nnoremap <Leader>M :Maps<CR>

" Use ripgrep to search for word in project
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

" Customize Files command to display a preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': 'enew' } " floating window
let g:fzf_preview_window = 'right:60%'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
