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

-- Find more schemas here: https://www.schemastore.org/json/
lsp_defaults.settings = {
	json = {
		schemas = {
			{
				description = "TypeScript compiler configuration file",
				fileMatch = {
					"tsconfig.json",
					"tsconfig.*.json",
				},
				url = "https://json.schemastore.org/tsconfig.json",
			},
			{
				description = "Babel configuration",
				fileMatch = {
					".babelrc.json",

					".babelrc",
					"babel.config.json",
				},
				url = "https://json.schemastore.org/babelrc.json",
			},
			{
				description = "ESLint config",
				fileMatch = {
					".eslintrc.json",
					".eslintrc",
				},
				url = "https://json.schemastore.org/eslintrc.json",
			},
			{
				description = "Prettier config",
				fileMatch = {
					".prettierrc",
					".prettierrc.json",
					"prettier.config.json",
				},
				url = "https://json.schemastore.org/prettierrc",
			},
			{
				description = "Stylelint config",
				fileMatch = {
					".stylelintrc",
					".stylelintrc.json",
					"stylelint.config.json",
				},
				url = "https://json.schemastore.org/stylelintrc",
			},
			{
				description = "NPM configuration file",
				fileMatch = {
					"package.json",
				},
				url = "https://json.schemastore.org/package.json",
			},
		},
	},
}

lspconfig.jsonls.setup(lsp_defaults)
