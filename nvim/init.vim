lua require'hotrod.init'

" treesitter settings
" lua require'hotrod.treesitter'
" augroup LuaFold
"   autocmd!
"   autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
" augroup END


" lsp settings
" lua require('lsp')

" let g:completion_enable_snippet = 'snippets.nvim'
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" diagnostics
" let g:diagnostic_enable_virtual_text = 1

" augroup LuaHighlight
"   autocmd!
"   autocmd Filetype javascript setl omnifunc=v:tsserver.vim.lsp.omnifunc
" augroup END


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
