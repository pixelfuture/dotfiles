local cmd = vim.cmd
local autocmd = {}

help_in_new_tab = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "help" then
    vim.fn.execute("wincmd T")
  end
end

function autocmd.setup()
  -- prevents comments on a new line
  cmd("augroup NoAutoComments")
  cmd("autocmd!")
  cmd [[au BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
  cmd("augroup END")

  -- opens help in new tab
  cmd("augroup helpInNewTab")
  cmd("autocmd!")
  cmd [[au BufEnter *.txt lua help_in_new_tab{}]]
  cmd("augroup END")

  -- configure terminal - no numbers, automatically in insert mode
  cmd("augroup term_buf")
  cmd("autocmd!")
  cmd("au TermOpen * silent! setlocal norelativenumber nonumber")
  cmd("au TermOpen * silent! startinsert")
  cmd("augroup END")

  -- highlight on yank
  cmd("augroup highlight_on_yank")
  cmd("autocmd!")
  cmd("au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='Substitute', timeout = 150, on_visual=false }")
  cmd("augroup END")
end

return autocmd
