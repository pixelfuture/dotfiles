" statusline linter
" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))

"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors

"     return l:counts.total == 0 ? '' : printf(
"     \   ' %dW %dE ',
"     \   all_non_errors,
"     \   all_errors
"     \)
" endfunction
" statusline active
augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InActiveStatus()
augroup END

set statusline=%!ActiveStatus()
function! ActiveStatus() abort
  let statusline=""
  let statusline.="%4*\ %n"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%0*"
  let statusline.="%0*\ %f"
  let statusline.="%2*\ %m" 
  let statusline.="%0*%="
  " let statusline.="%{LinterStatus()}"
  let statusline.="%3*%y\ "
  let statusline.="%l:%c:%L"

  return statusline
endfunction

" statusline inactive
" function! InActiveStatus() abort
"   let statusline=""
"   let statusline.=" %n"
"   let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
"   let statusline.=" "
"   let statusline.=" %f"
"   let statusline.=" %m" 
"   let statusline.="%="
"   " let statusline.="%{LinterStatus()}"
"   let statusline.="%y "
"   let statusline.="%l:%c:%L"

"   return statusline
" endfunction

" Color Overrides
hi StatusLine        guifg=#ecc48d guibg=NONE    gui=none
hi StatusLineNC      guifg=#666666 guibg=NONE    gui=none
hi User1             guifg=#999    guibg=NONE    gui=none
hi User2             guifg=#addb67 guibg=NONE    gui=none
hi User3             guifg=#82aaff guibg=NONE    gui=none
hi User4             guifg=#333333 guibg=#ecc48d gui=none

