local status, mason = pcall(require, "mason")
if not status then
	return
end

mason.setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})

local ensure_installed = {
	"cssls",
	"html",
	"jsonls",
	"lua_ls",
	"yamlls",
}

local mason_status, mason_config = pcall(require, "mason-lspconfig")
if not mason_status then
	return
end

mason_config.setup({
	ensure_installed = ensure_installed,
	automatic_installation = true,
})
