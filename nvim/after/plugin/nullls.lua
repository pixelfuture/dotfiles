local nullls_status, nullls = pcall(require, "null-ls")
if not nullls_status then
	return
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

-- setup typescript lsp
local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
	return
end

nullls.setup({
	on_attach = on_attach,
	sources = {
		-- nullls.builtins.formatting.prettier,
		nullls.builtins.formatting.prettierd,
		nullls.builtins.formatting.stylua,
		-- nullls.builtins.diagnostics.eslint,
		nullls.builtins.diagnostics.eslint_d,
		nullls.builtins.code_actions.eslint_d,
		nullls.builtins.code_actions.refactoring,
		require("typescript.extensions.null-ls.code-actions"),
		-- nullls.builtins.completion.spell,
	},
})
