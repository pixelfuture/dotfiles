set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vim/vimrc

" treesitter settings
lua require('treesitter')

" lsp settings
lua require('lsp')

" let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" diagnostics
let g:diagnostic_enable_virtual_text = 1

augroup LuaHighlight
  autocmd!
  autocmd Filetype javascript setl omnifunc=v:tsserver.vim.lsp.omnifunc
augroup END

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Avoid showing message extra message when using completion
" set shortmess+=c
