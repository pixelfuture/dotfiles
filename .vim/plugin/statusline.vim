function! StatusLineGit()
  " depends on fugitive
  let l:branchname = fugitive#head()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ': ''
endfunction

set statusline=
set statusline+=%{StatusLineGit()}
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %y
set statusline+=%l:%c:%L

hi StatusLine        guifg=#ecc48d guibg=NONE    gui=none
hi StatusLineNC      guifg=#666666 guibg=NONE    gui=none

