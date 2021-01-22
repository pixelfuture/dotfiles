function! WinMove(key) 
  let curwin = winnr()
  execute("wincmd " . a:key)
  " create window
  if curwin == winnr()
    if a:key == "j"
      execute "wincmd s"
    elseif a:key == "k"
      execute "wincmd s"
      execute "wincmd k"
    elseif a:key == "h"
      execute "wincmd v"
      execute "wincmd h"
    else
      execute "wincmd v"
    endif
  endif
endfunction
" Search Neovim Files .config/nvim
command! -bang -nargs=1 WindowMove call WinMove <args>
