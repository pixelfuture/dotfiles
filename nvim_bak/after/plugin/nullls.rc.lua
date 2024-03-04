local status, null_ls = pcall(require, "null-ls")
if not status then return end

local status2, prettier = pcall(require, "prettier")
if not status2 then return end


local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false})
local event = "BufWritePre"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>gq", function ()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "LSP Format" })
    end

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function ()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "LSP format on save",
    })
  end
})

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "scss",
    "typescript",
    "typescriptreact",
  },
})
