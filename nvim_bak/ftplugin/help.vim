" Help Update
augroup HelpInTabs
  autocmd!
  autocmd BufEnter *.txt call HelpInNewTab() 
augroup END

function! HelpInNewTab ()
  if &buftype == 'help'
    "Convert the help window to a tab...
    execute "normal \<C-W>T"
  endif
endfunction

