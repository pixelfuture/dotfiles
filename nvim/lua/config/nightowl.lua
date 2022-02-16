local nightowl = {}

function nightowl.setup()
  vim.api.nvim_exec([[
    augroup nightowl
      autocmd!
      autocmd ColorScheme * hi TabLineSel gui=bold guifg=#d2dee7 guibg=#0b2942
      autocmd ColorScheme * hi TabLine gui=none guifg=#5f7e97 guibg=#01111d
      autocmd ColorScheme * hi TabLineFill gui=none guibg=#00081a
      autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
      autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE
    augroup END
  ]], false)
end

return nightowl
