local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lsp_status then
	return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
	return
end

local cmp_status, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
	return
end

local lsp_defaults = lspconfig.util.default_config
local cmp_capabilities = cmp.default_capabilities()

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_capabilities)

typescript.setup(lsp_defaults)
