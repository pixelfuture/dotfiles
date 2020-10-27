lua require'hotrod.init'
let g:python3_host_prog = "/usr/local/opt/python@3.8/bin/python3"
set shiftwidth=2 tabstop=2 softtabstop=2

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
hi User1 guifg=#ecc48d guibg=#112630 
" telescope 
" lua require'hotrod.telescope'
" nnoremap <silent><Leader>t <cmd>lua require'hotrod.telescope'.fd{}<CR>
" nnoremap <silent><Leader>p <cmd>lua require'hotrod.telescope'.search_files{}<CR>
" nnoremap <silent><Leader>a <cmd>lua require'hotrod.telescope'.live_grep{}<CR>
" nnoremap <silent><Leader>b <cmd>lua require'hotrod.telescope'.buffers{}<CR>
" nnoremap <silent><Leader>fw <cmd>lua require'hotrod.telescope'.grep_string{}<CR>
" nnoremap <silent><Leader>fz <cmd>lua require'hotrod.telescope'.current_buffer_fuzzy_find{}<CR>
" nnoremap <silent><Leader>gst <cmd>lua require('hotrod.telescope').dirty_files{}<CR>
" nnoremap <silent><Leader>fo <cmd>lua require('hotrod.telescope').oldfiles{}<CR>
" nnoremap <silent><Leader>fh <cmd>lua require('hotrod.telescope').help_tags{}<CR>
" nnoremap <silent><Leader>fC <cmd>lua require('hotrod.telescope').command_history{}<CR>
" nnoremap <silent><Leader>fc <cmd>lua require'hotrod.telescope'.lsp_code_actions{}<CR>
" nnoremap <silent><Leader>en <cmd>lua require'hotrod.telescope'.edit_neovim{}<CR>
" nnoremap <silent><Leader>es <cmd>lua require'hotrod.telescope'.edit_scripts{}<CR>
" nnoremap <silent><Leader>em <cmd>lua require'hotrod.telescope'.edit_markdown{}<CR>
" nnoremap <silent><Leader>gb <cmd>lua require('hotrod.telescope').git_branches{}<CR>

" nnoremap <silent><Leader>fr <cmd>lua require'hotrod.telescope'.lsp_references{}<CR>
" nnoremap <silent><Leader>fy <cmd>lua require'hotrod.telescope'.lsp_workspace_symbols{}<CR>
" nnoremap <silent><Leader>fR <cmd>lua require('hotrod.telescope').reloader{}<CR>
" nnoremap <silent><Leader>ft <cmd>lua require'hotrod.telescope'.treesitter{}<CR>
" nnoremap <silent><Leader>fq <cmd>lua require'hotrod.telescope'.quickfix{}<CR>

" snippets.nvim
" lua require'snippets'.use_suggested_mappings()
" lua require'hotrod.snippets'
