local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	border = "rounded",
	-- 	width = 60,
	-- })

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_keymaps()
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	-- vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
	vim.keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
	--vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
	vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")
	vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
	-- vim.keymap.set("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
	vim.keymap.set("n", "<leader>gq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
	return
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		-- client.server_capabilities.document_formatting = false
		client.server_capabilities.document_formatting = true
	end
	navic.attach(client, bufnr)
	vim.o.winbar = "%#StatusLine# %f > %{%v:lua.require'nvim-navic'.get_location()%}"
	lsp_keymaps()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
