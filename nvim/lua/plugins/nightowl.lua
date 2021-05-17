local cmd = vim.cmd

local setup = function()
  cmd 'colorscheme night-owl'
  cmd 'augroup nightowl'
  cmd 'autocmd!'
  cmd 'autocmd ColorScheme * hi TabLineSel gui=bold guifg=#d2dee7 guibg=#0b2942'
  cmd 'autocmd ColorScheme * hi TabLine gui=none guifg=#5f7e97 guibg=#01111d'
  cmd 'autocmd ColorScheme * hi TabLineFill gui=none guibg=#00081a'
  cmd 'autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE'
  cmd 'autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE'
  -- cmd 'autocmd ColorScheme * hi User1 guifg=#ecc48d guibg=#112630'
  -- cmd 'autocmd ColorScheme * hi SignifySignChange gui=none guifg=#ffd787 guibg=none'
  -- cmd 'autocmd ColorScheme * hi SignifySignAdd gui=none guifg=#aadb67 guibg=none'
  -- cmd 'autocmd ColorScheme * hi SignifySignDelete gui=none guifg=#ff5874 guibg=none'
  -- cmd 'autocmd ColorScheme * hi SignifySignDeleteFirstLine gui=none guifg=#ff5874 guibg=none'
  cmd('augroup END')
end

setup()
