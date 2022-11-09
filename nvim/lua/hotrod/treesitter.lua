local cmd = vim.cmd
local ts_status, ts = pcall(require, "nvim-treesitter.configs")
if not ts_status then
  return
end
ts.setup {
  ensure_installed = { "bash", "c", "css", "go", "graphql", "html", "javascript", "lua", "markdown", "python", "rust", "scss", "typescript", "yaml", "tsx", "vim"},
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
    enable = true,
  },
  autotag = { -- windwp/nvim-ts-autotag
    enable = true,
  },
  autopairs = { -- windwp/nvim-autopairs
    enable = true,
  },
  context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
    enable = true,
    enable_autocmd = false,
  },
}

cmd("augroup LuaFold")
cmd("autocmd!")
cmd [[autocmd Filetype * setl foldmethod=expr foldexpr=nvim_treesitter#foldexpr()]]
cmd("augroup END")

