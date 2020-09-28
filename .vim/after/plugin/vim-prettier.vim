let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1

augroup Prettier
  autocmd!
  autocmd Filetype javascript autocmd BufWritePre <buffer> call PrettierAsync()
augroup END
