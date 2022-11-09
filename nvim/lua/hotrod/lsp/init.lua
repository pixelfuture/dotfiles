local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("hotrod.lsp.lsp-installer")
require("hotrod.lsp.handlers").setup()
