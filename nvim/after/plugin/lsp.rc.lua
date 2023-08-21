local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then return end

local status_ok2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok2 then return end

local status_ok3  = pcall(require, "cmp_nvim_lsp")
if not status_ok3 then return end

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}
-- LSP Attach Autocommand to map keys
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(ev.buf, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    local imap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('i', keys, func, { buffer = ev.buf, desc = desc })
    end
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
    end
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
    imap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
    -- lots of servers do not implement this so we have to get hacky
    nmap("gD", function () vim.fn.searchdecl(vim.fn.expand "<cword>") end, "[G]oto local [D]eclaration")
    -- nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<Leader>rn", vim.lsp.buf.rename, "[R]e[n]ame") -- handled by Lspsaga
    -- nmap("<Leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction") -- handled by Lspsaga
    -- nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences") -- using Telescope instead
    -- nmap("<space>D", vim.lsp.buf.type_definition, "Jump to type definition") -- using gd instead
    nmap("<Leader>d", function ()
      vim.diagnostic.open_float({ border = "rounded" })
    end, "Open floating [d]iagnostic message")
  end,
})

local servers = {
  cssls = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },
  jsonls = {},
  rust_analyzer = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}


mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
	automatic_installation = true,
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border}),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border}),
}
local on_attach = function (client, bufnr)
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
    hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
    hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
    hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      handlers = handlers,
      capabilities = capabilities,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
      on_attach = on_attach,
    }
  end
}
