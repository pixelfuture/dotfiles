local vim = _G.vim
vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')
local nvim_lsp = require('nvim_lsp')
local api = vim.api
local bufremap = api.nvim_buf_set_keymap
-- local remap = api.nvim_set_keymap

local on_attach = function (_, bufnr)
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'diagnostic'.on_attach()
  require'completion'.on_attach()

  -- Mappings
  local opts = { noremap=true, silent=true }
  -- declaration not working on tsserver atm
  -- bufremap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  bufremap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  bufremap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  bufremap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- bufremap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  bufremap(bufnr, 'n', 'g0', '<Cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  bufremap(bufnr, 'n', 'gW', '<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  -- bufremap(bufnr, 'i', 'g8', '<Cmd>lua print("hi")<CR>', opts)
  -- bufremap(bufnr, 'i', '<Tab>', 'pumvisible() ? "\<C-n>" : "\<Tab>"')
end

local servers = {'tsserver', 'sumneko_lua'}

vim.schedule(
  function()
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach
      }
    end
  end
)
-- Use <Tab> and <S-Tab> to navigate through popup menu
-- remap('i', '<Tab>', [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], { silent=true, expr=true })
-- remap('i', '<S-Tab>', [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], { silent=true, expr=true })

-- Set completeopt to have a better completion experience
-- vim.o.completeopt='menuone,noinsert,noselect,preview'

-- Avoid showing message extra message when using completion
-- vim.o.shortmess='aoOtTIc'
