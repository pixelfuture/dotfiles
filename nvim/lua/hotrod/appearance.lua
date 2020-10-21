vim.cmd [[colorscheme night-owl]]

-- Color Overrides
function apply_night_owl_color_overrides()
  vim.cmd('hi TabLineSel gui=bold guifg=#d2dee7 guibg=#0b2942') -- selected tab
  vim.cmd('hi TabLine gui=none guifg=#5f7e97 guibg=#01111d') -- inactive tab
  vim.cmd('hi TabLineFill gui=none guibg=#00081a') -- tab background
end

apply_night_owl_color_overrides()
