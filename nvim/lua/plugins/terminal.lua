local api = vim.api

api.nvim_command("augroup term_buf")
api.nvim_command("autocmd!")
api.nvim_command("au TermOpen * silent! setlocal norelativenumber nonumber")
api.nvim_command("au TermOpen * silent! startinsert")
api.nvim_command("augroup END")
api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = false})
