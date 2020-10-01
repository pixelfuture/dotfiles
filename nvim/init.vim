set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" treesitter settings
lua require('treesitter')

" lsp settings
lua require('lsp')

let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" diagnostics
let g:diagnostic_enable_virtual_text = 1

augroup LuaHighlight
  autocmd!
  autocmd Filetype javascript setl omnifunc=v:tsserver.vim.lsp.omnifunc
augroup END

augroup LuaHighlight
  autocmd!
  autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup END

" telescope 
lua require('telescope').setup{}
nnoremap <silent><Leader>t <cmd>lua require'telescope.builtin'.fd{}<CR>
nnoremap <silent><Leader>p <cmd>lua require('hotrod.telescope').search_files()<CR>
nnoremap <silent><Leader>a <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><Leader>b <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <silent><Leader>fw <cmd>lua require'telescope.builtin'.grep_string{}<CR>
nnoremap <silent><Leader>fb <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
nnoremap <silent><Leader>ft <cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <silent><Leader>fq <cmd>lua require'telescope.builtin'.quickfix{}<CR>
nnoremap <silent><Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <silent><Leader>gst <cmd>lua require('hotrod.telescope').dirty_files()<CR>

" snippets.nvim
lua require'snippets'.use_suggested_mappings()
lua require'hotrod.snippets'
