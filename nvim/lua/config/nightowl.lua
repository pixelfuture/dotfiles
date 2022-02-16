local cmd = vim.cmd
local nightowl = {}

function nightowl.setup()
  cmd 'colorscheme night-owl'
  cmd 'augroup nightowl'
  cmd 'autocmd!'
  cmd 'autocmd ColorScheme * hi TabLineSel gui=bold guifg=#d2dee7 guibg=#0b2942'
  cmd 'autocmd ColorScheme * hi TabLine gui=none guifg=#5f7e97 guibg=#01111d'
  cmd 'autocmd ColorScheme * hi TabLineFill gui=none guibg=#00081a'
  cmd 'autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE'
  cmd 'autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE'
  cmd('augroup END')
end

return nightowl
