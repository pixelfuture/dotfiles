local g = vim.g
local api = vim.api
local cmd = vim.cmd
local autocmd = {}

function autocmd.setup()
  cmd("augroup PrettierOnSave")
  cmd("autocmd!")
  cmd [[autocmd BufWritePre *.js Neoformat]]
  cmd("augroup END")

  cmd("augroup NoAutoComments")
  cmd("autocmd!")
  cmd [[au BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
  cmd("augroup END")
end

return autocmd
