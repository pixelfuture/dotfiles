" Create Scratch file
function! CreateScratch()
  execute "60vnew"
  execute "setlocal buftype=nofile bufhidden=hide noswapfile"
endfunction

command! Scratch call CreateScratch()
