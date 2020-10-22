local cmd = vim.cmd
cmd("colorscheme night-owl")

-- Color Overrides
function apply_night_owl_color_overrides()
  -- vim.schedule defers the lua code until package.path has caught up to runtimepath
  -- https://github.com/neovim/neovim/issues/12577
  vim.schedule(
    function()
      cmd("hi TabLineSel gui=bold guifg=#d2dee7 guibg=#0b2942") -- selected tab
      cmd("hi TabLine gui=none guifg=#5f7e97 guibg=#01111d") -- inactive tab
      cmd("hi TabLineFill gui=none guibg=#00081a") -- tab background

      -- signify
      cmd("hi SignifySignChange gui=none guifg=#ffd787 guibg=none")
      cmd("hi SignifySignAdd gui=none guifg=#aadb67 guibg=none")
      cmd("hi SignifySignDelete gui=none guifg=#ff5874 guibg=none")
      cmd("hi SignifySignDeleteFirstLine gui=none guifg=#ff5874 guibg=none")
    end
  )
end

apply_night_owl_color_overrides()
