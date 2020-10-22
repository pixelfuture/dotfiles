vim.api.nvim_command("augroup highlight_on_yank")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command(
  "au TextYankPost * silent! lua vim.highlight.on_yank{ higroup='Substitute', timeout = 150, on_visual=false }"
)
vim.api.nvim_command("augroup END")
