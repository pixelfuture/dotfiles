-- local api = vim.api
local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;
  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    ultisnips = true;
  };
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

vim.lsp.protocol.CompletionItemKind = {
  ' [text]',
  ' [method]',
  'ƒ [function]',
  ' [constructor]',
  ' [field]',
  ' [variable]',
  ' [class]',
  ' [interface]',
  ' [module]',
  ' [property]',
  ' [unit]',
  ' [value]',
  ' [enum]',
  ' [keyword]',
  '﬌ [snippet]',
  ' [color]',
  ' [file]',
  ' [reference]',
  ' [dir]',
  ' [enummember]',
  ' [constant]',
  ' [struct]',
  '  [event]',
  ' [operator]',
  ' [type]',
}

-- function completion_confirm()
--   local complete_info = vim.fn.complete_info()
--   local selected = complete_info.selected
--   if vim.fn.pumvisible() > 0 and selected >= -1 then
--     return vim.fn['compe#confirm']('<CR>')
--   end
--   return vim.api.nvim_replace_termcodes('<CR>', true, false, true)
-- end

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", { noremap = true, silent = true })
end

local on_attach = function(client, bufnr)
  -- mappings
  mapper('n', 'gD', 'vim.lsp.buf.declaration()>')
  mapper('n', 'K', 'vim.lsp.buf.hover()')
  mapper('n', '<C-k>', 'vim.lsp.buf.signature_help()')
  mapper('n', 'gr', 'vim.lsp.buf.references()')
  mapper('n', '<Leader>dl', 'vim.lsp.diagnostic.show_line_diagnostics()')
  mapper('n', '<Leader>dq', 'vim.lsp.diagnostic.set_loclist()')
  mapper('n', '[d', 'vim.lsp.diagnostic.goto_prev()')
  mapper('n', ']d', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<Leader>ca', 'vim.lsp.buf.code_action()')
  mapper('n', '<space>rn', 'vim.lsp.buf.rename()')
  -- mapper('i', '<CR>', 'v:lua.completion_confirm()')
  mapper('i', '<C-e>', 'compe#close()')

  require'lsp_signature'.on_attach({
    bind = true,
    handler_opts = {
      border = "none"
    }
  })

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#2d2c5d
      hi LspReferenceText cterm=bold ctermbg=red guibg=#2d2c5d
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#2d2c5d
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold, CursorHoldI <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
        autocmd CursorHold, CursorHoldI <buffer> lua require'nvim-lightbulb'.update_lightbulb()
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      augroup clearReferences
        autocmd!
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      augroup diagnosticsFix
        autocmd!
        autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})
      augroup END
    ]], false)
  end
end

local function setup_ls(ls, ls_cmd, backup, backup_cmd, passed_settings)
  if type(ls_cmd) == "string" then
    ls_cmd = { ls_cmd }
  end
  if backup_cmd and type(backup_cmd) == "string" then
    backup_cmd = { backup_cmd }
  end
  if util.has_bins(ls_cmd[1]) then
    lspconfig[ls].setup{
      on_attach = on_attach,
      cmd = ls_cmd,
      settings = passed_settings,
    }
  elseif backup and backup_cmd and util.has_bins(backup_cmd[1]) then
    lspconfig[backup].setup{
      on_attach = on_attach,
      cmd = backup_cmd,
      settings = passed_settings,
    }
  end
end

setup_ls("tsserver", { "typescript-language-server", "--stdio" }) -- npm i -g typescript-language-server
setup_ls("html", { "html-languageserver", "--stdio" })
setup_ls("jsonls", { "vscode-json-languageserver", "--stdio" }) -- npm i -g vscode-json-languageserver
-- setup_ls("sumneko_lua", "lua-language-server", nil, nil, lua_settings)

-- npm i -g diagnostic-languageserver
if util.has_bins('diagnostic-languageserver') then
  lspconfig.diagnosticls.setup{
    cmd = { "diagnostic-languageserver", "--stdio" },
    filetypes = { "sh" },
    on_attach = on_attach,
    init_options = {
      filetypes = {
        sh = "shellcheck",
      },
      linters = {
        shellcheck = {
          sourceName = "shellcheck",
          command = "shellcheck",
          debounce = 100,
          args = { "--format=gcc", "-" },
          offsetLine = 0,
          offsetColumn = 0,
          formatLines = 1,
          formatPattern = {
            "^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
            {
              line = 1,
              column = 2,
              message = 4,
              security = 3
            }
          },
          securities = {
            error = "error",
            warning = "warning",
          }
        },
      }
    }
  }
end
