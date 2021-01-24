local api = vim.api

api.nvim_command("augroup highlight_on_yank")
api.nvim_command("autocmd!")
api.nvim_command(
  "au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='Substitute', timeout = 150, on_visual=false }"
)
api.nvim_command("augroup END")
