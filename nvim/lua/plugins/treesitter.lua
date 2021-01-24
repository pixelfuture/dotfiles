local cmd = vim.cmd
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'maintained', 
  highlight = {enable = true}, -- this enables treesitter
}

cmd("augroup LuaFold")
cmd("autocmd!")
cmd [[autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]]
cmd("augroup END")
