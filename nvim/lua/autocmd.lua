local g = vim.g
local api = vim.api
local cmd = vim.cmd
local autocmd = {}

function autocmd.setup()
  cmd("augroup PrettierOnSave")
  cmd("autocmd!")
  -- cmd [[autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat]]
  cmd [[autocmd BufWritePre *.js Neoformat]]
  -- cmd [[autocmd FileType javascript setlocal formatprg=prettier\ --stdin]]
  cmd("augroup END")
end

return autocmd
