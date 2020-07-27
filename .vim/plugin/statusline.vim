augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InActiveStatus()
augroup END

set statusline=%!ActiveStatus()
function! ActiveStatus() abort
  let statusline=""
  let statusline.="%4*\ %n"
  " let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
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
function! InActiveStatus() abort
  let statusline=""
  let statusline.=" %n"
  " let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.=" "
  let statusline.=" %f"
  let statusline.=" %m" 
  let statusline.="%="
  " let statusline.="%{LinterStatus()}"
  let statusline.="%y "
  let statusline.="%l:%c:%L"

  return statusline
endfunction

