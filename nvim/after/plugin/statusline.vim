function! ActiveStatusLine()
  let l:blank = " "
  let l:statusline = ""
  let l:statusline .= "%#DiffChange# %n "
  let l:statusline .= "%#StatusLine# %f"
  let l:statusline .= blank
  let l:statusline .= "%#StatusLineNC#%m"
  let l:statusline .= "%=%#DiffChange#" 
  let l:statusline .= blank
  let l:statusline .= " %{FugitiveHead()}"
  let l:statusline .= blank
  let l:statusline .= "%l:%c:%L"
  let l:statusline .= blank
  return l:statusline
endfunction

function! InactiveStatusLine()
  let l:blank = " "
  let l:statusline = ""
  let l:statusline .= " %n "
  let l:statusline .= " %f "
  let l:statusline .= "%m"
  let l:statusline .= "%= " 
  let l:statusline .= " %{FugitiveHead()}"
  let l:statusline .= blank
  let l:statusline .= "%l:%c:%L"
  let l:statusline .= blank
  return l:statusline
endfunction

function! s:StatusLine(mode)
  let l:bn = bufname("%")
  if &buftype == "nofile" || &filetype == "netrw" || l:bn == "[BufExplorer]" || l:bn == "undotree_2"
        " Don't set a custom status line for special windows.
        return
  elseif a:mode == "inactive"
        setlocal statusline=%!InactiveStatusLine()
    else
        setlocal statusline=%!ActiveStatusLine()
    endif
endfunction

augroup status
  autocmd!
  au WinEnter,BufEnter * call s:StatusLine("active")
  au WinLeave,BufLeave * call s:StatusLine("inactive")
augroup END
