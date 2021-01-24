local cmd = vim.cmd

cmd("augroup status")
cmd("autocmd!")
cmd [[au WinEnter,BufEnter * lua generate_statusline_active()]]
cmd [[au WinLeave,BufLeave * lua generate_statusline_inactive()]]
cmd("augroup END")

generate_statusline_active = function()
  local blank = " "
  local statusline = ""
  local bufferNumber = "%#DiffChange# %n "
  local filename = "%#StatusLine# %f"  
  local modified = "%#StatusLineNC#%m"
  local fugitive = " %{FugitiveHead()}"
  statusline = bufferNumber .. filename .. blank .. modified .. "%=%#DiffChange#" .. blank .. fugitive .. blank .. "%l:%c:%L" .. blank
  vim.wo.statusline = statusline
end

generate_statusline_inactive = function()
  local blank = " "
  local statusline = ""
  local bufferNumber = " %n "
  local filename = " %f"  
  local modified = "%m"
  local fugitive = " %{FugitiveHead()}"
  statusline = bufferNumber .. blank .. filename .. blank .. modified .. "%=" .. blank .. fugitive .. blank .. "%l:%c:%L" .. blank
  vim.wo.statusline = statusline
end
