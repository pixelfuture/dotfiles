if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let &l:include = 'from\|require'
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|function|class)|export\s+'

augroup LuaHighlight
  autocmd!
  autocmd Filetype javascript setl omnifunc=v:tsserver.vim.lsp.omnifunc
augroup END

augroup LuaFold
  autocmd!
  autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
augroup END

