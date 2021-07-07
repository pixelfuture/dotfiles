local cmd = vim.cmd
local ts = require 'nvim-treesitter.configs'
ts.setup {
  ensure_installed = 'maintained', 
  highlight = {enable = true}, -- this enables treesitter
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
  context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
    enable = true
  }
}

cmd("augroup LuaFold")
cmd("autocmd!")
cmd [[autocmd Filetype javascript setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]]
cmd("augroup END")
