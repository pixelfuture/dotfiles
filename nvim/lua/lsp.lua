local nvim_lsp= require('nvim_lsp')

local on_attach = function (_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.slp.omnifunc')
  require'diagnostic'.on_attach()
  require'completion'.on_attach()

  -- Mappings
  local opts = { noremap=true, silent=true }
  -- declaration not working on tsserver atm
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'i', 'g8', '<Cmd>lua print("hi")<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'i', '<Tab>', 'pumvisible() ? "\<C-n>" : "\<Tab>"')
end

local servers = {'tsserver'}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach
  }
end

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], { silent=true, expr=true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], { silent=true, expr=true })

-- Set completeopt to have a better completion experience
vim.o.completeopt='menuone,noinsert,noselect,preview'

-- Avoid showing message extra message when using completion
vim.o.shortmess='aoOtTIc'
