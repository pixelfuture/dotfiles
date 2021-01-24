local api = vim.api
local lspconfig = require('lspconfig')
local completion = require('completion')

lspconfig.tsserver.setup{}
api.nvim_command("augroup completion")
api.nvim_command("autocmd!")
api.nvim_command("au BufEnter * lua require'completion'.on_attach()")
api.nvim_command("augroup END")
api.nvim_set_keymap('n', '<Esc>', [[<C-\><C-n>]], {noremap = true, silent = false})

api.nvim_set_keymap('n', '<Leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = false})
