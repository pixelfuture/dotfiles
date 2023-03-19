local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"lua_ls",
	"rust_analyzer",
})

-- mappings: https://github.com/VonHeikemen/lsp-zero.nvim
-- or use :Telescope keymap

lsp.nvim_workspace()

lsp.setup()
