local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
	return
end

neodev.setup()

local lsp_status, lspconfig = pcall(require, "lspconfig")
if not lsp_status then
	return
end

local cmp_status, cmp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
	return
end

local lsp_defaults = lspconfig.util.default_config
local cmp_capabilities = cmp.default_capabilities()

lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_capabilities)

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
